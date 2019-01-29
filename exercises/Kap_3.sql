-- Übungen Kapitel 3

-- Task 1
-- 1

SELECT last_name, salary 
FROM employees
WHERE salary > 12000;

-- 2
SELECT last_name, department_id 
FROM employees
WHERE employee_id=176;

--3
SELECT last_name, salary 
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- 4
SELECT last_name, job_id, hire_date
FROM employees
WHERE last_name IN ('Matos', 'Taylor'); 

-- 5
SELECT last_name, department_id 
FROM employees
WHERE department_id IN (20, 50)
ORDER BY last_name;

--6
SELECT last_name "Employee", salary "Monthly Salary" 
FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND department_id IN (20, 50);

--7
SELECT last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01.01.2000' AND '31.12.2006';

--8
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;

--9
SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY 2 DESC, 3 DESC;

-- 10
SELECT last_name, salary 
FROM employees
WHERE salary > '&SALARY';

-- 11
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE manager_id='&Manager'
ORDER BY '&Sorting';

-- 12
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';

-- 13
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

-- 14
SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 3500, 7000);

-- 15
SELECT last_name, salary, commission_pct 
FROM employees
WHERE commission_pct = 0.2;























