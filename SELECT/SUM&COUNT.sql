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