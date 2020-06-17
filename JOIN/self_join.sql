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

-- Give the id and the name for the stops on the '4' 'LRT' service.
SELECT id, name FROM route 
JOIN stops ON stops.id =stop
WHERE num = 4 AND company = 'LRT';

-- Give the number of routes that visit either London Road (149) or Craiglockhart (53). 
-- The two services that link these stops have a count of 2. Restrict the output to these two routes.
SELECT company, num, COUNT(*) FROM route
WHERE stop = 149 OR stop = 53
GROUP BY company, num
HAVING COUNT(*) = 2;

-- Show the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
(a.company = b.company AND a.num = b.num)
WHERE a.stop = 53 AND b.stop = 149;

-- Show the services between 'Craiglockhart' and 'London Road'
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
(a.company = b.company AND a.num = b.num)
  JOIN stops stopa ON (a.stop = stopa.id)
  JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND stopb.name = 'London Road';

-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b 
ON (a.company = b.company AND a.num = b.num)
WHERE a.stop = 115 AND b.stop = 137;

--  Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b 
ON (a.company = b.company AND a.num = b.num) 
JOIN stops stopa ON stopa.id = a.stop 
JOIN stops stopb ON stopb.id = b.stop
WHERE stopa.name = 'Craiglockhart' 
AND stopb.name = 'Tollcross';

--  Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' 
-- itself, offered by the LRT company. Include the company and bus no. of the relevant services.
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b 
ON (a.company = b.company AND a.num = b.num) 
JOIN stops stopa ON stopa.id = a.stop 
JOIN stops stopb ON stopb.id = b.stop
WHERE stopa.name = 'Craiglockhart';

--Find the routes involving two buses that can go from Craiglockhart to Lochend. Show the bus no. 
-- and company for the first bus, the name of the stop for the transfer, and the bus no. and company for the second bus.
SELECT t1.num, t1.company, t1.stopb, t2.num, t2.company
FROM (SELECT a.num, a.company, stopb.name stopb
  FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num) 
  JOIN stops stopa ON stopa.id = a.stop 
  JOIN stops stopb ON stopb.id = b.stop
  WHERE stopa.name = 'Craiglockhart') t1
  JOIN
  (SELECT a.num, a.company, stopa.name stopa
  FROM route a JOIN route b 
  ON (a.company = b.company AND a.num = b.num) 
  JOIN stops stopa ON stopa.id = a.stop 
  JOIN stops stopb ON stopb.id = b.stop
  WHERE stopb.name = 'Lochend') t2
  ON t1.stopb = t2.stopa;