-- 7

DESCR job_grades;

SELECT last_name, job_id, department_name, salary, grade_level
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
NATURAL JOIN job_grades j
WHERE salary BETWEEN lowest_sal AND highest_sal
ORDER BY salary DESC;




























