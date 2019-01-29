-- rows from both queries
-- duplicates are removed
SELECT first_name
FROM employees
UNION
SELECT first_name
FROM retired_employees
ORDER BY first_name ASC;

-- rows from both queries
-- duplicates are included
SELECT first_name
FROM employees
UNION ALL
SELECT first_name
FROM retired_employees
ORDER BY first_name ASC;

-- rows that are common to both queries
SELECT first_name
FROM employees
INTERSECT
SELECT first_name
FROM retired_employees
ORDER BY first_name ASC;

-- rows that are common to both queries
SELECT first_name
FROM employees
INTERSECT
SELECT first_name
FROM retired_employees
ORDER BY first_name ASC;

-- rows in the first query that are not present in the second query
SELECT first_name
FROM retired_employees
MINUS
SELECT first_name
FROM employees
ORDER BY first_name ASC;

-- rows in the first query that are not present in the second query
SELECT first_name
FROM employees
MINUS
SELECT first_name
FROM retired_employees
ORDER BY first_name ASC;


SELECT location_id, department_name "Department", TO_CHAR(NULL) "Warehouse location"
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL) "DEPARTMENT", state_province
FROM locations;


SELECT FIRST_NAME, JOB_ID, hire_date "HIRE_DATE"
FROM employees
UNION
SELECT FIRST_NAME, JOB_ID, TO_DATE(NULL) "HIRE_DATE"
FROM retired_employees;

-- PRACTICE
-- 1
DESCR departments;
DESCR employees;

SELECT department_id FROM departments
MINUS
SELECT department_id FROM employees 
WHERE job_id = 'ST_CLERK';

SELECT department_id, job_id FROM employees;




--2
DESCR locations;
DESCR departments;
DESCR countries;
SELECT * FROM countries;
SELECT * FROM departments;
SELECT * FROM locations;

SELECT country_id, country_name FROM countries
MINUS
SELECT DISTINCT l.country_id, c.country_name  FROM locations l
JOIN departments d
ON l.location_id=d.location_id
JOIN countries c
ON c.country_id = l.country_id;

--3
SELECT department_id FROM employees 
WHERE department_id IN(50,80)
ORDER BY department_id ASC;

SELECT employee_id, job_id, department_id FROM employees 
WHERE department_id = 50
UNION ALL
SELECT employee_id, job_id, department_id FROM employees 
WHERE department_id = 80;

--4
DESCR employees;
SELECT * FROM employees;

SELECT e1.employee_id, e1.job_id, d1.department_name FROM employees e1
JOIN departments d1
ON e1.department_id=d1.department_id
WHERE e1.job_id='SA_REP'
INTERSECT
SELECT e2.employee_id, e2.job_id, d2.department_name FROM employees e2
JOIN departments d2
ON e2.department_id=d2.department_id
WHERE d2.department_name='Sales';

--5
SELECT * FROM departments;
SELECT * FROM employees;
SELECT last_name, department_id, TO_CHAR(NULL) department_name FROM employees
UNION
SELECT TO_CHAR(NULL) last_name, department_id, department_name FROM departments;












