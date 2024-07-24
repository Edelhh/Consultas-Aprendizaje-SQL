# Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
SELECT SUM(pedido.total) FROM pedido;

# Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(pedido.total) FROM pedido;

# Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(DISTINCT pedido.id_comercial) FROM pedido;

# Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT COUNT(*) FROM cliente;

# Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(pedido.total) FROM pedido;

# Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT MIN(pedido.total) FROM pedido;

# Calcula cuál es el valor máximo de categoría para cada una de las ciudades que 
# aparece en la tabla cliente.
SELECT cliente.ciudad, MAX(cliente.categoria) FROM cliente
GROUP BY cliente.ciudad;

# Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para 
# cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos 
# de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo 
# valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el 
# identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
SELECT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2, 
pedido.fecha, MAX(pedido.total) FROM cliente
INNER JOIN pedido ON pedido.id_cliente = cliente.id
GROUP BY cliente.id, pedido.fecha;

# Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día 
# para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar 
# aquellos pedidos que superen la cantidad de 2000 €.
SELECT cliente.id, pedido.fecha, MAX(pedido.total) FROM cliente
INNER JOIN pedido ON pedido.id_cliente = cliente.id
GROUP BY cliente.id,pedido.fecha
HAVING MAX(pedido.total) > 2000;

# Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales 
# durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y 
# total.
SELECT comercial.id, comercial.nombre,comercial.apellido1, comercial.apellido2,MAX(pedido.total) FROM comercial
INNER JOIN pedido ON pedido.id_comercial  = comercial.id 
WHERE pedido.fecha LIKE("2016-08-17")
GROUP BY comercial.id, pedido.fecha;

# Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total 
# de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir 
# clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en 
# el listado indicando que el número de pedidos realizados es 0.
SELECT cliente.id, cliente.nombre,cliente.apellido1,cliente.apellido2, COUNT(pedido.id_cliente) FROM cliente
LEFT JOIN pedido ON cliente.id = pedido.id_cliente
GROUP BY cliente.id;

# Devuelve un listado con el identificador de cliente, nombre y apellidos y 
# el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
SELECT cliente.id, cliente.nombre, cliente.apellido1, cliente.apellido2,
COUNT(pedido.id_cliente) FROM cliente
LEFT JOIN pedido ON cliente.id = pedido.id_cliente
WHERE pedido.fecha LIKE("2017%")
GROUP BY pedido.id_cliente;

# Devuelve un listado que muestre el identificador de cliente, nombre, 
# primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de 
# los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún 
# pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso 
# de la función IFNULL.
SELECT cliente.id, cliente.nombre, cliente.apellido1, 
IFNULL(MAX(pedido.total), 0) FROM cliente
LEFT JOIN pedido ON cliente.id = pedido.id_cliente
GROUP BY cliente.id;

# Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT YEAR(pedido.fecha), MAX(pedido.total) FROM pedido
GROUP BY pedido.fecha;

# Devuelve el número total de pedidos que se han realizado cada año.
SELECT YEAR(pedido.fecha), COUNT(YEAR(pedido.fecha)) FROM pedido
GROUP BY YEAR(pedido.fecha);



