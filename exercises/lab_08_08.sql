-- 7

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE salary >ALL (SELECT salary
                   FROM employees
                   WHERE department_id IN
                                           (SELECT department_id
                                            FROM employees
                                            WHERE last_name IN 
                                                                (SELECT last_name 
                                                                 FROM employees
                                                                 WHERE last_name LIKE '%u%')));


SELECT salary
                   FROM employees
                   WHERE department_id IN
                                           (SELECT department_id
                                            FROM employees
                                            WHERE last_name IN 
                                                                (SELECT last_name 
                                                                 FROM employees
                                                                 WHERE last_name LIKE '%u%'));
                                                                 
                                                                 
SELECT department_id
                                            FROM employees
                                            WHERE last_name IN 
                                                                (SELECT last_name 
                                                                 FROM employees
                                                                 WHERE last_name LIKE '%u%');                                                                 
