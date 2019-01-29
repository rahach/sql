-- 6

SELECT e1.department_id department, e2.last_name employee, e1.last_name colleague
FROM employees e1
LEFT OUTER JOIN employees e2
ON e1.department_id = e2.department_id
WHERE e1.department_id = 30;































