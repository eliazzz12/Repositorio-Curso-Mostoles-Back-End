use world;

/* Recuperar el país y la población del país que tiene más habitantes, con subconsulta */
SELECT
	Name, Population
FROM 
	country
WHERE
	Population = (SELECT MAX(Population) FROM country)
;

-- Ej 1 19 Nov
SELECT
	ci.Name, co.Name
FROM 
	city ci
INNER JOIN
	country co
ON
	ci.CountryCode = co.Code
WHERE
	ci.Population = (SELECT MAX(population) FROM city)
;


use jardineria;

/*Queremos conocer el nombre del producto mas caro*/
SELECT
	nombre
FROM
	producto
WHERE
	precio_venta = (
		SELECT
			MAX(precio_venta)
		FROM
			producto)
;


use tienda;
/* Subconsulta en la clausula HAVING

Recuperar un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante ASUS
*/
SELECT 
	f.nombre 
FROM 
	fabricante f
		JOIN
	producto p
		ON
			f.id = p.id_fabricante
		AND
			f.nombre != 'Asus'
GROUP BY p.id_fabricante
HAVING
	COUNT(*) = (
		SELECT COUNT(*) FROM producto WHERE id_fabricante = (
			SELECT id FROM fabricante WHERE nombre = 'Asus'));


/* Subconsulta en la clausula FROM 

Recuperar el listado de todos los productos que tienen un precio mayor o igual al precio promedio de su mismo fabricante
*/
SELECT nombre, precio, id_fabricante
FROM producto NATURAL JOIN (SELECT AVG(precio) AS promedio, id_fabricante FROM producto GROUP BY id_fabricante) AS promedios
WHERE precio >= promedios.promedio; 
