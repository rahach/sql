-- Übungen Kapitel 7

-- 1

SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;

SELECT last_name, e.department_id, d.department_name
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id;

SELECT last_name, job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE l.city = 'Toronto';


