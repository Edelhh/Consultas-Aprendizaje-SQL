# Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
# El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe 
# devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. 
# El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre, persona.tipo FROM persona
LEFT JOIN profesor ON profesor.id_profesor = persona.id
RIGHT JOIN departamento ON departamento.id = profesor.id_departamento
WHERE persona.tipo = "Profesor";

# Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT persona.* FROM persona
WHERE persona.id <> ALL(SELECT profesor.id_profesor FROM profesor) AND persona.tipo = "Profesor";

# Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT departamento.* FROM departamento
WHERE departamento.id <> ALL(SELECT profesor.id_departamento FROM profesor);

# Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT DISTINCT persona.* FROM persona
LEFT JOIN asignatura ON asignatura.id_profesor = persona.id
WHERE persona.tipo = "Profesor" AND asignatura.id IS NULL;

# Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT  * FROM asignatura
WHERE asignatura.id_profesor IS NULL;

# Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. 
# El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
SELECT departamento.nombre, asignatura.nombre FROM asignatura
LEFT JOIN profesor ON profesor.id_profesor = asignatura.id_profesor
LEFT JOIN departamento ON departamento.id = profesor.id_departamento
WHERE asignatura.curso IS NULL;

# 

