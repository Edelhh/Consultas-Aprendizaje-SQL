# Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. 
# El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona
WHERE persona.tipo ="alumno"
ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

# Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2 FROM persona
WHERE persona.tipo ="alumno" AND persona.telefono IS NULL ;

# Devuelve el listado de los alumnos que nacieron en 1999.
SELECT * FROM persona
WHERE YEAR(persona.fecha_nacimiento) = 1999 AND persona.tipo ="alumno";

# Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
SELECT * FROM persona
WHERE persona.tipo = "Profesor" AND (persona.telefono IS NULL) AND (persona.nif LIKE("%K"));

# Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT * FROM asignatura
WHERE asignatura.cuatrimestre = 1 AND asignatura.curso = 3 AND asignatura.id_grado = 7;

