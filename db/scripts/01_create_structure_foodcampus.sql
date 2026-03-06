/*
    FoodCampus - Script de Estructura de Base de Datos
    Arquitecto: Senior Database Architect
    Motor: SQL Server 2022 Express
    Base de Datos: demo_utm_macq
    Fecha: 2026-03-06
*/

-- Crear la base de datos si no existe
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'demo_utm_macq')
BEGIN
    CREATE DATABASE demo_utm_macq;
END
GO

USE demo_utm_macq;
GO

-- 1. Tabla Estudiante
IF OBJECT_ID('dbo.Estudiante', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Estudiante (
        EstudianteID INT IDENTITY(1,1) PRIMARY KEY,
        NombreCompleto NVARCHAR(150) NOT NULL,
        Email NVARCHAR(150) NOT NULL,
        Carrera NVARCHAR(100) NOT NULL,
        Activo BIT NOT NULL DEFAULT 1,
        CONSTRAINT UK_Estudiante_Email UNIQUE (Email)
    );
    CREATE INDEX IX_Estudiante_Email ON dbo.Estudiante(Email);
END
GO

-- 2. Tabla Producto
IF OBJECT_ID('dbo.Producto', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Producto (
        ProductoID INT IDENTITY(1,1) PRIMARY KEY,
        Nombre NVARCHAR(150) NOT NULL,
        Categoria NVARCHAR(100),
        Precio DECIMAL(10,2) NOT NULL,
        Stock INT NOT NULL DEFAULT 0
    );
    CREATE INDEX IX_Producto_Nombre ON dbo.Producto(Nombre);
END
GO

-- 3. Tabla Pedido
IF OBJECT_ID('dbo.Pedido', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Pedido (
        PedidoID INT IDENTITY(1,1) PRIMARY KEY,
        EstudianteID INT NOT NULL,
        FechaPedido DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
        Total DECIMAL(10,2) NOT NULL,
        CONSTRAINT FK_Pedido_Estudiante FOREIGN KEY (EstudianteID) 
            REFERENCES dbo.Estudiante(EstudianteID)
    );
    CREATE INDEX IX_Pedido_EstudianteID ON dbo.Pedido(EstudianteID);
END
GO

-- 4. Tabla DetallePedido
IF OBJECT_ID('dbo.DetallePedido', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.DetallePedido (
        DetalleID INT IDENTITY(1,1) PRIMARY KEY,
        PedidoID INT NOT NULL,
        ProductoID INT NOT NULL,
        Cantidad INT NOT NULL CHECK (Cantidad > 0),
        PrecioUnitario DECIMAL(10,2) NOT NULL,
        CONSTRAINT FK_DetallePedido_Pedido FOREIGN KEY (PedidoID) 
            REFERENCES dbo.Pedido(PedidoID),
        CONSTRAINT FK_DetallePedido_Producto FOREIGN KEY (ProductoID) 
            REFERENCES dbo.Producto(ProductoID)
    );
    CREATE INDEX IX_DetallePedido_PedidoID ON dbo.DetallePedido(PedidoID);
END
GO
