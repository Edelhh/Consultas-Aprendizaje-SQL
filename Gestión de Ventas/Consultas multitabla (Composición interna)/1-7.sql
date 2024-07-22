# Devuelve un listado con el identificador, nombre y los apellidos de todos 
# los clientes que han realizado algún pedido. El listado debe estar ordenado 
# alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2 FROM cliente
INNER JOIN pedido ON pedido.id_cliente = cliente.id
ORDER BY cliente.nombre ASC;

# Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. 
# El resultado debe mostrar todos los datos de los pedidos y del cliente. 
# El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT * FROM cliente
INNER JOIN pedido ON pedido.id_cliente = cliente.id
ORDER BY cliente.nombre ASC;

# Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. 
# El resultado debe mostrar todos los datos de los pedidos y de los comerciales. 
# El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
SELECT * from comercial
INNER JOIN pedido ON pedido.id_comercial = comercial.id
ORDER BY comercial.nombre ASC;

# Devuelve un listado que muestre todos los clientes, con todos los pedidos que 
# han realizado y con los datos de los comerciales asociados a cada pedido.
SELECT * FROM cliente
INNER JOIN pedido ON pedido.id_cliente = cliente.id
INNER JOIN comercial ON pedido.id_comercial = comercial.id;

# Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, 
# cuya cantidad esté entre 300 € y 1000 €.
SELECT cliente.nombre, pedido.fecha, pedido.total FROM cliente
INNER JOIN pedido ON cliente.id = pedido.id_cliente
WHERE pedido.fecha LIKE("2017%") AND (pedido.total BETWEEN 300 AND 1000);

# Devuelve el nombre y los apellidos de todos los comerciales que ha participado 
# en algún pedido realizado por María Santana Moreno.
SELECT comercial.nombre, comercial.apellido1, comercial.apellido2 FROM comercial
INNER JOIN pedido ON pedido.id_comercial = comercial.id
INNER JOIN cliente ON pedido.id_cliente = cliente.id
WHERE CONCAT(cliente.nombre," ",cliente.apellido1," ",cliente.apellido2) 
LIKE("María Santana Moreno");

# Devuelve el nombre de todos los clientes que han realizado algún pedido con 
# el comercial Daniel Sáez Vega.
SELECT cliente.nombre FROM cliente
INNER JOIN pedido ON pedido.id_cliente = cliente.id
INNER JOIN comercial ON pedido.id_comercial = comercial.id
WHERE CONCAT(comercial.nombre," ",comercial.apellido1," ",comercial.apellido2)
LIKE("Daniel Sáez Vega")