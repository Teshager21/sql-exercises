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