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