# Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. 
# (Sin utilizar INNER JOIN).
SELECT * FROM pedido
WHERE pedido.id_cliente = (
SELECT cliente.id FROM cliente
WHERE CONCAT(cliente.nombre," ",cliente.apellido1," ",cliente.apellido2)
LIKE("Adela Salas Díaz"));

# Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega.
# (Sin utilizar INNER JOIN)
SELECT COUNT(*) FROM pedido
WHERE pedido.id_comercial = (
SELECT comercial.id FROM comercial
WHERE CONCAT(comercial.nombre," ",comercial.apellido1," ",comercial.apellido2)
LIKE("Daniel Sáez Vega"));

# Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. 
# (Sin utilizar INNER JOIN)
SELECT pedido.id_cliente, MAX(pedido.total) AS maximo FROM pedido
WHERE YEAR(pedido.fecha) LIKE("2019")
GROUP BY pedido.id
HAVING MAX(pedido.total) >= ALL(SELECT MAX(pedido.total)FROM pedido
WHERE YEAR(pedido.fecha) LIKE("2019"));

# Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente 
# Pepe Ruiz Santana.
SELECT pedido.fecha, pedido.total FROM pedido
WHERE pedido.id = (
	SELECT pedido.id FROM pedido
	WHERE pedido.total = (
		SELECT MIN(pedido.total) FROM pedido
		INNER JOIN cliente ON cliente.id = pedido.id_cliente
		WHERE (CONCAT(cliente.nombre," ",cliente.apellido1," ",cliente.apellido2)
		LIKE ("Pepe Ruiz Santana"))
));

# Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes 
# que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor 
# medio de los pedidos realizados durante ese mismo año.
SELECT * FROM cliente
INNER JOIN pedido ON pedido.id_cliente = cliente.id
WHERE YEAR(pedido.fecha) = 2017 AND pedido.total >= (
	SELECT AVG(pedido.total) FROM pedido
    WHERE YEAR(pedido.fecha) = 2017);
    
# Devuelve el pedido más caro que existe en la tabla pedido si hacer uso de MAX, 
# ORDER BY ni LIMIT.
SELECT * FROM pedido
WHERE pedido.total >= ALL(SELECT pedido.total FROM pedido);

# Devuelve un listado de los clientes que no han realizado ningún pedido. 
# (Utilizando ANY o ALL).
SELECT * FROM cliente
WHERE cliente.id <> ALL(
SELECT DISTINCT pedido.id_cliente FROM pedido
);

# Devuelve un listado de los comerciales que no han realizado ningún pedido. 
# (Utilizando ANY o ALL).
SELECT * FROM comercial
WHERE comercial.id <> ALL(
SELECT DISTINCT pedido.id_comercial FROM pedido
);

# Devuelve un listado de los clientes que no han realizado ningún pedido.
# (Utilizando IN o NOT IN).
SELECT * FROM cliente
WHERE cliente.id NOT IN(
SELECT DISTINCT pedido.id_cliente FROM pedido);

# Devuelve un listado de los comerciales que no han realizado ningún pedido. 
# (Utilizando IN o NOT IN).
SELECT * FROM comercial
WHERE comercial.id NOT IN(
SELECT DISTINCT pedido.id_comercial FROM pedido);

# Devuelve un listado de los clientes que no han realizado ningún pedido. 
# (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM cliente
WHERE NOT EXISTS(
SELECT * FROM pedido
WHERE cliente.id = pedido.id_cliente
);

# Devuelve un listado de los comerciales que no han realizado ningún pedido. 
# (Utilizando EXISTS o NOT EXISTS).
SELECT * FROM comercial
WHERE NOT EXISTS(
SELECT * FROM pedido
WHERE pedido.id_comercial = comercial.id
);

