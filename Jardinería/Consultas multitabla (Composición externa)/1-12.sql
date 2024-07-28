# Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
SELECT * FROM cliente
LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
WHERE pago.codigo_cliente IS NULL;

# Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
SELECT * FROM cliente
LEFT JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
WHERE pedido.codigo_cliente IS NULL;

# Devuelve un listado que muestre los clientes que no han realizado ningún pago y 
# los que no han realizado ningún pedido.
SELECT * FROM cliente
WHERE cliente.codigo_cliente = ANY(
SELECT cliente.codigo_cliente FROM cliente
LEFT JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
WHERE (pedido.codigo_cliente IS NULL) OR (pago.codigo_cliente IS NULL));

# Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
SELECT * FROM empleado
LEFT JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE oficina.codigo_oficina IS NULL;

# Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
SELECT * FROM empleado
LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE cliente.codigo_cliente IS NULL;

# Devuelve un listado que muestre solamente los empleados que no tienen un cliente 
# asociado junto con los datos de la oficina donde trabajan.
SELECT * FROM empleado
LEFT JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE empleado.codigo_empleado = ANY(
SELECT empleado.codigo_empleado FROM empleado
LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE cliente.codigo_cliente IS NULL)
ORDER BY empleado.codigo_empleado;

# Devuelve un listado que muestre los empleados que no tienen una oficina asociada 
# y los que no tienen un cliente asociado.
SELECT * FROM empleado
WHERE empleado.codigo_empleado = ANY(
SELECT empleado.codigo_empleado FROM empleado
LEFT JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina
LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE (oficina.codigo_oficina IS NULL) OR (cliente.codigo_cliente IS NUll));

# Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT * FROM producto
LEFT JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
WHERE detalle_pedido.codigo_producto IS NULL;

# Devuelve un listado de los productos que nunca han aparecido en un pedido. 
# El resultado debe mostrar el nombre, la descripción y la imagen del producto.
SELECT producto.nombre, producto.descripcion, producto.dimensiones FROM producto
LEFT JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
WHERE detalle_pedido.codigo_producto IS NULL;

# Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido 
# los representantes de ventas de algún cliente que haya realizado la compra de 
# algún producto de la gama Frutales.
SELECT * FROM oficina
WHERE oficina.codigo_oficina <> ALL(
SELECT oficina.codigo_oficina FROM producto
INNER JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
INNER JOIN pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
INNER JOIN cliente ON cliente.codigo_cliente = pedido.codigo_cliente
INNER JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
INNER JOIN oficina ON oficina.codigo_oficina = empleado.codigo_oficina
WHERE producto.gama = "Frutales");

# Devuelve un listado con los clientes que han realizado algún pedido pero no han 
# realizado ningún pago.
SELECT * FROM cliente
LEFT JOIN pedido ON pedido.codigo_cliente
LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
WHERE (pedido.codigo_cliente IS NOT NULL) AND (pago.codigo_cliente IS NULL);

# Devuelve un listado con los datos de los empleados que no tienen clientes asociados 
# y el nombre de su jefe asociado.
SELECT empleado.*, jefe.nombre AS nombre_jefe FROM empleado
LEFT JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN empleado AS jefe ON empleado.codigo_jefe = jefe.codigo_empleado
WHERE cliente.codigo_empleado_rep_ventas IS NULL;







