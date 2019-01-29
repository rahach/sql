-- lab 09_01

SELECT department_id FROM departments
MINUS
SELECT department_id FROM employees
WHERE job_id = 'ST_CLERK';

SELECT * FROM departments;

SELECT * FROM countries;

SELECT * FROM locations;

SELECT * FROM employees;

SELECT country_id, country_name FROM countries
MINUS
SELECT l.country_id, c.country_name
FROM locations l JOIN countries c
ON (l.country_id = c.country_id)
JOIN departments d
ON d.location_id = l.location_id;

SELECT employee_id, job_id, department_id FROM employees
WHERE department_id = 50
UNION ALL
SELECT employee_id, job_id, department_id FROM employees
WHERE department_id = 80;

SELECT employee_id FROM employees
WHERE department_id = 80
INTERSECT
SELECT employee_id FROM employees
WHERE job_id = 'SA_REP';

SELECT last_name last_name, department_id department_id, NULL dept_name FROM employees
UNION
SELECT NULL, department_id, department_name FROM departments;

































