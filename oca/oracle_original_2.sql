-- Übungsblatt 2
-- 1)  ABD

-- 2) D

DEFINE xYZ ='xyz'
SELECT USER FROM dual;

DEFINE
SELECT  FROM dual;

INSERT INTO test1(test) VALUES('&xYZ');

UNDEFINE xYZ

-- 3) D

DELETE emp4
WHERE salary < 5000;

-- 4) A

-- 5) D


UPDATE employees
SET department_id =
(SELECT department_id
FROM departments
WHERE location_id = 2100),
(salary, commission_pct) =
(SELECT 1.1*AVG(salary), 1.5*AVG(commission_pct)
FROM employees, departments
WHERE departments.location_id IN(2900, 2700, 2100))
WHERE department_id IN
(SELECT department_id FROM departments
WHERE location_id = 2900 OR location_id = 2700);




-- 6) B

-- 7) BE

-- 8) D

SELECT * FROM employees3
WHERE employee_id=100 AND first_name='Steven';

-- 9) AC

-- 10) D

SELECT (first_name || ' ' || last_name) AS full_name, hire_date, salary * 115/100
FROM employees
WHERE MONTHS_BETWEEN (hire_date, TO_DATE('01-JAN-1995', 'DD-MON-RRRR')) <=36;

-- 11) D

-- 12) C

-- 13) B

SELECT m.last_name "Manager", e.last_name "Employee"
FROM employees m JOIN employees e
ON m.employee_id=e.employee_id
WHERE e.manager_id = 100;

-- 14) ABE

SELECT *
FROM employees
WHERE department_id IN(
                    SELECT department_id FROM departments
                    WHERE location_id NOT IN (1500, 1700, 2500)
                    );

SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) = (SELECT MIN(AVG(salary))
                      FROM employees
                      GROUP BY job_id);

SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 
                    (SELECT MIN(salary)
                     FROM employees
                     WHERE department_id = 50);

-- 15) D

SELECT m.last_name, e.manager_id
FROM employees e LEFT OUTER JOIN employees m
ON (e.manager_id = m.manager_id)
WHERE e.employee_id = 123;

SELECT m.last_name, m.manager_id
FROM employees e JOIN employees m
ON (e.manager_id = m.manager_id)
WHERE e.employee_id = 123;


-- 16) A

-- 17) D

-- 18) A

-- 19) B

CREATE TABLE emp6
(emp_no NUMBER(2) CONSTRAINT emp_emp_no_pk PRIMARY KEY,
 ename VARCHAR2(15), 
 salary NUMBER(8,2), 
 mgr_no NUMBER(2) CONSTRAINT emp_mgr_fk REFERENCES emp6(emp_no));

ALTER TABLE emp6
DISABLE CONSTRAINT emp_emp_no_pk CASCADE;

ALTER TABLE emp6
ENABLE CONSTRAINT emp_emp_no_pk;

ALTER TABLE emp6
ENABLE CONSTRAINT emp_mgr_fk;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'EMP6';

-- 20) ABE

SELECT CURRENT_TIMESTAMP(9) FROM dual;

-- 21) ACD

SELECT e.last_name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (SELECT AVG(salary)
                  FROM employees
                  WHERE department_id = e.department_id);

SELECT AVG(salary)
FROM employees
WHERE department_id =80;

-- 22) A

SELECT ename FROM emp6
ORDER BY ename;

-- 23) C

SELECT last_name, JOB_ID FROM employees
WHERE JOB_ID IN ('ST_CLERK', 'ST_MAN');

-- 24) C

-- 25) C

-- 26) C

-- 27) AC

-- 28) BDE

-- 29) B

SELECT COUNT(NVL(commission_pct,0))
FROM employees
WHERE commission_pct IS NULL;

-- 30) ABC

-- 31) D

-- 32) CE

-- 33) C

SELECT TO_CHAR(NEXT_DAY(LAST_DAY(SYSDATE), 'MON'), 'dd "is the first Monday for" fmmonth rrrr')
FROM dual;

-- 34) DE

SELECT JOB_ID JOBS, DEPARTMENT_ID, AVG(salary) FROM employees
WHERE JOB_ID LIKE 'A%'
GROUP BY JOB_ID, DEPARTMENT_ID;

-- 35) B

-- 36) AC

-- 37) D
SELECT department_id, department_name, location_id, city 
FROM departments 
NATURAL JOIN locations
WHERE department_id IN (20,50);

SELECT * FROM locations;
SELECT * FROM departments;

SELECT last_name, count(department_id) 
FROM  employees NATURAL JOIN departments
GROUP BY last_name;

SELECT last_name, count(department_id) 
FROM employees JOIN departments
USING (department_id)
GROUP BY last_name;

-- 38) A

-- 39) C
SELECT d.department_id, e.last_name, d.department_name
FROM employees e, departments d
WHERE d.department_id=e.department_id;

-- 40) (A)CD

CREATE TABLE emp9
(id number(5),
CONSTRAINT emp8_un_id UNIQUE(id));

SELECT * FROM USER_CONSTRAINTS;

DROP TABLE emp9;

-- 41) D

SELECT *
FROM employees
NATURAL JOIN departments;

-- 42) ABE

-- 43) AE 

SELECT * 
FROM employees
NATURAL JOIN regions;

SELECT COUNT(last_name), job_id
FROM employees
GROUP BY job_id;

-- 44) B

-- 45) D

-- 46) AB

-- 47) D

-- 48) C

