-- 7

SELECT last_name, salary 
FROM employees
WHERE salary >ALL 
                (SELECT salary 
                 FROM employees
                 WHERE department_id = 60);








