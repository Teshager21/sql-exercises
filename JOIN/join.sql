SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

  --inner join

SELECT id,stadium,team1,team2
FROM game
INNER JOIN goal
ON game.id=goal.matchid
WHERE player LIKE "%Bender%"

--online join

SELECT player,teamid,stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid ="GER"

--online join
SELECt team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE goal.player LIKE "mario%"

--inline join
SELECT player, teamid,coach, gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

 --specific ON

SELECT mdate,teamname
FROM game JOIN eteam ON (game.team1=eteam.id)
WHERE coach="Fernando Santos"

--join by key
SELECT goal.player 
FROM goal JOIN game ON(game.id=goal.matchid)
WHERE game.stadium='National Stadium, Warsaw'

--score against germay

SELECT DISTINCT goal.player
  FROM game JOIN goal ON matchid = id 
    WHERE teamid!="GER" AND (team1="GER" OR team2="GER")


--join with count and group by

SELECT DISTINCT teamname, COUNT(goal.teamid)
  FROM eteam JOIN goal ON id=teamid
GROUP BY goal.teamid
ORDER BY eteam.teamname

--stadium and number of goals

SELECT DISTINCT stadium, COUNT(stadium)
FROM goal JOIN game ON matchid=id
GROUP BY stadium

--match involving POD

SELECT matchid,mdate, COUNT(matchid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY  matchid

--match to goal for germany
SELECT matchid, mdate, COUNT(matchid)
FROM game JOIN goal ON matchid=id
WHERE teamid="GER"
GROUP BY matchid

--left join

SELECT 
mdate,
team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
 FROM game LEFT JOIN goal ON id = matchid
 GROUP BY id
 ORDER BY mdate,matchid,team1,team2