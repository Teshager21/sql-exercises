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