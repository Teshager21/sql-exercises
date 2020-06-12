SELECT name, continent, population FROM world

--select when greater or equal to

SELECT name FROM world
WHERE population >= 200000000

--select chosen columns
SELECT name, gdp/population AS 'per capita GDP'
FROM world
WHERE population>=200000000 

--select per million of population

SELECT name, population/1000000
FROM world
WHERE continent ='South America'