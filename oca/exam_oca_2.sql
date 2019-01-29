-- Exam OCA 2


-- 1. B

-- 2. A

DESCR employees;

SELECT commission_pct FROM employees;

UPDATE employees SET salary=123456.78
WHERE employee_id=101;


-- 3. B, E

DESCR job_history;

SELECT END_DATE-START_DATE FROM job_history;


-- 4. A, D

UPDATE departments SET department_name='Administration'
WHERE department_id=10;

-- 5. D

SELECT * FROM employees;

SELECT DISTINCT job_id FROM employees;

-- 6. B, D

-- 7. B, D

SELECT ((10+20)*50) + null from dual;

SELECT 'this is a '|| null || 'test with nulls' from dual;

SELECT null/0 from dual;

SELECT null||'test'||null as "Test" from dual;


-- 8. D

SELECT * from employees;

-- 9. B

SELECT 'Coda''s favorite fetch toy is his orange ring' FROM DUAL;

-- 10. D

SELECT '6 * 6' "Area" FROM REGIONS;





