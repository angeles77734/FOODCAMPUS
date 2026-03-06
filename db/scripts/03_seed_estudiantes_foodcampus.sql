/*
    FoodCampus - Script de Seed Data (Estudiantes)
    Ingeniero de Datos: Academic Simulation Specialist
    Motor: SQL Server 2022 Express
    Base de Datos: demo_utm_macq
    Fecha: 2026-03-06
*/

USE demo_utm_macq;
GO

-- Limpiar tabla previa para evitar duplicados en re-ejecución
-- (Se asume que no hay pedidos asociados o que se están limpiando en cascada)
DELETE FROM dbo.DetallePedido;
DELETE FROM dbo.Pedido;
DELETE FROM dbo.Estudiante;
GO

-- Resetear IDENTITY
DBCC CHECKIDENT ('dbo.Estudiante', RESEED, 0);
GO

---------------------------------------------------------
-- GENERACIÓN DE 200 ESTUDIANTES REALISTAS
---------------------------------------------------------
DECLARE @i INT = 1;
DECLARE @Nombre NVARCHAR(50), @Apellido NVARCHAR(50), @Carrera NVARCHAR(100), @Email NVARCHAR(150);

-- Tablas temporales para aleatoriedad controlada
DECLARE @Nombres TABLE (ID INT IDENTITY(1,1), Val NVARCHAR(50));
INSERT INTO @Nombres (Val) VALUES 
('Juan'), ('Maria'), ('Pedro'), ('Ana'), ('Luis'), ('Elena'), ('Carlos'), ('Sofia'), ('Miguel'), ('Lucia'),
('Jorge'), ('Laura'), ('Diego'), ('Carmen'), ('Roberto'), ('Martha'), ('Francisco'), ('Guadalupe'), ('Ricardo'), ('Patricia');

DECLARE @Apellidos TABLE (ID INT IDENTITY(1,1), Val NVARCHAR(50));
INSERT INTO @Apellidos (Val) VALUES 
('Garcia'), ('Hernandez'), ('Lopez'), ('Martinez'), ('Gonzalez'), ('Rodriguez'), ('Perez'), ('Sanchez'), ('Ramirez'), ('Flores'),
('Cruz'), ('Gomez'), ('Morales'), ('Vazquez'), ('Reyes'), ('Jimenez'), ('Torres'), ('Diaz'), ('Gutierrez'), ('Ruiz');

DECLARE @Carreras TABLE (ID INT IDENTITY(1,1), Val NVARCHAR(100));
INSERT INTO @Carreras (Val) VALUES 
('Ingeniería en Sistemas'), ('Ingeniería Industrial'), ('Administración'), ('Gastronomía'), ('Contaduría'), ('Marketing');

WHILE @i <= 200
BEGIN
    -- Seleccionar datos basados en el índice para evitar duplicidad total y mantener realismo
    SELECT @Nombre = Val FROM @Nombres WHERE ID = (@i % 20) + 1;
    SELECT @Apellido = Val FROM @Apellidos WHERE ID = ((@i + 5) % 20) + 1;
    SELECT @Carrera = Val FROM @Carreras WHERE ID = (@i % 6) + 1;
    
    -- Generar Email institucional único
    SET @Email = LOWER(@Nombre + '.' + @Apellido + CAST(@i AS NVARCHAR(10)) + '@utm.edu.mx');
    
    INSERT INTO dbo.Estudiante (NombreCompleto, Email, Carrera, Activo)
    VALUES (
        @Nombre + ' ' + @Apellido + ' ' + (SELECT Val FROM @Apellidos WHERE ID = ((@i + 10) % 20) + 1), 
        @Email, 
        @Carrera, 
        1
    );
    
    SET @i = @i + 1;
END

-- Verificar inserción
PRINT 'Inserción de 200 estudiantes completada con éxito.';
GO
