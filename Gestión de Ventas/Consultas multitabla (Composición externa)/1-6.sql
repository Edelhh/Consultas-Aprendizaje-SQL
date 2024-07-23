# Devuelve un listado con todos los clientes junto con los datos de los pedidos que han
# realizado. Este listado también debe incluir los clientes que no han realizado 
# ningún pedido. El listado debe estar ordenado alfabéticamente por el primer apellido,
# segundo apellido y nombre de los clientes.
SELECT cliente.nombre, cliente.apellido1, cliente.apellido2, 
pedido.fecha,pedido.total,pedido.id_comercial FROM cliente
LEFT JOIN pedido ON pedido.id_cliente = cliente.id
ORDER BY cliente.apellido1 ASC, cliente.apellido2 ASC, cliente.nombre;

# Devuelve un listado con todos los comerciales junto con los datos de los pedidos 
# que han realizado. Este listado también debe incluir los comerciales que no han 
# realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el 
# primer apellido, segundo apellido y nombre de los comerciales.
SELECT * FROM comercial
LEFT JOIN pedido ON pedido.id_comercial = comercial.id
ORDER BY comercial.apellido1 ASC, comercial.apellido2 ASC, comercial.nombre ASC;

# Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT * FROM cliente
LEFT JOIN pedido ON pedido.id_cliente = cliente.id
WHERE pedido.id IS NULL;

# Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
SELECT * FROM comercial
LEFT JOIN pedido ON pedido.id_comercial = comercial.id
WHERE pedido.id IS NULL;

# Devuelve un listado con los clientes que no han realizado ningún pedido y de los 
# comerciales que no han participado en ningún pedido. Ordene el listado alfabéticamente 
# por los apellidos y el nombre. En en listado deberá diferenciar de algún modo los clientes 
# y los comerciales.
(SELECT "Cliente" AS categoria, cliente.nombre, cliente.apellido1, cliente.apellido2 
FROM cliente
LEFT JOIN pedido ON pedido.id_cliente = cliente.id
WHERE pedido.id IS NULL)
UNION
(SELECT "Comercial", comercial.nombre, comercial.apellido1, comercial.apellido2
FROM comercial
LEFT JOIN pedido ON pedido.id_comercial = comercial.id
WHERE pedido.id IS NULL)
ORDER BY apellido1 ASC,apellido2 ASC,nombre ASC;

# ¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? 
# Justifique su respuesta.
# RTS: No porque natural usa para la unión las columnas que tienen el mismo nombre
# y por ejemplo si quiero unir Cliente y pedido estas solo tendrian en comun la columna "id"
# Que hace referencia al id personal de cada una de estas tablas mas no de enlace
# para que funcionara deberia estar una variable llamada "id_cliente" tanto en Cliente como 
# en Pedido

