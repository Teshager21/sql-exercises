SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

 ---nobel winner

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
 
 --when alber einstein won

 SELECT yr, subject
FROM nobel
WHERE winner='Albert einstein'

--peace winner

SELECT winner
FROM nobel
WHERE subject="peace"

--select with BETWEEN

SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989 AND subject="Literature"

--select usig IN
SELECT * 
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter','Barack Obama')

--select with start %

SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

--select with and and or

SELECT yr, subject, winner
FROM  nobel
WHERE  (subject='physics' AND yr=1980) OR (subject='chemistry' AND yr=1984)

--selec with not equal to

SELECT yr, subject, winner
FROM nobel
WHERE yr=1980 AND (subject !='chemistry' AND subject != 'medicine')

--select with exclusion and inclusion

SELECT yr, subject, winner
FROM nobel
WHERE subject='medicine' AND yr<1910 OR(subject='literature' AND yr>=2004)

--select with wildcard character
SELECT *
FROM nobel
WHERE  winner LIKE "peter gr_nberg"

--select with escape

SELECT *
FROM nobel
WHERE winner= "eugene o\'neill"

--select order in with desc

SELECT winner, yr, subject
FROM nobel
WHERE winner REGEXP "^Sir" ORDER BY yr DESC
