use world;

select * from country where Code ="GEO";

-- Recuperar el pais que tiene la mayor población
SELECT
	Name, population
FROM
	country
ORDER BY
	population
DESC LIMIT 1;

SELECT
	Name, population
FROM
	country
WHERE population >= ALL(SELECT population FROM country);

SELECT
	Name, population
FROM
	country
WHERE population = (SELECT MAX(population) FROM country);

SELECT *
FROM country
WHERE Population > 10000000
AND IndepYear IS NULL or Region = "Caribbean"
ORDER BY population;

