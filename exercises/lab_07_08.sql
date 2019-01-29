-- 7

SELECT e1.last_name, e1.hire_date
FROM employees e1 JOIN employees e2
ON (e2.last_name = 'Davies')
WHERE e2.hire_date < e1.hire_date;























