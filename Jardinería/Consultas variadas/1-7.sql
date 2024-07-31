# Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir 
# clientes que no han realizado ningún pedido.
(SELECT cliente.codigo_cliente, cliente.nombre_cliente, COUNT(*) FROM cliente
INNER JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
GROUP BY cliente.codigo_cliente)
UNION
(SELECT cliente.codigo_cliente, cliente.nombre_cliente, 0 FROM cliente
LEFT JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
WHERE pedido.codigo_cliente IS NULL
GROUP BY cliente.codigo_cliente);

# Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. 
# Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
(SELECT cliente.codigo_cliente, cliente.nombre_cliente, SUM(pago.total) FROM cliente
INNER JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
GROUP BY cliente.codigo_cliente)
UNION
(SELECT cliente.codigo_cliente, cliente.nombre_cliente, 0 FROM cliente
LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
WHERE pago.codigo_cliente IS NULL
GROUP BY cliente.codigo_cliente);

# Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
SELECT DISTINCT cliente.nombre_cliente FROM cliente
INNER JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
WHERE YEAR(pedido.fecha_pedido) = 2008
ORDER BY cliente.nombre_cliente ASC;

# Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número 
 # de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.telefono FROM cliente
INNER JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
INNER JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE cliente.codigo_cliente IN(SELECT cliente.codigo_empleado_rep_ventas FROM cliente
LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
WHERE pago.codigo_cliente IS NULL);

# Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su 
# representante de ventas y la ciudad donde está su oficina.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad FROM cliente
INNER JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
INNER JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina;

# Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
SELECT empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.puesto, oficina.telefono FROM empleado
LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
LEFT JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE cliente.codigo_cliente IS NULL;

# Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
SELECT oficina.ciudad, COUNT(oficina.ciudad) FROM oficina
INNER JOIN empleado ON empleado.codigo_oficina = oficina.codigo_oficina
GROUP BY oficina.ciudad;


 



