USE demo_utm_macq;
IF OBJECT_ID('dbo.Restaurante', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.Restaurante (
        RestauranteID INT IDENTITY(1,1) PRIMARY KEY,
        Nombre NVARCHAR(150) NOT NULL,
        Especialidad NVARCHAR(100),
        Ubicacion NVARCHAR(200),
        Activo BIT DEFAULT 1
    );
END

-- Vincular productos a restaurantes (si no existe la columna)
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('dbo.Producto') AND name = 'RestauranteID')
BEGIN
    ALTER TABLE dbo.Producto ADD RestauranteID INT;
    -- Por ahora, todos al restaurante principal (ID 1)
END
