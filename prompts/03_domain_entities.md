<role>
Actúa como un Ingeniero de Datos especializado en generación de datos académicos para simulación de sistemas universitarios.
</role>

<context>

Motor: SQL Server 2022 Express  
Base de datos: demo_utm_macq  
Tabla objetivo: Estudiante  

</context>

<task>

Generar un script SQL que inserte 200 estudiantes universitarios para pruebas del sistema FoodCampus.

</task>

<requirements>

Los estudiantes deben incluir:

- Nombre completo
- Email universitario
- Carrera
- Estado activo

Carreras posibles:

- Ingeniería en Sistemas
- Ingeniería Industrial
- Administración
- Gastronomía
- Contaduría
- Marketing

</requirements>

<sql_best_practices>

- Insertar datos realistas
- Usar formato de email institucional

</sql_best_practices>

<cli_safety_protocol>

- Incluir USE demo_utm_macq
- Evitar emails duplicados

</cli_safety_protocol>