/*
    FoodCampus - Reporte Ejecutivo Final (Dashboard SQL)
    Arquitecto de Sistemas: Executive Reporting Specialist
    Motor: SQL Server 2022 Express
    Base de Datos: demo_utm_macq
    Fecha: 2026-03-06
*/

USE demo_utm_macq;
GO

---------------------------------------------------------
-- REPORTE EJECUTIVO CONSOLIDADO
-- Presenta los indicadores clave de rendimiento (KPIs) en una sola fila.
---------------------------------------------------------
WITH 
Estudiantes_KPI AS (
    SELECT COUNT(*) AS TotalEstudiantes FROM dbo.Estudiante
),
Productos_KPI AS (
    SELECT COUNT(*) AS TotalProductos FROM dbo.Producto
),
Pedidos_KPI AS (
    SELECT 
        COUNT(*) AS TotalPedidos,
        SUM(Total) AS IngresosTotales
    FROM dbo.Pedido
),
ProductoTop_KPI AS (
    SELECT TOP 1 
        p.Nombre AS ProductoMasVendido,
        SUM(dp.Cantidad) AS Unidades
    FROM dbo.DetallePedido dp
    JOIN dbo.Producto p ON dp.ProductoID = p.ProductoID
    GROUP BY p.Nombre
    ORDER BY SUM(dp.Cantidad) DESC
)
SELECT 
    e.TotalEstudiantes,
    pr.TotalProductos,
    pe.TotalPedidos,
    FORMAT(pe.IngresosTotales, 'C', 'es-MX') AS IngresosGlobales,
    pt.ProductoMasVendido + ' (' + CAST(pt.Unidades AS VARCHAR) + ' u)' AS TopProducto
FROM Estudiantes_KPI e, Productos_KPI pr, Pedidos_KPI pe, ProductoTop_KPI pt;
GO

---------------------------------------------------------
-- REPORTE DETALLADO POR CATEGORÍA (Visión Operativa)
---------------------------------------------------------
SELECT 
    p.Categoria,
    COUNT(DISTINCT p.ProductoID) AS CantidadProductos,
    SUM(dp.Cantidad) AS UnidadesVendidas,
    FORMAT(SUM(dp.Cantidad * dp.PrecioUnitario), 'C', 'es-MX') AS VentasTotales
FROM dbo.Producto p
LEFT JOIN dbo.DetallePedido dp ON p.ProductoID = dp.ProductoID
GROUP BY p.Categoria
ORDER BY SUM(dp.Cantidad * dp.PrecioUnitario) DESC;
GO

---------------------------------------------------------
-- ESTADO DE INTEGRIDAD DE DATOS
---------------------------------------------------------
SELECT 
    'Estudiantes' AS Entidad, COUNT(*) AS Registros FROM dbo.Estudiante
UNION ALL
    SELECT 'Productos', COUNT(*) FROM dbo.Producto
UNION ALL
    SELECT 'Pedidos', COUNT(*) FROM dbo.Pedido
UNION ALL
    SELECT 'Detalles', COUNT(*) FROM dbo.DetallePedido;
GO
