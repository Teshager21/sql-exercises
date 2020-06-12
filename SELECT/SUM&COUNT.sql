SELECT SUM(population)
FROM world
--list continents
SELECT DISTINCT continent
FROM world
--gdp of africa
SELECT SUM(gdp)
FROM world
WHERE continent='africa'

--select with COUNT
SELECT COUNT(*)
FROM world
WHERE area>=1000000

--select sum with IN
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

--select with group by
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

--group by with where

SELECT continent, COUNT(name)
FROM world
WHERE population>=10000000
GROUP BY continent

--group by with having

SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population)>=100000000