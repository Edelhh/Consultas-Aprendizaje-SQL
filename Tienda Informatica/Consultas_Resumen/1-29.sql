# Calcula el número total de productos que hay en la tabla productos.
SELECT count(*) FROM producto;

# Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(*) FROM fabricante;

# Calcula el número de valores distintos de identificador de fabricante aparecen 
# en la tabla productos.
SELECT COUNT(DISTINCT producto.id_fabricante) FROM producto;

# Calcula la media del precio de todos los productos.
SELECT AVG(precio) FROM producto;

# Calcula el precio más barato de todos los productos.
SELECT MIN(precio) FROM producto;

# Calcula el precio más caro de todos los productos.
SELECT MAX(precio) FROM producto;

# Lista el nombre y el precio del producto más barato.
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

# Lista el nombre y el precio del producto más caro.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

# Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto;

# Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(fabricante.nombre) FROM fabricante
RIGHT JOIN producto ON fabricante.id = producto.id_fabricante
WHERE fabricante.nombre = "Asus";

# Calcula la media del precio de todos los productos del fabricante Asus.
SELECT AVG(precio) FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id;

# Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(precio) FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = "Asus";

# Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(precio) FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = "Asus";

# Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(precio) FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = "Asus";

# Muestra el precio máximo, precio mínimo, precio medio y 
# el número total de productos que tiene el fabricante Crucial.
SELECT MIN(precio),MAX(precio), COUNT(precio) FROM producto
INNER JOIN fabricante ON producto.id_fabricante = fabricante.id
WHERE fabricante.nombre = "Crucial";

# Muestra el número total de productos que tiene cada uno de los fabricantes. 
# El listado también debe incluir los fabricantes que no tienen ningún producto. 
# El resultado mostrará dos columnas, una con el nombre del fabricante y otra 
# con el número de productos que tiene. Ordene el resultado descendentemente
#  por el número de productos.
SELECT fabricante.nombre, COUNT(producto.nombre) AS "numero_productos" FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
ORDER BY numero_productos DESC;

# Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno 
# de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos 
# que se solicitan.
SELECT fabricante.nombre, MAX(producto.precio), MIN(producto.precio), AVG(producto.precio) FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;

# Muestra el precio máximo, precio mínimo, precio medio y el número total de productos 
# de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar 
# el nombre del fabricante, con el identificador del fabricante es suficiente.
SELECT id_fabricante, MAX(precio), MIN(precio), AVG(precio), COUNT(*)
FROM producto
GROUP BY producto.id_fabricante
HAVING  AVG(producto.precio) > 200;

# Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, 
# precio medio y el número total de productos de los fabricantes que tienen un precio 
# medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT fabricante.nombre, MAX(producto.precio), 
MIN(producto.precio), AVG(producto.precio), COUNT(*) FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING AVG(producto.precio) > 200;

# Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(precio) FROM producto
WHERE precio >= 180;

# Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT id_fabricante, COUNT(precio) FROM producto
WHERE precio >= 180
GROUP BY id_fabricante;

# Lista el precio medio los productos de cada fabricante, mostrando solamente el 
# identificador del fabricante.
SELECT id_fabricante, AVG(precio) FROM producto
GROUP BY id_fabricante;

# Lista el precio medio los productos de cada fabricante, 
# mostrando solamente el nombre del fabricante.
SELECT fabricante.nombre, AVG(producto.precio) FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre;

# Lista los nombres de los fabricantes cuyos productos 
# tienen un precio medio mayor o igual a 150€.
SELECT DISTINCT fabricante.nombre FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 150;

# Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT fabricante.nombre, COUNT(producto.id) FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.nombre
HAVING COUNT(producto.id) >= 2;

# Devuelve un listado con los nombres de los fabricantes y el número de productos 
# que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar 
# el nombre de los fabricantes que no tienen productos que cumplan la condición.
SELECT fabricante.nombre, COUNT(producto.id) FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 220
GROUP BY fabricante.nombre;

# Devuelve un listado con los nombres de los fabricantes y el número de productos 
# que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar 
# el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene
# productos con un precio superior o igual a 220€ deberá aparecer en el listado con 
# un valor igual a 0 en el número de productos.

(SELECT fabricante.nombre, COUNT(producto.id) FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 220
GROUP BY fabricante.nombre) 
UNION
(SELECT fabricante.nombre, 0 FROM fabricante
WHERE fabricante.id NOT IN (
SELECT fabricante.id FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.precio >= 220
GROUP BY fabricante.id)) 
ORDER BY 2 DESC;

# Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos 
# sus productos es superior a 1000 €.
SELECT fabricante.nombre, SUM(producto.precio) FROM fabricante
INNER JOIN producto ON fabricante.id = producto.id_fabricante
GROUP BY fabricante.id
HAVING SUM(producto.precio) > 1000;

# Devuelve un listado con el nombre del producto más caro que tiene 
# cada fabricante. El resultado debe tener tres columnas: nombre del 
# producto, precio y nombre del fabricante. El resultado tiene que estar 
# ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
SELECT producto.nombre, producto.precio, fabricante.nombre FROM producto
INNER JOIN fabricante ON fabricante.id = producto.id_fabricante
WHERE producto.precio = (
SELECT MAX(precio) FROM producto
WHERE producto.id_fabricante = fabricante.id
) ORDER BY fabricante.nombre ASC









 


