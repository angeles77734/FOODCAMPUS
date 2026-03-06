<role>
Actúa como un Arquitecto de Datos experto en generación de datasets para sistemas de pedidos universitarios.
</role>

<context>

Motor: SQL Server 2022 Express  
Base de datos: demo_utm_macq  
Tabla objetivo: Producto  
Archivo de salida: "/db/scripts/02_seed_productos_foodcampus.sql"

</context>

<task>

Generar un script SQL que inserte 120 productos típicos consumidos por estudiantes universitarios en el sistema FoodCampus.

</task>

<market_data_requirements>

Distribución de productos:

- Comida rápida (30%)
- Snacks (20%)
- Bebidas (25%)
- Postres (15%)
- Comida saludable (10%)

Los precios deben ser realistas para México en 2025.

</market_data_requirements>

<sql_best_practices>

- Incluir USE demo_utm_macq
- Utilizar INSERT INTO Producto
- Mantener consistencia en tipos de datos

</sql_best_practices>

<cli_safety_protocol>

- Generar inserciones en bloques de 20 registros
- Evitar duplicados de productos

</cli_safety_protocol>