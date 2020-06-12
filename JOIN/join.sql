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