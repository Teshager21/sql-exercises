SELECT population FROM world
  WHERE name = 'germany'

  --scandinavian population

  SELECT name, population FROM world
  WHERE name IN ('sweden', 'norway', 'denmark');
