-- Kapitel 6

SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(last_name), MAX(last_name)
FROM employees;

SELECT MIN(salary), MAX(salary)
FROM employees;

SELECT COUNT(*)
FROM employees
WHERE department_id = 50;

SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 50;

SELECT AVG(commission_pct)
FROM employees;

SELECT AVG(NVL(commission_pct, 0))
FROM employees;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT AVG(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY AVG(salary);

SELECT department_id, COUNT(department_id), AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY AVG(salary);

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY job_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;

-- error
SELECT department_id, COUNT(last_name)
FROM employees;

-- error
SELECT department_id, job_id, COUNT(last_name)
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(last_name)
FROM employees
GROUP BY department_id;

SELECT department_id, job_id, COUNT(last_name)
FROM employees
GROUP BY department_id, job_id;

-- error
SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary) > 8000
GROUP BY department_id;

SELECT department_id, AVG(salary)
FROM employees
HAVING AVG(salary) > 8000
GROUP BY department_id;

-- WHERE als Vorfilter 
SELECT department_id, AVG(salary)
FROM employees
WHERE department_id > 50
HAVING AVG(salary) > 8000
GROUP BY department_id;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

SELECT job_id, SUM(salary) PAYROLL
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY SUM(salary);

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT SQRT(SUM((salary - (SELECT AVG(salary) FROM employees)) * (salary - (SELECT AVG(salary) FROM employees))) / (COUNT(salary)-1))
FROM employees;

SELECT STDDEV(salary)
FROM employees;

















