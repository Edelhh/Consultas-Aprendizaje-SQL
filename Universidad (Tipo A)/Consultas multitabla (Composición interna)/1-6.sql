# Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna 
# vez en el Grado en Ingeniería Informática (Plan 2015).
SELECT persona.* FROM persona
INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id
INNER JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
INNER JOIN grado ON grado.id = asignatura.id_grado
WHERE persona.sexo = "M" AND grado.nombre LIKE("Grado en Ingeniería Informática (Plan 2015)");

# Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
SELECT asignatura.* FROM asignatura
INNER JOIN grado ON grado.id = asignatura.id_grado
WHERE grado.nombre LIKE("Grado en Ingeniería Informática (Plan 2015)");

# Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. 
# El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. 
# El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona
INNER JOIN profesor ON profesor.id_profesor = persona.id
INNER JOIN departamento ON departamento.id = profesor.id_departamento
ORDER BY persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;

# Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM asignatura
INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN persona ON persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE persona.nif = "26902806M";

# Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna 
# asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT departamento.nombre FROM departamento
INNER JOIN profesor ON profesor.id_departamento = departamento.id
INNER JOIN persona ON persona.id = profesor.id_profesor
INNER JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor
INNER JOIN grado ON grado.id = asignatura.id_grado
WHERE grado.nombre = "Grado en Ingeniería Informática (Plan 2015)";

# Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT persona.* FROM persona
INNER JOIN alumno_se_matricula_asignatura ON alumno_se_matricula_asignatura.id_alumno = persona.id
INNER JOIN asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
INNER JOIN curso_escolar ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019







