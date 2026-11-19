use world;

describe country;

/* Ejercicio 1 del Miercoles 18 de noviembre
Obtener el total de habitantes que hay por continente y región.
Excluir aquellos que tengan población inferior al millón o que no hayan obtenido su independencia
Ordenar por total de población, mostrando las regiones que tienen menos población primero.
Solo mostrar los registros con > 5 millones
*/
SELECT 
	Continent, Region, SUM(Population) AS `Poblacion`
FROM
	country
WHERE
	Population >= 1000000 AND IndepYear IS NOT NULL
GROUP BY
	Continent, Region
HAVING 
	`Poblacion` > 5000000
ORDER BY
	`Poblacion`
;

