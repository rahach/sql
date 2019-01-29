-- 5
SELECT e1.employee_id, e1.last_name "Employee", e1.employee_id "EMP#", e2.last_name "Manager", e2.employee_id "MGR#"
FROM employees e1
LEFT OUTER JOIN employees e2
ON e1.manager_id = e2.employee_id
ORDER BY e1.employee_id;


































