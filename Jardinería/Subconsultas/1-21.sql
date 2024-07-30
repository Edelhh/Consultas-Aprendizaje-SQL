# Devuelve el nombre del cliente con mayor límite de crédito.
SELECT cliente.nombre_cliente FROM cliente
WHERE cliente.limite_credito = (SELECT MAX(cliente.limite_credito) FROM cliente);

# Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT producto.nombre FROM producto
WHERE producto.precio_venta = (SELECT MAX(producto.precio_venta) FROM producto);

# Devuelve el nombre del producto del que se han vendido más unidades. 
# (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de 
# cada producto a partir de los datos de la tabla detalle_pedido)
SELECT producto.nombre FROM producto
INNER JOIN detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
GROUP BY producto.codigo_producto
ORDER BY SUM(detalle_pedido.cantidad) DESC
LIMIT 1;

# Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
SELECT c.nombre_cliente, c.limite_credito, p.total FROM cliente AS c , pago AS p
WHERE (c.codigo_cliente = p.codigo_cliente) AND (c.limite_credito > p.total);

# Devuelve el producto que más unidades tiene en stock.
SELECT * FROM producto
WHERE producto.cantidad_en_stock = (
SELECT MAX(producto.cantidad_en_stock) FROM producto);

# Devuelve el producto que menos unidades tiene en stock.
SELECT * FROM producto
WHERE producto.cantidad_en_stock = (
SELECT MIN(producto.cantidad_en_stock) FROM producto);

# Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
SELECT empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.email FROM empleado
WHERE empleado.codigo_jefe = (
SELECT jefe.codigo_empleado FROM empleado AS jefe
WHERE CONCAT(jefe.nombre," ",jefe.apellido1) = "Alberto Soria");

# Devuelve el nombre del cliente con mayor límite de crédito.
SELECT * FROM cliente
WHERE cliente.limite_credito >= ALL(
	SELECT cliente.limite_credito FROM cliente);
    
# Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT * FROM producto
WHERE producto.precio_venta >= ALL(
	SELECT producto.precio_venta FROM producto);
    
# Devuelve el producto que menos unidades tiene en stock.
SELECT * FROM producto
WHERE producto.cantidad_en_stock <= ALL(
	SELECT producto.cantidad_en_stock FROM producto);
    
# Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
SELECT empleado.nombre, empleado.apellido1, empleado.puesto FROM empleado
WHERE empleado.codigo_empleado NOT IN(
	SELECT cliente.codigo_empleado_rep_ventas FROM cliente
);

# Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
SELECT * FROM cliente
WHERE cliente.codigo_cliente NOT IN(
	SELECT pago.codigo_cliente FROM pago
);

# Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
SELECT * FROM cliente
WHERE cliente.codigo_cliente IN(
	SELECT pago.codigo_cliente FROM pago
);

# Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT * FROM producto
WHERE producto.codigo_producto NOT IN(
	SELECT pedido.codigo_cliente FROM pedido
);

# Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados 
# que no sean representante de ventas de ningún cliente.
SELECT empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.extension, oficina.telefono FROM empleado, oficina
WHERE empleado.codigo_empleado NOT IN(
	SELECT cliente.codigo_empleado_rep_ventas FROM cliente
) AND empleado.codigo_oficina = oficina.codigo_oficina;

# Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas 
# de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
SELECT * FROM oficina
WHERE oficina.codigo_oficina NOT IN(
SELECT DISTINCT empleado.codigo_oficina FROM empleado
WHERE empleado.codigo_empleado IN(
SELECT DISTINCT cliente.codigo_empleado_rep_ventas FROM cliente
WHERE cliente.codigo_cliente IN(
SELECT pedido.codigo_pedido FROM pedido
INNER JOIN detalle_pedido ON detalle_pedido.codigo_pedido = pedido.codigo_pedido
INNER JOIN producto ON producto.codigo_producto = detalle_pedido.codigo_producto
WHERE producto.gama = "Frutales")));

# Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
SELECT * FROM cliente
WHERE cliente.codigo_cliente NOT IN(SELECT pago.codigo_cliente FROM pago) 
AND cliente.codigo_cliente IN(SELECT pedido.codigo_cliente FROM pedido);

# Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
SELECT * FROM cliente
WHERE NOT EXISTS(
	SELECT pago.codigo_cliente FROM pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente);
    
# Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
SELECT * FROM cliente
WHERE EXISTS(
	SELECT pago.codigo_cliente FROM pago
    WHERE pago.codigo_cliente = cliente.codigo_cliente);

# Devuelve un listado de los productos que nunca han aparecido en un pedido.
SELECT * FROM producto
WHERE NOT EXISTS(
	SELECT detalle_pedido.codigo_producto FROM detalle_pedido
    WHERE detalle_pedido.codigo_producto  = producto.codigo_producto);
    
# Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
SELECT * FROM producto
WHERE EXISTS(
	SELECT detalle_pedido.codigo_producto FROM detalle_pedido
    WHERE detalle_pedido.codigo_producto  = producto.codigo_producto)








