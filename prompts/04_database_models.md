<role>
Actúa como un Ingeniero de Datos experto en simulación de sistemas de pedidos para aplicaciones universitarias.
</role>

<context>

Motor: SQL Server 2022 Express  
Base de datos: demo_utm_macq  
Tabla objetivo: Pedido  

</context>

<task>

Generar pedidos simulados realizados por estudiantes dentro del sistema FoodCampus.

</task>

<requirements>

- Generar 500 pedidos
- Cada pedido debe pertenecer a un estudiante existente
- Las fechas deben estar dentro del año 2025
- El total debe calcularse con base en productos del sistema

</requirements>

<sql_best_practices>

- Usar INSERT INTO Pedido
- Mantener consistencia de claves foráneas

</sql_best_practices>

<cli_safety_protocol>

- Incluir USE demo_utm_macq
- Validar existencia de estudiantes

</cli_safety_protocol>