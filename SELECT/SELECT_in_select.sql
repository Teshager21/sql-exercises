SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='russia')
 --select multi criteria with multilayer
 SELECT name 
FROM world
WHERE continent="europe" AND GDP/population >
               (SELECT GDP/population
               FROM world
               WHERE name= "united kingdom")

 --select multilayer with IN
 SELECT name, continent
FROM world
WHERE continent IN
 (SELECT continent
   FROM world
   WHERE  name='argentina' or name='australia')
ORDER BY name

--two select in a select

SELECT name
FROM world
WHERE population >
(SELECT population
FROM world
WHERE name='canada' ) AND population <
(SELECT population
FROM world
WHERE name='poland')

--percentages of Germany

SELECT name, CONCAT(ROUND (population/(SELECT population FROM world WHERE name="Germany")*100,0),'%')
FROM world
WHERE continent ='europe'

--select max

SELECT name
FROM world
WHERE gdp >(SELECT gdp FROM world WHERE continent='europe' ORDER BY gdp DESC LIMIT 1)

--synchronised subqueries
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)
 --corellated subquery with distinct
 SELECT DISTINCT continent, (SELECT name FROM world y WHERE x.continent=y.continent ORDER BY name LIMIT 1)
FROM world x 

--three layer deep subqueries 
SELECT name ,continent, population
FROM world
WHERE continent =(SELECT DISTINCT continent
FROM world x
WHERE 25000000>=ALL(SELECT population
FROM world y
WHERE x.continent=y.continent))

---correlated subqueries with exclusion
SELECT name, continent
FROM world x
WHERE population >ALL(SELECT 3*population FROM world y
WHERE x.continent=y.continent AND x.name!=y.name)