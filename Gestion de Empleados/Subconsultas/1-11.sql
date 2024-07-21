# Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. 
# (Sin utilizar INNER JOIN).
SELECT * FROM empleado
WHERE empleado.id_departamento = (
SELECT departamento.id FROM departamento
WHERE departamento.nombre = "Sistemas");

# Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.
SELECT departamento.nombre FROM departamento
ORDER BY departamento.presupuesto DESC
LIMIT 1;

# Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
SELECT nombre, presupuesto FROM departamento
ORDER BY presupuesto ASC
LIMIT 1;

# Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada. 
# Sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT nombre FROM departamento
WHERE presupuesto >= ALL(
SELECT presupuesto FROM departamento
);

#  Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.
# Sin hacer uso de MIN, ORDER BY ni LIMIT.
# Nota Personal: Es posible encontrar casos como este donde tanto proyectos como publicidad
# tienen 0 presupuesto osea son iguales. Por lo que usar order by + Limit nos oculta esta info
SELECT nombre, presupuesto FROM departamento
WHERE presupuesto <= ALL(
SELECT presupuesto FROM departamento
);

# Devuelve los nombres de los departamentos que tienen empleados asociados. 
# (Utilizando ALL o ANY).
SELECT nombre FROM empleado
WHERE empleado.id_departamento = ANY(
	SELECT departamento.id FROM departamento
);

# Devuelve los nombres de los departamentos que no tienen empleados asociados. 
# (Utilizando ALL o ANY).
SELECT nombre FROM departamento
WHERE departamento.id <> ALL (
SELECT empleado.id_departamento FROM empleado
WHERE empleado.id_departamento IS NOT NULL
);

# Devuelve los nombres de los departamentos que tienen empleados asociados.
# (Utilizando IN o NOT IN).
SELECT nombre FROM departamento
WHERE departamento.id IN(
SELECT empleado.id_departamento FROM empleado
WHERE empleado.id_departamento IS NOT NULL
);

# Devuelve los nombres de los departamentos que no tienen empleados asociados.
# (Utilizando IN o NOT IN).
SELECT nombre FROM departamento
WHERE departamento.id NOT IN(
SELECT empleado.id_departamento FROM empleado
WHERE empleado.id_departamento IS NOT NULL
);

# Devuelve los nombres de los departamentos que tienen empleados asociados. 
# (Utilizando EXISTS o NOT EXISTS).
SELECT nombre FROM departamento
WHERE EXISTS(
 SELECT empleado.id_departamento FROM empleado
 WHERE empleado.id_departamento = departamento.id);
 
 # Devuelve los nombres de los departamentos que tienen empleados asociados. 
 # (Utilizando EXISTS o NOT EXISTS).
 SELECT nombre FROM departamento
 WHERE NOT EXISTS (
 SELECT empleado.id_departamento FROM empleado
 WHERE empleado.id_departamento = departamento.id
 );
 





