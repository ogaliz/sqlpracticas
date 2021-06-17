-- Muestra el nombre de los países de Asia concatenados por espacios en blanco.
select group_concat(Name separator ' ') from country where Continent = 'Asia';

-- Muestra el nombre de los países de Asia concatenados por espacios en blanco y ordenados alfabéticamente.
select group_concat(Name order by Name asc separator ' ') `Paises Asiaticos`
from country 
where Continent = 'Asia'; 

-- Consulta que cuente el numero de continentes distintos 
select count( distinct Continent ) from country;

-- --------------------------------------------------------------
-- PROBLEMA AGREGACIONES 2
-- --------------------------------------------------------------
-- Calcula la máxima población para cada continente
select max(Population), Continent from country group by Continent;

-- ¿Qué sucede si hago ‘SELECT Name, MAX(Population) from Country GROUP BY Continent’?
select Name, MAX(Population) from Country GROUP BY Continent;
-- Name no está dentro de la clausuala group by

-- Ordena de mayor a menor los continentes según la media de las esperanzas de vida
-- de los países que los forman
select avg(LifeExpectancy), Continent from country group by Continent order by 1 desc;

-- ¿Cuál es el continente con menor población?
select sum(Population), Continent from country group by Continent order by 1 asc limit 2;

-- ¿Cuál es la región de mayor población en Europa?
select sum(Population), Region from country 
where Continent = 'Europe' 
group by Region 
order by 1 desc limit 1;

-- Muestra todos los países sudamericanos que comparten la misma forma de gobierno.
select group_concat(Name separator '-') Paises, GovernmentForm 
from country 
where Continent = 'South America' 
group by GovernmentForm;

-- Muestra las 5 formas de gobierno más comunes en el mundo
select count(GovernmentForm) Cantidad, GovernmentForm from country 
group by GovernmentForm 
order by 1 desc limit 5;

-- ---------------------------------------------------------------
-- PROBLEMA AGREGACIONES 3
-- --------------------------------------------------------------
-- Muestra aquellas continentes cuya población supere los 1000000000
-- habitantes.
select Continent, sum(Population) `Poblacion` from country group by Continent;
select Continent from country;

-- Agrupa las ciudades según el campo ‘CountryCode’ y muestra el
-- CountryCode de aquellas agrupaciones cuya población media sea superior a
-- 500000.
-- ● Agrupa las ciudades según el campo ‘CountryCode’ y muestra la población
-- media de aquellas agrupaciones cuyo CountryCode empieza por ‘A’
-- (utilizando HAVING)
-- ● Muestra aquellas regiones que contengan más de 10 países.
-- ● Muestra aquellas formas de gobierno que compartan más de 20 países
-- ● Muestra la población media de aquellos continentes que estén formados por
-- más de 50 países. 