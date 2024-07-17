# Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT * FROM empleado
INNER JOIN departamento ON departamento.id = empleado.id_departamento;

# Devuelve un listado con los empleados y los datos de los departamentos 
# donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre 
# del departamento (en orden alfabético) y en segundo lugar por los apellidos y 
# el nombre de los empleados.
SELECT * FROM empleado 
INNER JOIN departamento ON departamento.id = empleado.id_departamento
ORDER BY departamento.nombre ASC, empleado.apellido1,empleado.apellido2,empleado.apellido1;

# Devuelve un listado con el identificador y el nombre del departamento, 
# solamente de aquellos departamentos que tienen empleados.
SELECT DISTINCT departamento.id, departamento.nombre FROM departamento
INNER JOIN empleado ON empleado.id_departamento = departamento.id;

# Devuelve un listado con el identificador, el nombre del departamento y el valor 
# del presupuesto actual del que dispone, solamente de aquellos departamentos que 
# tienen empleados. El valor del presupuesto actual lo puede calcular restando al 
# valor del presupuesto inicial (columna presupuesto) el valor de los gastos que ha 
# generado (columna gastos).
SELECT DISTINCT departamento.id, departamento.nombre, 
departamento.presupuesto - departamento.gastos AS "presupuesto_actual" FROM departamento
INNER JOIN empleado ON empleado.id_departamento = departamento.id;

# Devuelve el nombre del departamento donde trabaja el empleado que tiene el nif 38382980M.
SELECT departamento.nombre FROM departamento
INNER JOIN empleado ON empleado.id_departamento = departamento.id
WHERE empleado.nif = "38382980M";

# Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz Santana.
SELECT departamento.nombre FROM departamento
INNER JOIN empleado ON empleado.id_departamento = departamento.id
WHERE CONCAT(empleado.nombre," ",empleado.apellido1," ",empleado.apellido2) 
= "Pepe Ruiz Santana";

# Devuelve un listado con los datos de los empleados que trabajan en el departamento 
# de I+D. Ordena el resultado alfabéticamente.
SELECT * FROM empleado
INNER JOIN departamento ON empleado.id_departamento = departamento.id
WHERE departamento.nombre = "I+D"
ORDER BY empleado.nombre ASC;

# Devuelve un listado con los datos de los empleados que trabajan en el 
# departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT * FROM empleado
INNER JOIN departamento ON empleado.id_departamento = departamento.id
WHERE departamento.nombre IN ("Sistemas","Contabilidad","I+D")
ORDER BY empleado.nombre ASC;

# Devuelve una lista con el nombre de los empleados que tienen los departamentos 
# que no tienen un presupuesto entre 100000 y 200000 euros.
SELECT empleado.nombre FROM empleado
INNER JOIN departamento ON departamento.id = empleado.id_departamento
WHERE departamento.presupuesto NOT BETWEEN 100000 AND 200000;

# Devuelve un listado con el nombre de los departamentos donde existe algún 
# empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no debe mostrar 
# nombres de departamentos que estén repetidos.
SELECT DISTINCT departamento.nombre FROM departamento
INNER JOIN empleado ON departamento.id = empleado.id_departamento
WHERE empleado.apellido2 IS NULL;

