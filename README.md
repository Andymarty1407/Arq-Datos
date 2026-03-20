# Taller Arquitectura de Datos
## Nombres 
Danna Catalina Jimenez Rodriguez  
Michelle Valentina Martinez Marquez  
Anderson Philiph Martinez Muñoz  
Maria Camila Salcedo Matiz  
Joseph Santiao Toloza Olarte  
## Descripción

Este proyecto y respositorio corresponde al desarrollo de la arquitectura de datos para el sistema HealthPulse, una red de clínicas que requiere modernizar su sistema de gestión para administrar pacientes, médicos, citas médicas, historias clínicas y el monitoreo de signos vitales, El objetivo principal es garantizar un sistema modular y cohesivo que permita el seguimiento de pacientes, citas médicas y telemetría de forma eficiente.

## contenido del repositorio

- modelado.dbml: Representación lógica y grafica de la base de datos.
- script_ddl.sql: Script de creación de la base de datos con constraints independientes.
- giagrama.pdf: Visualización de las entidades y sus relaciones.

## Modelo de Datos

El sistema se compone de las siguientes entidades principales:
- Pacientes: almacena la información personal de los pacientes.
- Médicos: registra la información del personal médico.
- Citas: relaciona pacientes con médicos en una fecha y hora específica.
- Historias Clínicas: registra diagnósticos y tratamientos generados en cada cita.
- Signos Vitales: almacena lecturas de monitoreo como frecuencia cardíaca y temperatura.

## Relaciones principales

- Un paciente puede tener muchas citas.
- Un médico puede atender muchas citas.
- Cada cita genera una historia clínica.
- Un paciente puede tener múltiples registros de signos vitales.
- una cita medica pude tener solo un paciente y un solo medico

## Implementación

El modelo fue implementado en PostgreSQL utilizando sentencias DDL para la 
creación de tablas, restricciones y claves foráneas.

El módulo de monitoreo de signos vitales puede separarse fácilmente del sistema
principal debido a que está desacoplado de otras tablas y solo depende del
identificador del paciente.

La tabla central del sistema es la tabla de citas, ya que conecta pacientes,
médicos e historias clínicas. Un cambio en su estructura podría afectar varios
módulos del sistema.
