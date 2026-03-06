/*
    FoodCampus - Consultas de Análisis de Datos
    Analista: Senior Data Analyst
    Motor: SQL Server 2022 Express
    Base de Datos: demo_utm_macq
    Fecha: 2026-03-06
*/

USE demo_utm_macq;
GO

---------------------------------------------------------
-- 1. PRODUCTOS MÁS VENDIDOS (Top 15)
-- Analiza el volumen total de unidades vendidas por producto.
---------------------------------------------------------
SELECT TOP 15 
    p.Nombre, 
    p.Categoria, 
    SUM(dp.Cantidad) AS UnidadesVendidas,
    FORMAT(SUM(dp.Cantidad * dp.PrecioUnitario), 'C', 'es-MX') AS IngresosGenerados
FROM dbo.DetallePedido dp
JOIN dbo.Producto p ON dp.ProductoID = p.ProductoID
GROUP BY p.Nombre, p.Categoria
ORDER BY UnidadesVendidas DESC;
GO

---------------------------------------------------------
-- 2. TOTAL DE VENTAS POR DÍA
-- Agrupa las ventas por fecha para identificar tendencias.
---------------------------------------------------------
SELECT 
    CAST(FechaPedido AS DATE) AS Fecha, 
    COUNT(PedidoID) AS TotalPedidos,
    FORMAT(SUM(Total), 'C', 'es-MX') AS VentaDiaria
FROM dbo.Pedido
GROUP BY CAST(FechaPedido AS DATE)
ORDER BY Fecha;
GO

---------------------------------------------------------
-- 3. GASTO PROMEDIO POR ESTUDIANTE
-- Calcula cuánto gasta en promedio cada estudiante que ha realizado compras.
---------------------------------------------------------
SELECT 
    FORMAT(AVG(SubTotalEstudiante), 'C', 'es-MX') AS GastoPromedioPorEstudiante
FROM (
    SELECT EstudianteID, SUM(Total) AS SubTotalEstudiante
    FROM dbo.Pedido
    GROUP BY EstudianteID
) AS GastosPorEstudiante;
GO

---------------------------------------------------------
-- 4. TOP 10 ESTUDIANTES CON MAYOR GASTO
-- Identifica a los clientes más frecuentes/valiosos.
---------------------------------------------------------
SELECT TOP 10 
    e.NombreCompleto, 
    e.Carrera, 
    COUNT(p.PedidoID) AS NumeroDePedidos,
    FORMAT(SUM(p.Total), 'C', 'es-MX') AS GastoTotalAcumulado
FROM dbo.Pedido p
JOIN dbo.Estudiante e ON p.EstudianteID = e.EstudianteID
GROUP BY e.NombreCompleto, e.Carrera
ORDER BY SUM(p.Total) DESC;
GO

---------------------------------------------------------
-- 5. VENTAS POR CATEGORÍA (Métrica Adicional)
-- Ayuda a entender qué tipo de alimentos son los preferidos.
---------------------------------------------------------
SELECT 
    p.Categoria, 
    SUM(dp.Cantidad) AS UnidadesVendidas,
    FORMAT(SUM(dp.Cantidad * dp.PrecioUnitario), 'C', 'es-MX') AS TotalPorCategoria
FROM dbo.DetallePedido dp
JOIN dbo.Producto p ON dp.ProductoID = p.ProductoID
GROUP BY p.Categoria
ORDER BY SUM(dp.Cantidad * dp.PrecioUnitario) DESC;
GO
