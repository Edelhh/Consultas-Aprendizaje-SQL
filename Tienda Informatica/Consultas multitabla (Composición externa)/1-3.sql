# Devuelve un listado de todos los fabricantes que existen en la base de datos, 
# junto con los productos que tiene cada uno de ellos. El listado deberá mostrar 
# también aquellos fabricantes que no tienen productos asociados.

SELECT fabricante.nombre, producto.nombre AS "nombre producto" FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante;

# Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún 
# producto asociado.
SELECT DISTINCT fabricante.id, fabricante.nombre FROM fabricante
LEFT JOIN producto ON fabricante.id = producto.id_fabricante
WHERE producto.id_fabricante IS NULL;

# ¿Pueden existir productos que no estén relacionados con un fabricante? 
# productoproductoJustifique su respuesta.

# RTS: No, ya que se tiene configurado producto.id_fabricante como no nulo.



