/*
    FoodCampus - Script de Seed Data (Pedidos y Detalles)
    Ingeniero de Datos: Order Simulation Specialist
    Motor: SQL Server 2022 Express
    Base de Datos: demo_utm_macq
    Fecha: 2026-03-06
*/

USE demo_utm_macq;
GO

-- Limpiar tablas de pedidos previas
DELETE FROM dbo.DetallePedido;
DELETE FROM dbo.Pedido;
GO

-- Resetear IDENTITY
DBCC CHECKIDENT ('dbo.Pedido', RESEED, 0);
DBCC CHECKIDENT ('dbo.DetallePedido', RESEED, 0);
GO

---------------------------------------------------------
-- GENERACIÓN DE 500 PEDIDOS SIMULADOS
---------------------------------------------------------
SET NOCOUNT ON;

DECLARE @PedidoID INT;
DECLARE @EstudianteID INT;
DECLARE @ProductoID INT;
DECLARE @PrecioUnitario DECIMAL(10,2);
DECLARE @Cantidad INT;
DECLARE @FechaPedido DATETIME2;
DECLARE @TotalPedido DECIMAL(10,2);
DECLARE @ItemsPorPedido INT;
DECLARE @i INT = 1;

-- Asegurarse de que hay estudiantes y productos
IF NOT EXISTS (SELECT 1 FROM dbo.Estudiante) OR NOT EXISTS (SELECT 1 FROM dbo.Producto)
BEGIN
    PRINT 'Error: No hay estudiantes o productos en la base de datos para generar pedidos.';
    RETURN;
END

WHILE @i <= 500
BEGIN
    -- 1. Seleccionar un estudiante aleatorio
    SELECT TOP 1 @EstudianteID = EstudianteID FROM dbo.Estudiante ORDER BY NEWID();

    -- 2. Generar una fecha aleatoria en 2025
    -- (Diferencia de días: 365. Segundos: 31536000)
    SET @FechaPedido = DATEADD(SECOND, ABS(CHECKSUM(NEWID())) % 31536000, '2025-01-01 08:00:00');

    -- 3. Crear el encabezado del pedido con Total 0 (se actualizará después)
    INSERT INTO dbo.Pedido (EstudianteID, FechaPedido, Total)
    VALUES (@EstudianteID, @FechaPedido, 0);
    
    SET @PedidoID = SCOPE_IDENTITY();

    -- 4. Determinar cuántos productos tendrá el pedido (1 a 4)
    SET @ItemsPorPedido = (ABS(CHECKSUM(NEWID())) % 4) + 1;
    SET @TotalPedido = 0;

    -- 5. Insertar los detalles del pedido
    DECLARE @j INT = 1;
    WHILE @j <= @ItemsPorPedido
    BEGIN
        -- Seleccionar un producto aleatorio y su precio
        SELECT TOP 1 @ProductoID = ProductoID, @PrecioUnitario = Precio 
        FROM dbo.Producto ORDER BY NEWID();

        SET @Cantidad = (ABS(CHECKSUM(NEWID())) % 3) + 1; -- 1 a 3 unidades

        INSERT INTO dbo.DetallePedido (PedidoID, ProductoID, Cantidad, PrecioUnitario)
        VALUES (@PedidoID, @ProductoID, @Cantidad, @PrecioUnitario);

        SET @TotalPedido = @TotalPedido + (@Cantidad * @PrecioUnitario);
        SET @j = @j + 1;
    END

    -- 6. Actualizar el Total en el encabezado del Pedido
    UPDATE dbo.Pedido SET Total = @TotalPedido WHERE PedidoID = @PedidoID;

    SET @i = @i + 1;
END

PRINT 'Simulación de 500 pedidos y sus detalles completada exitosamente.';
GO
