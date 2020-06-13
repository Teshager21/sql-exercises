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

--Join with two layer subquery
SELECT DISTINCT title
FROM movie JOIN casting ON id=movieid
WHERE id IN (SELECT movieid 
FROM casting JOIN actor ON id=actorid
WHERE actor.name="harrison ford")

--harrsion ford as a supporting role

SELECT DISTINCT title
FROM movie JOIN casting ON id=movieid
WHERE id IN (SELECT movieid 
FROM casting JOIN actor ON id=actorid
WHERE actor.name="harrison ford" AND casting.ord!=1)
