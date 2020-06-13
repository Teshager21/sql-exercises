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

--COALESCE with LEFT JOIN

SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON(teacher.dept=dept.id)

--COUNT
SELECT COUNT(teacher.id), COUNT(teacher.mobile)
FROM teacher

--select and NULL
SELECT dept.name,
COUNT(teacher.name)
FROM dept LEFT JOIN teacher ON (teacher.dept=dept.id)
GROUP BY dept.name

--CASE
SELECT teacher.name ,CASE WHEN teacher.dept=1
                         THEN 'Sci'
                         WHEN teacher.dept=2
                         THEN 'Sci'
                         ELSE 'Art'
                          
                         END
FROM teacher

--case and none

SELECT teacher.name ,CASE WHEN teacher.dept=1 OR teacher.dept=2
                         THEN 'Sci'
                         WHEN teacher.dept=3
                         THEN 'Art'
                         ELSE 'None'
               
                         END
FROM teacher
