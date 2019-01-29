-- Kapitel 8

SELECT last_name, hire_date
FROM employees
WHERE hire_date > (SELECT hire_date
                   FROM employees
                   WHERE last_name = 'Whalen');
                   
SELECT last_name, job_id
FROM employees
WHERE job_id =
        (SELECT job_id
         FROM employees
         WHERE employee_id = 141);
         
SELECT last_name, job_id, salary
FROM employees
WHERE job_id =
    (SELECT job_id
     FROM employees
     WHERE last_name = 'Taylor' AND first_name = 'Winston')
AND salary >
    (SELECT salary
     FROM employees
     WHERE last_name = 'Taylor' AND first_name = 'Winston');
     
SELECT last_name, job_id, salary
FROM employees
WHERE salary =
    (SELECT MIN(salary)
     FROM employees);

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 
                        (SELECT MIN(salary)
                         FROM employees
                         WHERE department_id = 50);

SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) = (SELECT MIN(AVG(salary))
                      FROM employees
                      GROUP BY job_id);

SELECT employee_id, last_name
FROM employees
WHERE salary IN 
        (SELECT MIN(salary)
         FROM employees
         GROUP BY department_id);

SELECT last_name, salary, department_id
FROM employees
WHERE salary IN (SELECT MIN(salary)
                 FROM employees
                 GROUP BY department_id);


SELECT last_name, salary, department_id
FROM employees
WHERE (salary, department_id) IN (SELECT MIN(salary), department_id
                 FROM employees
                 GROUP BY department_id);
                 
                 
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY
                    (SELECT salary
                     FROM employees
                     WHERE job_id = 'IT_PROG');

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL
                    (SELECT salary
                     FROM employees
                     WHERE job_id = 'IT_PROG')
AND job_id<> 'IT_PROG';

SELECT first_name, department_id, salary
FROM employees
WHERE (salary, department_id) IN
    (SELECT MIN(salary), department_id
     FROM employees
     GROUP BY department_id)
ORDER BY department_id;     

SELECT emp.last_name
FROM employees emp
WHERE emp.employee_id NOT IN(SELECT mgr.manager_id 
                             FROM employees mgr
                             WHERE mgr.manager_id != null);

SELECT last_name FROM employees
WHERE employee_id NOT IN
                        (SELECT manager_id
                         FROM employees
                         WHERE manager_id IS NOT NULL);























