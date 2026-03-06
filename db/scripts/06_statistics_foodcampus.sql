/*
    FoodCampus - Estadísticas Descriptivas del Sistema
    Científico de Datos: Data Science Specialist
    Motor: SQL Server 2022 Express
    Base de Datos: demo_utm_macq
    Fecha: 2026-03-06
*/

USE demo_utm_macq;
GO

---------------------------------------------------------
-- 1. PROMEDIO DE PEDIDOS POR ESTUDIANTE
-- Mide la frecuencia de compra de los usuarios activos.
---------------------------------------------------------
SELECT 
    COUNT(PedidoID) AS TotalPedidos,
    COUNT(DISTINCT EstudianteID) AS EstudiantesConCompras,
    CAST(CAST(COUNT(PedidoID) AS DECIMAL(10,2)) / COUNT(DISTINCT EstudianteID) AS DECIMAL(10,2)) AS PromedioPedidosPorEstudiante
FROM dbo.Pedido;
GO

---------------------------------------------------------
-- 2. PROMEDIO DE GASTO POR PEDIDO (Ticket Promedio)
-- Indica el valor medio de cada transacción en el sistema.
---------------------------------------------------------
SELECT 
    FORMAT(AVG(Total), 'C', 'es-MX') AS TicketPromedioPorPedido,
    FORMAT(MIN(Total), 'C', 'es-MX') AS PedidoMinimo,
    FORMAT(MAX(Total), 'C', 'es-MX') AS PedidoMaximo
FROM dbo.Pedido;
GO

---------------------------------------------------------
-- 3. DESVIACIÓN ESTÁNDAR DE VENTAS (Variabilidad)
-- Muestra qué tanto varían los montos de los pedidos respecto al promedio.
---------------------------------------------------------
SELECT 
    FORMAT(AVG(Total), 'C', 'es-MX') AS MediaVentas,
    FORMAT(STDEV(Total), 'C', 'es-MX') AS DesviacionEstandarVentas,
    CAST((STDEV(Total) / AVG(Total)) * 100 AS DECIMAL(10,2)) AS CoeficienteVariacionPorcentaje
FROM dbo.Pedido;
GO

---------------------------------------------------------
-- 4. TOTAL DE VENTAS DEL SISTEMA (KPI Global)
-- Resumen general del flujo de efectivo acumulado.
---------------------------------------------------------
SELECT 
    COUNT(PedidoID) AS VolumenTotalPedidos,
    SUM(Total) AS TotalIngresosNumerico,
    FORMAT(SUM(Total), 'C', 'es-MX') AS TotalIngresosFormateado
FROM dbo.Pedido;
GO

---------------------------------------------------------
-- 5. ESTADÍSTICAS POR CARRERA (Análisis por Segmento)
---------------------------------------------------------
SELECT 
    e.Carrera,
    COUNT(p.PedidoID) AS NumeroPedidos,
    FORMAT(SUM(p.Total), 'C', 'es-MX') AS GastoTotal,
    FORMAT(AVG(p.Total), 'C', 'es-MX') AS GastoPromedio
FROM dbo.Pedido p
JOIN dbo.Estudiante e ON p.EstudianteID = e.EstudianteID
GROUP BY e.Carrera
ORDER BY SUM(p.Total) DESC;
GO
