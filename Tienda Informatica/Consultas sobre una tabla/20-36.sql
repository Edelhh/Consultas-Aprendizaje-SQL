# Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
SELECT id_fabricante,nombre FROM producto WHERE producto.id_fabricante = 2;

# Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT precio, nombre FROM producto WHERE precio <= 120;

# Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT precio, nombre FROM producto WHERE precio >= 400;

# Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT precio, nombre FROM producto WHERE precio < 400; 

# Lista todos los productos que tengan un precio entre 80€ y 300€. 
# Sin utilizar el operador BETWEEN
SELECT * FROM producto WHERE (precio >= 80) AND (precio <= 300);

# Lista todos los productos que tengan un precio entre 60€ y 200€. 
# Utilizando el operador BETWEEN.
SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;

# Lista todos los productos que tengan un precio mayor que 200€ y 
# que el identificador de fabricante sea igual a 6.
SELECT * FROM producto WHERE (precio > 200) AND (id_fabricante = 6);

# Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. 
# Sin utilizar el operador IN.
SELECT * FROM producto WHERE (id_fabricante = 1) OR (id_fabricante = 3) OR (id_fabricante = 5);

# Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. 
# Utilizando el operador IN.
SELECT * FROM producto WHERE id_fabricante IN (1,3,5);

# Lista el nombre y el precio de los productos en céntimos 
# (Habrá que multiplicar por 100 el valor del precio). 
# Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio*100 AS céntimos FROM producto;

# Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

# Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante WHERE nombre LIKE "%e";

# Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante WHERE nombre LIKE "%w%";

# Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
# Nota personal: Parece que se puede usar LENGTH pero por cuestiones de como este codificado
# puede que cuente demas. 
SELECT nombre FROM fabricante WHERE CHARACTER_LENGTH(nombre) = 4;

# Devuelve una lista con el nombre de todos los productos que 
# contienen la cadena Portátil en el nombre.
SELECT nombre FROM producto WHERE nombre LIKE ("%Portátil%");

# Devuelve una lista con el nombre de todos los productos que contienen 
# la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT nombre,precio FROM producto WHERE nombre LIKE ("%Monitor%") AND (precio < 215);

# Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
# Ordene el resultado en primer lugar por el precio (en orden descendente) 
# y en segundo lugar por el nombre (en orden ascendente).

SELECT nombre, precio FROM producto WHERE (precio >= 180) ORDER BY precio DESC, nombre ASC;
 



