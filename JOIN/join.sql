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