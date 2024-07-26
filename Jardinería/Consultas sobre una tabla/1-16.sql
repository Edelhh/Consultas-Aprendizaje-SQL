# Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT oficina.codigo_oficina, oficina.ciudad FROM oficina;

# Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT oficina.ciudad, oficina.telefono FROM oficina
WHERE oficina.pais = "España";

# Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe 
# tiene un código de jefe igual a 7.
SELECT empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.email FROM empleado
WHERE empleado.codigo_jefe = 7;

# Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
# Nota personal: Al no tener un codigo de jefe estoy suponiendo que es la persona la persona
# de mas alta autoridad y por eso no tiene codigo de jefe.
SELECT puesto,nombre, apellido1,apellido2,email FROM empleado
WHERE codigo_jefe IS NULL;

# Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean 
# representantes de ventas.
SELECT nombre, apellido1, apellido2, puesto FROM empleado
WHERE puesto = "representante ventas";

# Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT nombre_cliente FROM cliente
WHERE cliente.pais = "Spain";

# Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT pedido.estado FROM pedido;

# Devuelve un listado con el código de cliente de aquellos clientes que realizaron 
# algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente 
# que aparezcan repetidos. Resuelva la consulta:
# Utilizando la función YEAR de MySQL.
SELECT DISTINCT pago.codigo_cliente FROM pago
WHERE YEAR(pago.fecha_pago) = 2008;

# Utilizando la función DATE_FORMAT de MySQL.
SELECT DISTINCT pago.codigo_cliente FROM pago
WHERE DATE_FORMAT(pago.fecha_pago,"%Y") = 2008;

# Sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT pago.codigo_cliente FROM pago
WHERE pago.fecha_pago LIKE("2008%");

# Devuelve un listado con el código de pedido, código de cliente, fecha esperada y 
# fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT pedido.codigo_pedido, pedido.codigo_cliente, 
pedido.fecha_esperada, pedido.fecha_entrega FROM pedido
WHERE pedido.estado = "Entregado" AND pedido.fecha_esperada < pedido.fecha_entrega;

# Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha 
# de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la 
# fecha esperada
# Utilizando la función ADDDATE de MySQL.
SELECT pedido.codigo_pedido, pedido.codigo_cliente, 
pedido.fecha_esperada, pedido.fecha_entrega FROM pedido
WHERE ADDDATE(fecha_entrega,INTERVAL 2 DAY) <= fecha_esperada;

# Utilizando la función DATEDIFF de MySQL.
SELECT pedido.codigo_pedido, pedido.codigo_cliente, 
pedido.fecha_esperada, pedido.fecha_entrega FROM pedido
WHERE DATEDIFF(pedido.fecha_entrega,pedido.fecha_esperada) <= -2;

#¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
# RTS: Si
SELECT pedido.codigo_pedido, pedido.codigo_cliente, 
pedido.fecha_esperada, pedido.fecha_entrega FROM pedido
WHERE (fecha_entrega - fecha_esperada) <= -2;

# Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT * FROM pedido
WHERE pedido.estado = "Rechazado" AND (YEAR(pedido.fecha_pedido) = 2009);

# Devuelve un listado de todos los pedidos que han sido entregados en el mes de 
# enero de cualquier año.
SELECT * FROM pedido
WHERE MONTH(pedido.fecha_entrega) = 1;

# Devuelve un listado con todos los pagos que se realizaron en el año 2008 
# mediante Paypal. Ordene el resultado de mayor a menor.
SELECT * FROM pago
WHERE YEAR(pago.fecha_pago) = 2008 AND pago.forma_pago = "Paypal";

# Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. 
# Tenga en cuenta que no deben aparecer formas de pago repetidas.
SELECT DISTINCT pago.forma_pago FROM pago;

# Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales 
# y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por 
# su precio de venta, mostrando en primer lugar los de mayor precio.
SELECT * FROM producto
WHERE producto.gama = "Ornamentales" AND producto.cantidad_en_stock > 100
ORDER BY producto.precio_venta DESC;

# Devuelve un listado con todos los clientes que sean de la ciudad de Madrid 
# y cuyo representante de ventas tenga el código de empleado 11 o 30.
SELECT * FROM cliente
WHERE (cliente.ciudad = "Madrid") 
AND (cliente.codigo_empleado_rep_ventas IN (11,30));




