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
ORDER BY yr