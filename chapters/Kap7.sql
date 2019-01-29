-- Kapitel 7

SELECT * FROM employees NATURAL JOIN job_grades;

SELECT department_id, department_name, location_id, city
FROM departments
NATURAL JOIN locations
WHERE department_id IN (20, 50);
































