-- 9

SELECT e1.last_name, e1.hire_date, e2.last_name, e2.hire_date
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id
WHERE e1.hire_date < e2.hire_date;


























