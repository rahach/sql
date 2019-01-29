-- Übungen Kapitel 4

-- Task 1
-- 1

SELECT sysdate "Date"
FROM dual;

-- 5
-- a
SELECT INITCAP(last_name) "Name", LENGTH(last_name) "Length"
FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;


-- b
SELECT INITCAP(last_name) "Name", LENGTH(last_name) "Length"
FROM employees
WHERE last_name LIKE '&First_Letter%';

-- c
SELECT INITCAP(last_name) "Name", LENGTH(last_name) "Length"
FROM employees
WHERE last_name LIKE UPPER('&First_Letter%');

-- 6

SELECT last_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date)) months_worked
FROM employees
ORDER BY months_worked;

-- 7
SELECT last_name, LPAD(salary, 15, '$') 
FROM employees;

-- 8
SELECT last_name, ROUND(salary/1000), LPAD('*',ROUND(salary/1000),'*') EMPLOYEES_AND_THEIR_SALARIES
FROM employees
ORDER BY salary DESC;

-- 9
SELECT last_name, TRUNC((sysdate-hire_date)/7) TENURE
FROM employees
WHERE department_id = 90
ORDER BY TENURE DESC;






















