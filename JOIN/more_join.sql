SELECT id, title
 FROM movie
 WHERE yr=1962

 --when was a movie released

 SELECT yr
FROM movie
WHERE title='citizen kane'
LIMIT 1;

--all startrek movies

SELECT id, title, yr
FROM movie
WHERE title LIKE '%star trek%'
ORDER BY yr;

--Glen's id

SELECT id
FROM actor
WHERE name="glenn close"

--ID of casablanca

SELECT id
FROM movie
WHERE title='casablanca'
LIMIT 1

--chain joins
SELECT actor.name
FROM actor JOIN casting ON(actorid=id)
WHERE movieid=11768

--JOIN with subquery

SELECT actor.name
FROM actor JOIN casting ON id=actorid
WHERE movieid=(SELECT movie.id
FROM movie
WHERE title="Alien")
