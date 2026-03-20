# Reflexion Arquitectonica 
## Nombres 
Danna Catalina Jimenez Rodriguez  
Michelle Valentina Martinez Marquez  
Anderson Philiph Martinez Muñoz  
Maria Camila Salcedo Matiz  
Joseph Santiao Toloza Olarte 
## 1. Modularidad

El módulo de Monitoreo de Signos Vitales puede separarse relativamente fácil del resto del sistema porque su tabla (signos_vitales) está diseñada de forma independiente y solo se relaciona con la tabla de pacientes a través del identificador del paciente (id_paciente).

Esto significa que, si el sistema de monitoreo crece y necesita ejecutarse en un servidor independiente o convertirse en un microservicio, solo sería necesario mantener la referencia al identificador del paciente para seguir registrando los datos.

Gracias a esta estructura, el módulo puede escalar sin afectar significativamente el funcionamiento de otros componentes del sistema, como las citas médicas o las historias clínicas.

## 2. Acoplamiento

La tabla que actúa como punto central del sistema es la tabla citas, ya que conecta directamente a los pacientes con el personal médico y además se relaciona con la tabla de historias clínicas.

Debido a que varias partes del sistema dependen de esta tabla, un cambio estructural profundo en ella (por ejemplo, modificar su clave primaria o eliminar columnas clave) podría afectar múltiples módulos del sistema.

Esto implicaría modificar las relaciones con otras tablas, actualizar las consultas y posiblemente cambiar la lógica de funcionamiento del sistema. Por esta razón, es importante diseñar esta tabla con mucho cuidado para evitar cambios estructurales frecuentes.

## 3. Cohesión

Colocar el diagnóstico médico directamente en la tabla de citas sería un error de diseño porque esa tabla tiene la función de registrar únicamente la programación de la atención médica (fecha, hora, paciente y médico).

El diagnóstico y el tratamiento corresponden al resultado clínico de la consulta, lo cual pertenece conceptualmente a la historia clínica del paciente.

Separar esta información en una tabla de historias clínicas mejora la cohesión del sistema, ya que cada tabla se encarga de una responsabilidad específica. Además, permite que la información clínica tenga mayor flexibilidad, pueda ampliarse en el futuro y mantenga una mejor organización dentro de la base de datos.