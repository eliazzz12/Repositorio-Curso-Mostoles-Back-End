use world;

/*
	Ejercicio 2 Miercoles 18 de noviembre
    Obtener el nombre de los paises y el idioma oficial
*/

SELECT
	Name, Language, isOfficial
FROM 
	country c
		JOIN 
	countrylanguage cl
		ON
			c.Code = cl.CountryCode 
				AND
			cl.isOfficial = TRUE
;

/* Ejercicio 3 18 nov
Recuperar la ciudad mas poblada y el nombre de su pais
*/
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

/* Ejercicio 4 18 nov
	Modificar la consulta del #2 para que solamente se muestren resultados para españa y todos los idiomas
*/
SELECT
	Name, Language, isOfficial
FROM 
	country c
		JOIN 
			countrylanguage cl
		ON
			c.Code = "ESP"
				AND
			c.Code = cl.CountryCode	
;