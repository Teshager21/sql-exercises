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

--use IN
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany','Italy')

--select using LIKE
SELECT name
FROM world
WHERE name LIKE '%United%'

--select with OR
SELECT name, population, area
FROM world
WHERE area>3000000 OR population>250000000

--select and XOR

SELECT name, population, area
FROM world
WHERE area>3000000 XOR population>250000000