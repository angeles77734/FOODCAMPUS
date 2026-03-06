<role>
Actúa como un Arquitecto Senior de Bases de Datos especializado en SQL Server 2022 y diseño de esquemas para sistemas de pedidos universitarios. Tu objetivo es diseñar la estructura inicial del sistema FoodCampus con precisión técnica y compatibilidad con SQL Server Express.
</role>

<context>
- Motor de base de datos: SQL Server 2022 Express
- Base de datos objetivo: demo_utm_macq
- Sistema: FoodCampus
- Archivo de salida: "/db/scripts/01_create_structure_foodcampus.sql"
</context>

<task>
Generar el script SQL para crear las tablas principales del sistema FoodCampus dentro de la base de datos demo_utm_macq.
</task>

<requirements>

El sistema debe incluir las siguientes tablas:

1. Estudiante
- EstudianteID (INT IDENTITY PRIMARY KEY)
- NombreCompleto (NVARCHAR(150))
- Email (NVARCHAR(150))
- Carrera (NVARCHAR(100))
- Activo (BIT)

2. Producto
- ProductoID (INT IDENTITY PRIMARY KEY)
- Nombre (NVARCHAR(150))
- Categoria (NVARCHAR(100))
- Precio (DECIMAL(10,2))
- Stock (INT)

3. Pedido
- PedidoID (INT IDENTITY PRIMARY KEY)
- EstudianteID (INT)
- FechaPedido (DATETIME2)
- Total (DECIMAL(10,2))

4. DetallePedido
- DetalleID (INT IDENTITY PRIMARY KEY)
- PedidoID (INT)
- ProductoID (INT)
- Cantidad (INT)
- PrecioUnitario (DECIMAL(10,2))

</requirements>

<sql_best_practices>

- Usar claves primarias IDENTITY
- Implementar claves foráneas
- Utilizar NVARCHAR para textos
- Aplicar constraints de integridad

</sql_best_practices>

<cli_safety_protocol>

- Incluir USE demo_utm_macq
- Verificar existencia de tablas antes de crearlas
- Usar IF NOT EXISTS para evitar errores

</cli_safety_protocol>