SELECT population FROM world
  WHERE name = 'germany'

  --scandinavian population

  SELECT name, population FROM world
  WHERE name IN ('sweden', 'norway', 'denmark');

  --which countries are too small
  SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
