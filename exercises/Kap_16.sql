-- Kapitel 16
-- 1)
SELECT last_name, department_id, salary
FROM employees
WHERE (department_id, salary) IN (SELECT department_id, salary
                                  FROM employees
                                  WHERE commission_pct IS NOT NULL);
                     
-- 2)
SELECT emp.last_name, de.department_name, emp.salary
FROM employees emp
JOIN departments de                           
ON emp.department_id=de.department_id
WHERE de.location_id=1700 AND (salary, job_id) IN (SELECT e.salary, e.job_id                           
                                                    FROM employees e
                                                    JOIN departments d                           
                                                    ON e.department_id=d.department_id
                                                    WHERE d.location_id=1700);

-- 3)
SELECT last_name, hire_date, salary 
FROM employees
WHERE manager_id=(SELECT manager_id
                  FROM employees
                  WHERE last_name='Kochhar'
                 )
AND last_name NOT IN ('Kochhar');

-- 4)
SELECT last_name, job_id, salary 
FROM employees
WHERE salary>(SELECT MAX(salary)
              FROM employees
              WHERE job_id='SA_MAN');

SELECT salary FROM employees;

-- 5)
SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id IN(SELECT department_id
                        FROM departments 
                        WHERE location_id IN(
                            SELECT location_id
                            FROM locations
                            WHERE city LIKE 'T%'));

-- 6)
SELECT e.last_name ENAME, e.salary SALARY, e.department_id DEPTNO, 
                        (SELECT ROUND(AVG(salary), 2)
                         FROM employees
                         WHERE department_id=e.department_id
                        ) DEPT_AVG 
FROM employees e
WHERE e.salary>(SELECT AVG(salary)
                FROM employees
                WHERE department_id=e.department_id
               )
ORDER BY DEPT_AVG;































