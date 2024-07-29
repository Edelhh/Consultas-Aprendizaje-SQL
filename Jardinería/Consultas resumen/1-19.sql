# ¿Cuántos empleados hay en la compañía?
SELECT DISTINCT COUNT(*) FROM empleado;

# ¿Cuántos clientes tiene cada país?
SELECT cliente.pais, COUNT(*) FROM cliente
GROUP BY cliente.pais;

# ¿Cuál fue el pago medio en 2009?
SELECT AVG(pago.total) FROM pago
WHERE YEAR(pago.fecha_pago) = 2009;

# ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
SELECT pedido.estado, COUNT(*) AS numero_pedidos FROM pedido
GROUP BY pedido.estado
ORDER BY numero_pedidos DESC;

# Calcula el precio de venta del producto más caro y más barato en una misma consulta.
SELECT MIN(producto.precio_venta), MAX(producto.precio_venta) FROM producto;

# Calcula el número de clientes que tiene la empresa.
SELECT COUNT(*) FROM cliente;

# ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
SELECT COUNT(*) FROM cliente
WHERE cliente.ciudad = "Madrid";

# ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
SELECT cliente.ciudad, COUNT(*) FROM cliente
WHERE cliente.ciudad LIKE("M%")
GROUP BY cliente.ciudad;

# Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
SELECT empleado.nombre, COUNT(*) FROM empleado
INNER JOIN cliente ON cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado
GROUP BY empleado.nombre;

# Calcula el número de clientes que no tiene asignado representante de ventas.
SELECT COUNT(*) FROM cliente
LEFT JOIN empleado on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
WHERE empleado.codigo_empleado IS NULL;

# Calcula la fecha del primer y último pago realizado por cada uno de los clientes. 
# El listado deberá mostrar el nombre y los apellidos de cada cliente.
SELECT cliente.nombre_cliente, cliente.apellido_contacto, MIN(pago.fecha_pago), MAX(pago.fecha_pago) FROM cliente
LEFT JOIN pago ON pago.codigo_cliente = cliente.codigo_cliente
GROUP BY cliente.nombre_cliente, cliente.apellido_contacto;

# Calcula el número de productos diferentes que hay en cada uno de los pedidos.
SELECT detalle_pedido.codigo_pedido, COUNT(*) FROM detalle_pedido
GROUP BY detalle_pedido.codigo_pedido;

# Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
SELECT SUM(detalle_pedido.cantidad) FROM detalle_pedido;

# Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. 
# El listado deberá estar ordenado por el número total de unidades vendidas.
SELECT detalle_pedido.codigo_producto, COUNT(*) AS unidades_vendidas FROM detalle_pedido
GROUP BY detalle_pedido.codigo_producto
ORDER BY unidades_vendidas DESC
LIMIT 20;

# La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. 
# La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido.
# El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
SELECT (cantidad * precio_unidad) AS base_imponible, 
(cantidad * precio_unidad) * 0.21 AS iva, 
(cantidad * precio_unidad) + (cantidad * precio_unidad) * 0.21 AS total
FROM detalle_pedido;

# La misma información que en la pregunta anterior, pero agrupada por código de producto.
SELECT codigo_producto, (SUM(cantidad) * precio_unidad) AS base_imponible,
(SUM(cantidad) * precio_unidad) * 0.21 AS iva, 
(SUM(cantidad) * precio_unidad) + (SUM(cantidad) * precio_unidad) * 0.21 AS total
FROM detalle_pedido
GROUP BY detalle_pedido.codigo_producto, precio_unidad;

# La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por 
# los códigos que empiecen por OR.
SELECT codigo_producto, (SUM(cantidad) * precio_unidad) AS base_imponible,
(SUM(cantidad) * precio_unidad) * 0.21 AS iva, 
(SUM(cantidad) * precio_unidad) + (SUM(cantidad) * precio_unidad) * 0.21 AS total
FROM detalle_pedido
WHERE codigo_producto LIKE("OR%")
GROUP BY detalle_pedido.codigo_producto, precio_unidad;

# Lista las ventas totales de los productos que hayan facturado más de 3000 euros. 
# Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
SELECT producto.nombre, SUM(cantidad) AS unidades_vendidas,
(SUM(cantidad) * precio_unidad)  AS total_sin_iva,
(SUM(cantidad) * precio_unidad) + (SUM(cantidad) * precio_unidad) * 0.21 AS total_con_iva
FROM detalle_pedido
INNER JOIN producto ON producto.codigo_producto = detalle_pedido.codigo_producto
GROUP BY detalle_pedido.codigo_producto, precio_unidad
HAVING total_sin_iva > 3000;

# Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
SELECT YEAR(pago.fecha_pago), SUM(pago.total) FROM pago
GROUP BY YEAR(pago.fecha_pago);




 