USE university;

-- The average grade that is given by each professor

SELECT
p.professors_last_name  AS 'Last name',
p.professors_first_name  AS 'First name',
AVG(g.grades_score) AS 'Average Grade'
FROM grades g
JOIN courses c
ON c.courses_id = g.grades_courses_id
JOIN professors p
ON p.professors_id = c.courses_professors_id
GROUP BY c.courses_professors_id
ORDER BY p.professors_last_name;

-- The top grades for each student

SELECT
s.students_last_name AS 'Last name',
s.students_first_name AS 'First name',
MAX(g.grades_score) AS 'Top Grade'
FROM grades g
JOIN students s
ON s.students_id = g.grades_students_id
GROUP BY g.grades_students_id
ORDER BY s.students_last_name;


-- Sort students by the courses that they are enrolled in

SELECT
c.courses_name AS 'Course',
s.students_last_name AS 'Last name',
s.students_first_name AS 'First name'
FROM grades g
JOIN courses c                                      
ON g.grades_courses_id = c.courses_id
JOIN students s
ON s.students_id = g.grades_students_id
ORDER BY c.courses_name;

-- Create a summary report of courses and their average grades, sorted by the most challenging course
-- (course with the lowest average grade) to the easiest course
SELECT
c.courses_name AS 'Course',
AVG(g.grades_score) AS 'Average grade'
FROM courses c
JOIN grades g
ON g.grades_courses_id = c.courses_id
GROUP BY g.grades_courses_id
ORDER BY AVG(g.grades_score) ASC;

-- Finding which student and professor have the most courses in common

SELECT
p.professors_last_name AS "Professor last name",
p.professors_first_name AS "Professor first name",
s.students_last_name AS "Student last name",
s.students_first_name AS "Student first name",
COUNT(s.students_id) AS "CLASSES IN COMMON"
FROM professors p
JOIN courses c
ON p.professors_id = c.courses_professors_id
JOIN grades g
ON c.courses_id = g.grades_courses_id
JOIN students s
ON g.grades_students_id = s.students_id
GROUP BY p.professors_id, s.students_id
ORDER BY COUNT(s.students_id) DESC
LIMIT 1;