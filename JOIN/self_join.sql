SELECT COUNT(stops.id)
FROM stops

SELECT id
FROM stops
WHERE name="Craiglockhart"

--routes and stops
SELECT company, num, COUNT(company)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(company)=2