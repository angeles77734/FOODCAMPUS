/*
    FoodCampus - Análisis de Pareto (80/20)
    Analista: Inventory Optimization Specialist
    Motor: SQL Server 2022 Express
    Base de Datos: demo_utm_macq
    Fecha: 2026-03-06
*/

USE demo_utm_macq;
GO

---------------------------------------------------------
-- ANÁLISIS DE PARETO DE PRODUCTOS (80/20)
-- Identifica el 20% de los productos que generan el 80% de las ventas.
---------------------------------------------------------
WITH VentasPorProducto AS (
    SELECT 
        p.ProductoID,
        p.Nombre,
        p.Categoria,
        SUM(dp.Cantidad) AS UnidadesVendidas,
        SUM(dp.Cantidad * dp.PrecioUnitario) AS IngresosTotales
    FROM dbo.Producto p
    LEFT JOIN dbo.DetallePedido dp ON p.ProductoID = dp.ProductoID
    GROUP BY p.ProductoID, p.Nombre, p.Categoria
),
CalculoAcumulado AS (
    SELECT 
        Nombre,
        Categoria,
        UnidadesVendidas,
        IngresosTotales,
        SUM(IngresosTotales) OVER (ORDER BY IngresosTotales DESC) AS IngresoAcumulado,
        SUM(IngresosTotales) OVER () AS IngresoGlobal
    FROM VentasPorProducto
),
AnalisisPareto AS (
    SELECT 
        Nombre,
        Categoria,
        UnidadesVendidas,
        FORMAT(IngresosTotales, 'C', 'es-MX') AS Ventas,
        CAST((IngresoAcumulado / IngresoGlobal) * 100 AS DECIMAL(10,2)) AS PorcentajeAcumulado,
        CASE 
            WHEN (IngresoAcumulado / IngresoGlobal) <= 0.80 THEN 'A (Crítico - 80%)'
            WHEN (IngresoAcumulado / IngresoGlobal) <= 0.95 THEN 'B (Importante - 15%)'
            ELSE 'C (Menor - 5%)'
        END AS ClasificacionABC
    FROM CalculoAcumulado
)
SELECT * 
FROM AnalisisPareto
ORDER BY PorcentajeAcumulado ASC;
GO

---------------------------------------------------------
-- RESUMEN EJECUTIVO DE PARETO
---------------------------------------------------------
WITH Resumen AS (
    SELECT 
        p.ProductoID,
        SUM(dp.Cantidad * dp.PrecioUnitario) AS Ingresos
    FROM dbo.Producto p
    JOIN dbo.DetallePedido dp ON p.ProductoID = dp.ProductoID
    GROUP BY p.ProductoID
),
Totales AS (
    SELECT 
        COUNT(*) AS TotalProductos,
        SUM(Ingresos) AS VentasTotales
    FROM Resumen
),
Top20 AS (
    SELECT 
        COUNT(*) AS ProductosTop,
        SUM(Ingresos) AS VentasTop
    FROM (
        SELECT TOP 20 PERCENT Ingresos 
        FROM Resumen 
        ORDER BY Ingresos DESC
    ) AS Sub
)
SELECT 
    t.TotalProductos,
    tp.ProductosTop AS Cantidad_20_Porciento,
    FORMAT(t.VentasTotales, 'C', 'es-MX') AS VentasGlobales,
    FORMAT(tp.VentasTop, 'C', 'es-MX') AS VentasGeneradas_Top20,
    CAST((tp.VentasTop / t.VentasTotales) * 100 AS DECIMAL(10,2)) AS Eficiencia_Pareto_Real
FROM Totales t, Top20 tp;
GO
