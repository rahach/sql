-- 6
SELECT job_id, COUNT(*)
FROM employees
WHERE job_id = '&Job'
GROUP BY job_id;

-- 7
SELECT COUNT(DISTINCT manager_id) "Number of Managers" 
FROM employees;

-- 8
SELECT MAX(salary) - MIN(salary) DIFFERENCE
FROM employees;

-- 9
SELECT manager_id, MIN(salary)
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC;

-- 10
SELECT COUNT(last_name), 
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1996, 1, 0)) "1996", 
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1997, 1)) "1997", 
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1998, 1)) "1998", 
SUM(DECODE(TO_CHAR(hire_date, 'YYYY'), 1999, 1)) "1999"
FROM employees;

-- 11
SELECT job_id,
SUM(DECODE(department_id, 20, salary)) "20",
SUM(DECODE(department_id, 50, salary)) "50",
SUM(DECODE(department_id, 80, salary)) "80",
SUM(DECODE(department_id, 90, salary)) "90",
SUM(salary) total
FROM employees
GROUP BY job_id;





















