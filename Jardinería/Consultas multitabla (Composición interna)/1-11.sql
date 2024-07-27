# Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1 FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

# Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT cliente.nombre_cliente, empleado.nombre FROM cliente
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;

# Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT cliente.nombre_cliente, empleado.nombre FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
WHERE cliente.codigo_cliente NOT IN(
SELECT cliente.codigo_cliente FROM cliente
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente
);

# Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a 
# la que pertenece el representante.
SELECT DISTINCT cliente.nombre_cliente, empleado.nombre, oficina.ciudad FROM cliente
INNER JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
INNER JOIN pago ON cliente.codigo_cliente = pago.codigo_cliente;

# Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad 
# de la oficina a la que pertenece el representante.
SELECT DISTINCT cliente.nombre_cliente, empleado.nombre, oficina.ciudad FROM cliente
INNER JOIN empleado ON empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina
WHERE cliente.codigo_cliente NOT IN(
	SELECT cliente.codigo_cliente FROM cliente
    INNER JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
);

# Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
SELECT DISTINCT oficina.linea_direccion1, oficina.linea_direccion2 FROM oficina
INNER JOIN empleado ON empleado.codigo_oficina = oficina.codigo_oficina
INNER JOIN cliente ON empleado.codigo_empleado =cliente.codigo_empleado_rep_ventas
WHERE cliente.ciudad = "Fuenlabrada";

# Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT DISTINCT cliente.nombre_cliente, empleado.nombre, oficina.ciudad FROM cliente
INNER JOIN empleado ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
INNER JOIN oficina ON empleado.codigo_oficina = oficina.codigo_oficina;

# Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
SELECT empleado.nombre, empleado1.nombre FROM empleado AS empleado1
INNER JOIN empleado ON empleado1.codigo_empleado = empleado.codigo_jefe
ORDER BY empleado1.codigo_empleado ASC;

# Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
SELECT empleado.nombre, jefe1.nombre, jefe2.nombre FROM empleado AS jefe2
INNER JOIN empleado AS jefe1 ON jefe2.codigo_empleado = jefe1.codigo_jefe
INNER JOIN empleado ON jefe1.codigo_empleado = empleado.codigo_jefe
ORDER BY empleado.codigo_empleado ASC;

# Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
SELECT cliente.nombre_cliente FROM cliente
INNER JOIN pedido ON pedido.codigo_cliente = cliente.codigo_cliente
WHERE pedido.fecha_esperada < pedido.fecha_entrega;

# Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
SELECT cliente.codigo_cliente,producto.gama, COUNT(producto.gama) FROM producto
INNER JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
INNER JOIN pedido ON detalle_pedido.codigo_pedido = pedido.codigo_pedido
INNER JOIN cliente ON pedido.codigo_cliente = cliente.codigo_cliente
GROUP BY cliente.codigo_cliente,producto.gama





