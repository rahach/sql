-- Übungsblatt 3

-- 1) BCF

SAVEPOINT save_point_1;
DELETE FROM emp3;
ROLLBACK TO save_point_1;

COMMIT;

SELECT * FROM emp3;

DROP TABLE emp3;

ROLLBACK;

-- 2) BCD

SELECT * 
FROM employees
WHERE salary < 
(SELECT MAX(salary)
FROM emp2
);

SELECT * 
FROM employees
WHERE job_id IN 
(SELECT job_id
FROM emp2
) 
ORDER BY salary;

-- 3) A

-- 4) B

SELECT AVG(
CASE
WHEN salary > 5000 AND job_id = 'AD_VP'
THEN 5
ELSE
NULL
END
) RESULT, COUNT(
CASE
WHEN salary > 5000 AND job_id = 'AD_VP'
THEN 1
ELSE
NULL
END
) NUMBER_OF
FROM employees;

-- 5) A
CREATE TABLE new_emp3 (employee_id, last_name, hire_date DEFAULT SYSDATE)
AS
SELECT employee_id, last_name, hire_date
FROM employees3;

-- 6) B

SELECT COUNT(NVL(commission_pct, 0))
FROM employees
WHERE commission_pct IS NULL;

-- 7) A(CD) ?

SELECT first_name || ', ' || last_name "Name"
FROM employees
WHERE MONTHS_BETWEEN (hire_date, '01-JAN-1999') > 0;

-- 8) ABE

SELECT STDDEV(employee_id), AVG(salary)
FROM employees;

-- 9) B

-- 10) AD

SELECT ROUND(SYSDATE), ROUND(SYSDATE, 'MM'), ROUND(SYSDATE, 'RR')
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'RR')
FROM DUAL;

-- 11) D

-- 12) D

SELECT job_id, salary SALARY
FROM employees
ORDER BY 1, SALARY DESC;

-- 13) C

-- 14) B

-- 15) B

ALTER TABLE employees3
MODIFY employee_id CONSTRAINT employee_id_nn NOT NULL;

ALTER TABLE employees3
DROP CONSTRAINT order_cust_id_nn;

-- 16) D

SELECT * FROM employees3
WHERE last_name LIKE '%ch\_%' ESCAPE'\';

-- 17) ABC

-- 19) ADF

-- 20) C

-- 21) B

SELECT * FROM employees 
ORDER BY 3;

-- 22) A

-- 23) B

UPDATE employees3
SET employee_id = NULL;

-- 24) AB

-- 25) C

-- 26) C

-- 28) AC

-- 29) C

CREATE OR REPLACE VIEW ord_vu AS
SELECT o.order_id, o.order_date, SUM(oi.quantity)
FROM employees e JOIN order_items oi
ON o.order_id = oi.order_id;

CREATE OR REPLACE VIEW ord_vu AS
SELECT SUM(e.employee_id) SUM1, SUM(d.department_id) SUM2
FROM employees e JOIN departments d
ON e.employee_id = d.department_id;

SELECT * FROM ord_vu;

-- 34) B(C?

-- 38) AEF

-- 43) D

-- 44) BDE

-- 45) BD

-- 48) B

-- 49) 

-- 53) AE

-- 54) D

-- 57) B

