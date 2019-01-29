-- Übungen Kapitel 2

-- Task 1
-- 1
SELECT last_name, job_id, salary AS Sal 
FROM employees;
-- true

-- 2
SELECT * FROM job_grades;
-- "table or view does not exist"

-- 3
SELECT employee_id, last_name, salary*12 "ANNUAL SALARY"
FROM employees;

-- Task 2
-- 4
DESCR departments;
SELECT * FROM departments;

-- 5a
DESCR employees;
-- 5b
SELECT employee_id, last_name, job_id, hire_date Startdate
FROM employees;

-- 6
SELECT DISTINCT job_id FROM employees;

-- Task 3
-- 7
SELECT employee_id "Emp #", last_name "Employee", job_id "Job", hire_date "Hire Date"
FROM employees;

-- 8
SELECT last_name||', '||job_id "Employee and Title"
FROM employees;

-- 9
SELECT employee_id||','||first_name||','||last_name
||','||email||','||phone_number||','||hire_date
||','||job_id||','||salary||','||commission_pct
||','||manager_id||','||department_id THE_OUTPUT
FROM employees;








