# Calcula la suma del presupuesto de todos los departamentos.
SELECT SUM(departamento.presupuesto) FROM departamento;

# Calcula la media del presupuesto de todos los departamentos.
SELECT AVG(presupuesto) FROM departamento;

# Calcula el valor mínimo del presupuesto de todos los departamentos.
SELECT MIN(presupuesto) FROM departamento;

# Calcula el nombre del departamento y el presupuesto que tiene asignado, 
# del departamento con menor presupuesto.
SELECT nombre, presupuesto FROM departamento
ORDER BY presupuesto ASC
LIMIT 1;

# Calcula el valor máximo del presupuesto de todos los departamentos.
SELECT nombre,MIN(presupuesto) FROM departamento
GROUP BY departamento.nombre;

# Calcula el nombre del departamento y el presupuesto que tiene asignado, 
# del departamento con mayor presupuesto.
SELECT nombre, presupuesto FROM departamento
ORDER BY departamento.presupuesto DESC
LIMIT 1; 

# Calcula el número total de empleados que hay en la tabla empleado.
SELECT COUNT(*) FROM empleado;

# Calcula el número de empleados que no tienen NULL en su segundo apellido.
SELECT COUNT(*) FROM empleado
WHERE empleado.apellido2 IS NOT NULL;

# Calcula el número de empleados que hay en cada departamento. 
# Tienes que devolver dos columnas, una con el nombre del departamento y otra con el 
# número de empleados que tiene asignados.
SELECT departamento.nombre, COUNT(departamento.nombre) FROM departamento
INNER JOIN empleado ON departamento.id = empleado.id_departamento
GROUP BY departamento.nombre;

# Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado 
# debe tener dos columnas, una con el nombre del departamento y otra con el número 
# de empleados que tiene asignados.
SELECT departamento.nombre, COUNT(departamento.nombre) FROM departamento
INNER JOIN empleado ON departamento.id = empleado.id_departamento
GROUP BY departamento.nombre
HAVING COUNT(departamento.nombre) > 2;

# Calcula el número de empleados que trabajan en cada uno de los departamentos. 
# El resultado de esta consulta también tiene que incluir aquellos departamentos que 
# no tienen ningún empleado asociado.
(SELECT departamento.nombre, COUNT(departamento.nombre) FROM departamento
INNER JOIN empleado ON departamento.id = empleado.id_departamento
GROUP BY departamento.nombre)
UNION(
SELECT departamento.nombre, 0 FROM departamento
LEFT JOIN empleado ON departamento.id = empleado.id_departamento
WHERE empleado.id_departamento IS NULL);

# Calcula el número de empleados que trabajan en cada unos de los departamentos 
# que tienen un presupuesto mayor a 200000 euros.
SELECT departamento.nombre, COUNT(departamento.nombre) FROM departamento
INNER JOIN empleado ON departamento.id = empleado.id_departamento
WHERE departamento.presupuesto > 200000
GROUP BY departamento.nombre



