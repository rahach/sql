-- Kapitel 9

SELECT job_id
FROM employees
UNION
SELECT job_id
FROM retired_employees;

SELECT job_id, department_id
FROM employees
UNION ALL
SELECT job_id, department_id
FROM retired_employees
ORDER BY job_id;

SELECT job_id, department_id
FROM employees
UNION
SELECT job_id, department_id
FROM retired_employees
ORDER BY job_id;

SELECT manager_id, department_id
FROM employees
INTERSECT
SELECT manager_id, department_id
FROM retired_employees;

SELECT manager_id, job_id
FROM employees
WHERE department_id = 80
MINUS
SELECT manager_id, job_id
FROM retired_employees
WHERE department_id = 80;

SELECT location_id, department_name "Department", TO_CHAR(NULL) "Warehouse Location"
FROM departments
UNION
SELECT location_id, TO_CHAR(NULL), state_province
FROM locations;

SELECT FIRST_NAME, JOB_ID, hire_date "HIRE_DATE"
FROM employees
UNION
SELECT FIRST_NAME, JOB_ID, TO_DATE(NULL)
FROM retired_employees;

SELECT employee_id, job_id, salary
FROM employees
UNION
SELECT employee_id, job_id, 0
FROM retired_employees
ORDER BY 2;



































