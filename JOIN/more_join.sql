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

--Join three tables

SELECT  movie.title, actor.name
FROM movie JOIN casting ON movie.id=casting.movieid JOIN actor ON actor.id=casting.actorid
WHERE movie.yr=1962 AND casting.ord=1

--aggregation with three tables

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

--biuld table and join
SELECT movie.title, name
FROM movie JOIN casting ON movie.id=movieid
           JOIN actor   ON actor.id=actorid AND ord=1
WHERE movieid IN (SELECT movieid
FROM casting JOIN actor ON actor.id=actorid
WHERE actor.name="Julie Andrews")


--actors with 15 leading roles

SELECT DISTINCT actor.name 
FROM actor JOIN casting ON actor.id=actorid
WHERE actorid in (SELECT actorid
FROM casting y
WHERE (SELECT COUNT(actorid) FROM casting x
WHERE x.actorid=y.actorid AND ord=1
GROUP BY actorid
HAVING COUNT(actorid)>=15))
ORDER BY actor.name

--number of actors per each cast

SELECT movie.title, COUNT(actorid)
FROM movie JOIN casting x ON id=movieid
WHERE yr=1978 AND movieid IN (SELECT movieid FROM casting y WHERE
x.movieid=y.movieid)
GROUP BY (movieid)
ORDER BY  COUNT(actorid) DESC ,title