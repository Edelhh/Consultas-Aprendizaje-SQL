# Devuelve un listado con todos los empleados junto con los datos de los departamentos 
# donde trabajan. Este listado también debe incluir los empleados que no tienen ningún 
# departamento asociado.
SELECT * FROM empleado
LEFT JOIN departamento ON departamento.id = empleado.id_departamento;

# Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún 
# departamento asociado.
SELECT * FROM empleado
LEFT JOIN departamento ON departamento.id = empleado.id_departamento
WHERE empleado.id_departamento IS NULL;

# Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen 
# ningún empleado asociado.
SELECT * FROM departamento
LEFT JOIN empleado ON departamento.id = empleado.id_departamento
WHERE empleado.id_departamento IS NULL;

# Devuelve un listado con todos los empleados junto con los datos de los departamentos 
# donde trabajan. El listado debe incluir los empleados que no tienen ningún departamento 
# asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado 
# alfabéticamente por el nombre del departamento.
(SELECT empleado.nombre,departamento.nombre AS nombre_depart, departamento.id FROM departamento
LEFT JOIN empleado ON empleado.id_departamento = departamento.id)
UNION
(SELECT empleado.nombre,departamento.nombre, departamento.id  FROM departamento
RIGHT JOIN empleado ON empleado.id_departamento = departamento.id)
ORDER BY nombre_depart ASC;

# Devuelve un listado con los empleados que no tienen ningún departamento asociado 
# y los departamentos que no tienen ningún empleado asociado. Ordene el listado 
# alfabéticamente por el nombre del departamento.
# Nota Personal: Se podria explorar como seria si usara ALL o ANY
(SELECT empleado.id_departamento, empleado.nombre, departamento.nombre AS nombre_dep
FROM empleado
LEFT JOIN departamento ON departamento.id = empleado.id_departamento
WHERE empleado.id_departamento IS NULL)
UNION
(SELECT empleado.id_departamento, empleado.nombre, departamento.nombre
FROM empleado
RIGHT JOIN departamento ON departamento.id = empleado.id_departamento
WHERE empleado.id_departamento IS NULL)
ORDER BY nombre_dep ASC;


