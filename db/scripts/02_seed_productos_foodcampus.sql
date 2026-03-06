/*
    FoodCampus - Script de Seed Data (Productos)
    Arquitecto: Data Expert Architect
    Motor: SQL Server 2022 Express
    Base de Datos: demo_utm_macq
    Fecha: 2026-03-06
*/

USE demo_utm_macq;
GO

-- Limpiar tabla previa para evitar duplicados en re-ejecución
DELETE FROM dbo.DetallePedido;
DELETE FROM dbo.Producto;
GO

-- Resetear IDENTITY
DBCC CHECKIDENT ('dbo.Producto', RESEED, 0);
GO

---------------------------------------------------------
-- BLOQUE 1: COMIDA RÁPIDA (1-20 de 36) - 30% total
---------------------------------------------------------
INSERT INTO dbo.Producto (Nombre, Categoria, Precio, Stock) VALUES
('Hamburguesa Clásica con Queso', 'Comida rápida', 75.00, 50),
('Hamburguesa Doble Tocino', 'Comida rápida', 115.00, 30),
('Hot Dog Jumbo Especial', 'Comida rápida', 45.00, 60),
('Pizza Slice Pepperoni', 'Comida rápida', 35.00, 80),
('Pizza Slice Hawaiana', 'Comida rápida', 35.00, 80),
('Nuggets de Pollo (6 pzas)', 'Comida rápida', 55.00, 40),
('Nuggets de Pollo (10 pzas)', 'Comida rápida', 85.00, 25),
('Papas a la Francesa Medianas', 'Comida rápida', 40.00, 100),
('Papas a la Francesa Grandes', 'Comida rápida', 55.00, 70),
('Torta de Milanesa de Pollo', 'Comida rápida', 65.00, 45),
('Torta de Jamón y Queso', 'Comida rápida', 45.00, 50),
('Burrito de Machaca con Huevo', 'Comida rápida', 55.00, 40),
('Burrito de Deshebrada con Chile', 'Comida rápida', 55.00, 40),
('Sincronizada Sencilla (2 pzas)', 'Comida rápida', 40.00, 60),
('Quesadilla Gigante de Asada', 'Comida rápida', 70.00, 35),
('Orden de Tacos al Pastor (3 pzas)', 'Comida rápida', 60.00, 55),
('Orden de Tacos de Bistec (3 pzas)', 'Comida rápida', 65.00, 50),
('Sándwich Club con Papas', 'Comida rápida', 95.00, 20),
('Boneless de Pollo BBQ (250g)', 'Comida rápida', 110.00, 30),
('Boneless de Pollo Buffalo (250g)', 'Comida rápida', 110.00, 30);

---------------------------------------------------------
-- BLOQUE 2: COMIDA RÁPIDA (21-36) + SNACKS (1-4 de 24) - 20% total
---------------------------------------------------------
INSERT INTO dbo.Producto (Nombre, Categoria, Precio, Stock) VALUES
('Nachos con Queso y Jalapeños', 'Comida rápida', 50.00, 90),
('Nachos Especiales con Carne', 'Comida rápida', 85.00, 40),
('Flautas de Pollo (3 pzas)', 'Comida rápida', 60.00, 45),
('Enchiladas Verdes (3 pzas)', 'Comida rápida', 75.00, 30),
('Molletes con Chorizo (2 pzas)', 'Comida rápida', 55.00, 50),
('Wrap de Pollo Crispy', 'Comida rápida', 80.00, 35),
('Hot Dog con Tocino y Cebolla', 'Comida rápida', 55.00, 50),
('Lonche de Adobada', 'Comida rápida', 65.00, 40),
('Tostadas de Tinga (2 pzas)', 'Comida rápida', 55.00, 30),
('Alitas de Pollo (6 pzas)', 'Comida rápida', 95.00, 25),
('Chimichanga de Res', 'Comida rápida', 75.00, 20),
('Gringa de Pastor', 'Comida rápida', 65.00, 45),
('Papas Gajo Sazonadas', 'Comida rápida', 50.00, 60),
('Salchipapas con Queso', 'Comida rápida', 60.00, 40),
('Torta Ahogada Estilo Jalisco', 'Comida rápida', 75.00, 25),
('Taco de Pescado Ensenada', 'Comida rápida', 45.00, 30),
('Papas Sabritas Original 42g', 'Snacks', 22.00, 150),
('Doritos Nacho 58g', 'Snacks', 22.00, 150),
('Cheetos Torciditos 52g', 'Snacks', 20.00, 150),
('Ruffles de Queso 50g', 'Snacks', 22.00, 150);

---------------------------------------------------------
-- BLOQUE 3: SNACKS (5-24) - 20% total
---------------------------------------------------------
INSERT INTO dbo.Producto (Nombre, Categoria, Precio, Stock) VALUES
('Cacahuates Japoneses 60g', 'Snacks', 15.00, 200),
('Cacahuates Enchilados 60g', 'Snacks', 15.00, 200),
('Nueces Mixtas Saladas 50g', 'Snacks', 35.00, 100),
('Pistaches Tostados 50g', 'Snacks', 45.00, 80),
('Barra de Granola Naturals', 'Snacks', 12.00, 300),
('Galletas Marias 170g', 'Snacks', 18.00, 120),
('Galletas Emperador Chocolate', 'Snacks', 18.00, 120),
('Galletas Chokis Original', 'Snacks', 18.00, 120),
('Palomitas Mantequilla ACT II', 'Snacks', 25.00, 100),
('Gomitas Panditas Ricolino', 'Snacks', 18.00, 150),
('Chocolates M&Ms Maní', 'Snacks', 25.00, 100),
('Chocolate Hershey’s con Almendras', 'Snacks', 28.00, 80),
('Manzana con Chamoy y Chile', 'Snacks', 35.00, 60),
('Jícama con Limón y Chile', 'Snacks', 30.00, 80),
('Zanahoria Rayada con Limón', 'Snacks', 25.00, 80),
('Mazapán De La Rosa Gigante', 'Snacks', 12.00, 250),
('Paleta Payaso Ricolino', 'Snacks', 25.00, 60),
('Pelon Pelo Rico 30g', 'Snacks', 12.00, 200),
('Skwinkles Rellenos Piña', 'Snacks', 15.00, 150),
('Hojuelas de Camote Saladas', 'Snacks', 30.00, 70);

---------------------------------------------------------
-- BLOQUE 4: BEBIDAS (1-20 de 30) - 25% total
---------------------------------------------------------
INSERT INTO dbo.Producto (Nombre, Categoria, Precio, Stock) VALUES
('Coca-Cola Original 600ml', 'Bebidas', 22.00, 200),
('Sprite Lima-Limón 600ml', 'Bebidas', 20.00, 150),
('Fanta Naranja 600ml', 'Bebidas', 20.00, 150),
('Sidral Mundet 600ml', 'Bebidas', 20.00, 120),
('Agua Ciel Natural 1L', 'Bebidas', 18.00, 300),
('Agua Ciel Mineral 600ml', 'Bebidas', 20.00, 150),
('Jugo del Valle Naranja 413ml', 'Bebidas', 22.00, 100),
('Jugo del Valle Mango 413ml', 'Bebidas', 22.00, 100),
('Leche de Chocolate Nesquik', 'Bebidas', 25.00, 80),
('Yogurt para Beber Fresa 220g', 'Bebidas', 22.00, 120),
('Café Americano Caliente 12oz', 'Bebidas', 25.00, 200),
('Café Capuchino Vainilla 12oz', 'Bebidas', 45.00, 150),
('Café Latte Helado 16oz', 'Bebidas', 55.00, 100),
('Frappé Mocha con Crema', 'Bebidas', 65.00, 80),
('Té Verde Helado con Limón', 'Bebidas', 30.00, 120),
('Agua de Jamaica Natural 500ml', 'Bebidas', 20.00, 150),
('Agua de Horchata Casera 500ml', 'Bebidas', 20.00, 150),
('Limonada Mineral con Chia', 'Bebidas', 35.00, 100),
('Bebida Energizante Monster', 'Bebidas', 55.00, 80),
('Bebida Electrolit Fresa', 'Bebidas', 35.00, 120);

---------------------------------------------------------
-- BLOQUE 5: BEBIDAS (21-30) + POSTRES (1-10 de 18) - 15% total
---------------------------------------------------------
INSERT INTO dbo.Producto (Nombre, Categoria, Precio, Stock) VALUES
('Malteada de Chocolate Real', 'Bebidas', 60.00, 40),
('Malteada de Fresa Natural', 'Bebidas', 60.00, 40),
('Licuado de Plátano con Avena', 'Bebidas', 45.00, 60),
('Smoothie de Frutos Rojos', 'Bebidas', 55.00, 50),
('Agua de Pepino con Limón 500ml', 'Bebidas', 25.00, 100),
('Café Espresso Sencillo', 'Bebidas', 20.00, 150),
('Té de Manzanilla Caliente', 'Bebidas', 18.00, 100),
('Bebida Vitamin Water Dragon', 'Bebidas', 38.00, 60),
('Nectar de Guayaba Jumex', 'Bebidas', 22.00, 80),
('Clamato Preparado Sin Alcohol', 'Bebidas', 45.00, 40),
('Rebanada de Pastel de Chocolate', 'Postres', 55.00, 30),
('Pay de Queso con Zarzamora', 'Postres', 45.00, 35),
('Brownie con Nuez Caliente', 'Postres', 35.00, 50),
('Gelatina de Mosaico Grande', 'Postres', 25.00, 60),
('Flan Napolitano Casero', 'Postres', 35.00, 40),
('Arroz con Leche y Canela', 'Postres', 30.00, 45),
('Donas de Azúcar (2 pzas)', 'Postres', 28.00, 50),
('Muffin de Arándanos Gigante', 'Postres', 32.00, 40),
('Carlota de Limón Fría', 'Postres', 35.00, 40),
('Churros con Cajeta (3 pzas)', 'Postres', 45.00, 30);

---------------------------------------------------------
-- BLOQUE 6: POSTRES (11-18) + SALUDABLE (1-12 de 12) - 10% total
---------------------------------------------------------
INSERT INTO dbo.Producto (Nombre, Categoria, Precio, Stock) VALUES
('Helado de Vainilla (2 bolas)', 'Postres', 40.00, 50),
('Helado de Chocolate (2 bolas)', 'Postres', 40.00, 50),
('Fresas con Crema y Azúcar', 'Postres', 55.00, 30),
('Crepa de Nutella y Plátano', 'Postres', 65.00, 25),
('Tarta de Manzana Caliente', 'Postres', 45.00, 20),
('Concha de Vainilla con Nata', 'Postres', 25.00, 40),
('Eclair de Crema Pastelera', 'Postres', 42.00, 20),
('Paleta Helada de Agua Fresa', 'Postres', 18.00, 80),
('Ensalada César con Pollo', 'Comida saludable', 95.00, 25),
('Bowl de Quinoa y Vegetales', 'Comida saludable', 110.00, 15),
('Sándwich Integral de Pavo', 'Comida saludable', 65.00, 30),
('Yogurt Griego con Berries', 'Comida saludable', 55.00, 25),
('Avena con Leche de Almendras', 'Comida saludable', 45.00, 20),
('Ensalada de Fruta de Temporada', 'Comida saludable', 45.00, 40),
('Hummus con Bastones de Apio', 'Comida saludable', 50.00, 30),
('Tostado de Aguacate y Huevo', 'Comida saludable', 65.00, 25),
('Jugo Verde Detox Natural', 'Comida saludable', 55.00, 35),
('Poke Bowl de Atún Fresco', 'Comida saludable', 135.00, 10),
('Ensalada Griega con Queso Feta', 'Comida saludable', 90.00, 20),
('Wrap de Vegetales Parrillados', 'Comida saludable', 75.00, 25);
GO
