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