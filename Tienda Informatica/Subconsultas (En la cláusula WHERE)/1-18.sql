# Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT producto.nombre,producto.id_fabricante FROM producto 
WHERE producto.id_fabricante = (
	SELECT fabricante.id FROM fabricante
    WHERE fabricante.nombre = "Lenovo"
);

# Devuelve todos los datos de los productos que tienen el mismo precio 
# que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto
WHERE producto.precio = (
SELECT MAX(producto.precio) FROM producto
WHERE producto.id_fabricante = (
SELECT fabricante.id FROM fabricante
WHERE fabricante.nombre = "Lenovo"
) );

# Lista el nombre del producto más caro del fabricante Lenovo.
# Nota personal: Sin inner
SELECT producto.nombre FROM producto
WHERE producto.id_fabricante = (
SELECT fabricante.id FROM fabricante
WHERE fabricante.nombre = "Lenovo" )
ORDER BY producto.precio DESC
LIMIT 1;
# Nota persona: Con INNER
SELECT producto.nombre, producto.precio FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre = "Lenovo"
ORDER BY producto.precio DESC
LIMIT 1;

# Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT producto.nombre FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre = "Hewlett-Packard"
ORDER BY producto.precio ASC
LIMIT 1;

# Devuelve todos los productos de la base de datos que tienen un precio mayor o 
# igual al producto más caro del fabricante Lenovo.
SELECT fabricante.nombre, producto.nombre, producto.precio FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= (
SELECT MAX(producto.precio) FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre = "Lenovo"
);

# Lista todos los productos del fabricante Asus que tienen un precio superior 
# al precio medio de todos sus productos.
SELECT fabricante.nombre, producto.nombre, producto.precio FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE producto.precio > (
SELECT AVG(producto.precio) FROM producto
)  AND (fabricante.nombre = "Asus");

# Devuelve el producto más caro que existe en la tabla producto sin 
# hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio >= ALL(
SELECT precio FROM producto
);

# Devuelve el producto más barato que existe en la tabla producto sin hacer uso 
# de MIN, ORDER BY ni LIMIT.
SELECT * FROM producto
WHERE precio <= ALL(
	SELECT precio FROM producto
);

# Devuelve los nombres de los fabricantes que tienen productos asociados. 
# (Utilizando ALL o ANY).
SELECT fabricante.nombre FROM fabricante
WHERE fabricante.id = ANY(
	SELECT producto.id_fabricante FROM producto
);

# Devuelve los nombres de los fabricantes que no tienen productos asociados. 
# (Utilizando ALL o ANY).
SELECT fabricante.nombre FROM fabricante
WHERE fabricante.id != ALL(
SELECT producto.id_fabricante FROM producto
);

# Devuelve los nombres de los fabricantes que tienen productos asociados. 
# (Utilizando IN o NOT IN).
SELECT nombre FROM fabricante
WHERE fabricante.id IN (
SELECT producto.id_fabricante FROM producto
);

#  Devuelve los nombres de los fabricantes que no tienen productos asociados. 
# (Utilizando IN o NOT IN).
SELECT fabricante.nombre FROM fabricante
WHERE fabricante.id NOT IN (
SELECT producto.id_fabricante FROM producto
);

# Devuelve los nombres de los fabricantes que tienen productos asociados. 
# (Utilizando EXISTS o NOT EXISTS).
SELECT fabricante.nombre FROM fabricante
WHERE EXISTS( 
SELECT producto.id_fabricante FROM producto
WHERE producto.id_fabricante = fabricante.id
);

# Devuelve los nombres de los fabricantes que no tienen productos asociados. 
# (Utilizando EXISTS o NOT EXISTS).
SELECT fabricante.nombre FROM fabricante
WHERE NOT EXISTS(
SELECT producto.id FROM producto
WHERE producto.id_fabricante = fabricante.id
);

# Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT fabricante.nombre, producto.nombre, producto.precio FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE producto.precio = ANY (
SELECT MAX(producto.precio) FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
);

# Devuelve un listado de todos los productos que tienen un precio mayor 
# o igual a la media de todos los productos de su mismo fabricante.
SELECT * FROM producto AS tabla1
WHERE tabla1.precio >=(
SELECT AVG(precio) FROM producto AS tabla2
WHERE tabla1.id_fabricante = tabla2.id_fabricante);

# Lista el nombre del producto más caro del fabricante Lenovo.
SELECT producto.nombre FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE producto.precio = (
SELECT MAX(producto.precio) FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre = "Lenovo" 
);

# Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo 
# número de productos que el fabricante Lenovo.
SELECT fabricante.nombre FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(producto.id) = (
SELECT COUNT(producto.id) FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING fabricante.nombre = "Lenovo")
AND fabricante.nombre != "Lenovo";









