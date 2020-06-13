--no dpt 
SELECT name 
FROM teacher
WHERE dept IS NULL

--inner join

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

--left join

SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept ON(dept.id=teacher.dept)

--right join

SELECT teacher.name,dept.name
FROM teacher RIGHT JOIN dept ON(teacher.dept=dept.id)

--COALESCE
SELECT teacher.name, COALESCE(mobile,'07986 444 2266')
FROM teacher
