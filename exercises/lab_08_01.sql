-- 1

SELECT last_name, hire_date 
FROM employees
WHERE (last_name, hire_date) IN 
                (SELECT e1.last_name, e1.hire_date 
                FROM employees e1
                JOIN employees e2
                USING (department_id)
                WHERE e2.last_name = '&Name');

















