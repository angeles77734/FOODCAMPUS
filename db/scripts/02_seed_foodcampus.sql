/*
    FoodCampus - Script de Seed Data
    Ingeniero: Data Engineer Specialist
    Motor: Microsoft SQL Server 2022
    Fecha: 2026-03-06
*/

USE FoodCampus;
GO

-- Limpiar datos previos si existen (opcional, para re-ejecución limpia)
DELETE FROM dbo.DetallePedido;
DELETE FROM dbo.Pedido;
DELETE FROM dbo.Producto;
DELETE FROM dbo.Estudiante;
GO

-- Resetear IDENTITY
DBCC CHECKIDENT ('dbo.Producto', RESEED, 0);
DBCC CHECKIDENT ('dbo.Estudiante', RESEED, 0);
GO

---------------------------------------------------------
-- 1. INSERTAR PRODUCTOS (80 registros)
---------------------------------------------------------
INSERT INTO dbo.Producto (Nombre, Categoria, Precio, Disponible) VALUES
-- Desayunos (16)
('Chilaquiles Verdes con Pollo', 'Desayunos', 65.00, 1),
('Chilaquiles Rojos con Huevo', 'Desayunos', 60.00, 1),
('Huevos a la Mexicana', 'Desayunos', 55.00, 1),
('Huevos con Jamón', 'Desayunos', 55.00, 1),
('Molletes Sencillos (2 pzas)', 'Desayunos', 45.00, 1),
('Molletes con Chorizo', 'Desayunos', 50.00, 1),
('Sandwich de Jamón y Queso', 'Desayunos', 35.00, 1),
('Bagel de Salmón y Crema', 'Desayunos', 85.00, 1),
('Hot Cakes con Miel (3 pzas)', 'Desayunos', 50.00, 1),
('Waffles con Fruta', 'Desayunos', 60.00, 1),
('Omelette de Espinacas', 'Desayunos', 65.00, 1),
('Enchiladas Suizas (3 pzas)', 'Desayunos', 75.00, 1),
('Tostado de Aguacate', 'Desayunos', 45.00, 1),
('Yogurt con Granola y Miel', 'Desayunos', 40.00, 1),
('Plato de Fruta de Temporada', 'Desayunos', 45.00, 1),
('Torta de Tamal (Guajolota)', 'Desayunos', 30.00, 1),
-- Bebidas (16)
('Café Americano 12oz', 'Bebidas', 25.00, 1),
('Café Capuchino 12oz', 'Bebidas', 40.00, 1),
('Café Latte 12oz', 'Bebidas', 40.00, 1),
('Té de Manzanilla', 'Bebidas', 20.00, 1),
('Té Verde Helado', 'Bebidas', 25.00, 1),
('Jugo de Naranja Natural', 'Bebidas', 35.00, 1),
('Jugo Verde Energetizante', 'Bebidas', 45.00, 1),
('Licuado de Plátano', 'Bebidas', 40.00, 1),
('Licuado de Fresa', 'Bebidas', 40.00, 1),
('Refresco de Cola 600ml', 'Bebidas', 22.00, 1),
('Agua Mineral 500ml', 'Bebidas', 18.00, 1),
('Agua Natural 600ml', 'Bebidas', 15.00, 1),
('Agua de Jamaica 500ml', 'Bebidas', 20.00, 1),
('Agua de Horchata 500ml', 'Bebidas', 20.00, 1),
('Malteada de Chocolate', 'Bebidas', 55.00, 1),
('Malteada de Vainilla', 'Bebidas', 55.00, 1),
-- Snacks (16)
('Papas Sabritas Original', 'Snacks', 18.00, 1),
('Doritos Nachos', 'Snacks', 18.00, 1),
('Galletas Marias', 'Snacks', 15.00, 1),
('Galletas de Chispas de Chocolate', 'Snacks', 15.00, 1),
('Barra de Granola Naturals', 'Snacks', 12.00, 1),
('Nueces Mixtas 50g', 'Snacks', 35.00, 1),
('Arándanos Deshidratados', 'Snacks', 25.00, 1),
('Palomitas de Mantequilla', 'Snacks', 20.00, 1),
('Manzana con Chile y Limón', 'Snacks', 25.00, 1),
('Jícama y Zanahoria Rayada', 'Snacks', 25.00, 1),
('Cacahuates Japoneses', 'Snacks', 15.00, 1),
('Gomitas de Panditas', 'Snacks', 15.00, 1),
('Mantecadas (2 pzas)', 'Snacks', 22.00, 1),
('Barrita Marinela', 'Snacks', 18.00, 1),
('Palanqueta de Cacahuate', 'Snacks', 15.00, 1),
('Nachos con Queso', 'Snacks', 45.00, 1),
-- Comida Rápida (16)
('Hamburguesa Sencilla', 'Comida rápida', 65.00, 1),
('Hamburguesa con Queso y Tocino', 'Comida rápida', 85.00, 1),
('Hamburguesa Doble Carne', 'Comida rápida', 110.00, 1),
('Hot Dog Clásico', 'Comida rápida', 35.00, 1),
('Hot Dog con Tocino', 'Comida rápida', 45.00, 1),
('Pizza Slice Pepperoni', 'Comida rápida', 40.00, 1),
('Pizza Slice Hawaiana', 'Comida rápida', 40.00, 1),
('Orden de Tacos al Pastor (3 pzas)', 'Comida rápida', 60.00, 1),
('Orden de Tacos de Bistec (3 pzas)', 'Comida rápida', 65.00, 1),
('Burrito de Pollo', 'Comida rápida', 55.00, 1),
('Burrito de Deshebrada', 'Comida rápida', 55.00, 1),
('Torta de Jamón', 'Comida rápida', 45.00, 1),
('Torta de Milanesa', 'Comida rápida', 65.00, 1),
('Sincronizada Gigante', 'Comida rápida', 50.00, 1),
('Nuggets de Pollo (6 pzas)', 'Comida rápida', 55.00, 1),
('Papas a la Francesa Grandes', 'Comida rápida', 45.00, 1),
-- Postres (16)
('Rebanada de Pastel de Chocolate', 'Postres', 50.00, 1),
('Pay de Queso con Zarzamora', 'Postres', 45.00, 1),
('Gelatina de Mosaico', 'Postres', 25.00, 1),
('Flan Napolitano', 'Postres', 35.00, 1),
('Arroz con Leche Especial', 'Postres', 30.00, 1),
('Brownie de Chocolate', 'Postres', 35.00, 1),
('Muffin de Arándano', 'Postres', 30.00, 1),
('Donas de Azúcar (2 pzas)', 'Postres', 28.00, 1),
('Ensalada de Manzana Dulce', 'Postres', 40.00, 1),
('Helado de Vainilla (2 bolas)', 'Postres', 35.00, 1),
('Helado de Chocolate (2 bolas)', 'Postres', 35.00, 1),
('Churros con Azúcar (3 pzas)', 'Postres', 30.00, 1),
('Carlota de Limón', 'Postres', 35.00, 1),
('Fresas con Crema', 'Postres', 45.00, 1),
('Crepa de Cajeta', 'Postres', 55.00, 1),
('Eclair de Crema Pastelera', 'Postres', 40.00, 1);
GO

---------------------------------------------------------
-- 2. INSERTAR ESTUDIANTES (150 registros)
---------------------------------------------------------
-- Se utilizan bloques para facilitar la lectura
DECLARE @i INT = 1;
DECLARE @Carrera NVARCHAR(100);
DECLARE @NombreBase NVARCHAR(100);

WHILE @i <= 150
BEGIN
    SET @Carrera = CASE 
        WHEN @i % 5 = 0 THEN 'Ingeniería en Sistemas'
        WHEN @i % 5 = 1 THEN 'Administración'
        WHEN @i % 5 = 2 THEN 'Gastronomía'
        WHEN @i % 5 = 3 THEN 'Turismo'
        WHEN @i % 5 = 4 THEN 'Ingeniería Industrial'
    END;

    SET @NombreBase = 'Estudiante ' + CAST(@i AS NVARCHAR(10));
    
    INSERT INTO dbo.Estudiante (Nombre, Matricula, Carrera, Activo)
    VALUES (
        @NombreBase, 
        'MAT' + RIGHT('000' + CAST(@i AS NVARCHAR(5)), 5), 
        @Carrera, 
        1
    );
    
    SET @i = @i + 1;
END
GO
