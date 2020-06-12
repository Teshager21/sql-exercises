SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

 ---nobel winner

 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'