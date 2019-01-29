-- Kapitel 19

INSERT INTO deptm3
(department_id, department_name, manager_id)
VALUES (300, 'Engineering', DEFAULT);

UPDATE deptm3
SET manager_id = DEFAULT
WHERE department_id = 200;


INSERT ALL
INTO sal_history VALUES(EMPID, HIREDATE, SAL)
INTO mgr_history VALUES(EMPID, MGR, SAL)
SELECT employee_id EMPID, hire_date HIREDATE, salary SAL, manager_id MGR
FROM employees
WHERE employee_id > 200;

INSERT ALL
WHEN HIREDATE < '01-JAN-15' THEN
INTO emp_history VALUES(EMPID, HIREDATE, SAL)
WHEN COMM IS NOT NULL THEN
INTO emp_sales VALUES(EMPID, COMM, SAL)
SELECT employee_id EMPID, hire_date HIREDATE, salary SAL, commission_pct COMM
FROM employees;

SELECT count(*) FROM emp_history;

SELECT count(*) FROM emp_sales;

INSERT ALL 
WHEN job_id IN
(SELECT job_id FROM jobs WHERE job_title LIKE '%Manager%' ) THEN
INTO managers(last_name, job_id, SALARY)
VALUES(last_name, job_id, SALARY)
WHEN SALARY > 10000 THEN
INTO richpeople(last_name, job_id, SALARY)
VALUES (last_name, job_id, SALARY)
ELSE
INTO poorpeople VALUES(last_name, job_id, SALARY)
SELECT * FROM employees;

INSERT FIRST 
WHEN salary < 5000 THEN
INTO sal_low VALUES (employee_id, last_name, salary)
WHEN salary between 5000 and 10000 THEN
INTO sal_mid VALUES (employee_id, last_name, salary)
ELSE
INTO sal_high VALUES (employee_id, last_name, salary)
SELECT employee_id, last_name, salary
FROM employees;

INSERT ALL
INTO sales_info VALUES (employee_id, week_id, sales_MON)
INTO sales_info VALUES (employee_id, week_id, sales_TUE)
INTO sales_info VALUES (employee_id, week_id, sales_WED)
INTO sales_info VALUES (employee_id, week_id, sales_THUR)
INTO sales_info VALUES (employee_id, week_id, sales_FRI)
SELECT EMPLOYEE_ID, week_id, sales_MON, sales_TUE, sales_WED, sales_THUR, sales_FRI 
FROM sales_source_data;

INSERT INTO sales_source_data VALUES(176,6,2000,3000,4000,5000,6000);

CREATE TABLE COPY_EMP3 AS SELECT * FROM EMPLOYEES
WHERE SALARY <10000;

MERGE INTO copy_emp3 c
USING(SELECT * FROM employees) e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
UPDATE SET
c.first_name = e.first_name,
c.last_name = e.last_name,
c.email = e.email,
c.phone_number = e.phone_number,
c.hire_date = e.hire_date,
c.job_id = e.job_id,
c.salary = e.salary,
c.commission_pct = e.commission_pct,
c.manager_id = e.manager_id,
c.department_id = e.department_id
DELETE WHERE (E.COMMISSION_PCT IS NOT NULL)
WHEN NOT MATCHED THEN
INSERT VALUES(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);

SELECT employee_id, salary, commission_pct FROM COPY_EMP3;

TRUNCATE TABLE copy_emp3;
SELECT * FROM copy_emp3;


MERGE INTO copy_emp3 c
USING (SELECT * FROM EMPLOYEES) e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
UPDATE SET
c.first_name = e.first_name,
c.last_name = e.last_name,
c.email = e.email,
c.phone_number = e.phone_number,
c.hire_date = e.hire_date,
c.job_id = e.job_id,
c.salary = e.salary,
c.commission_pct = e.commission_pct,
c.manager_id = e.manager_id,
c.department_id = e.department_id
DELETE WHERE (e.COMMISSION_PCT IS NOT NULL)
WHEN NOT MATCHED THEN
INSERT VALUES(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);

DROP TABLE emp3;

SELECT original_name, operation, droptime FROM recyclebin;

FLASHBACK TABLE emp3 TO BEFORE DROP;

SELECT * FROM recyclebin;

PURGE recyclebin;

SELECT salary FROM employees3
WHERE last_name = 'Chung';

UPDATE employees3 SET salary = 4000
WHERE last_name = 'Chung';

SELECT salary FROM employees3
AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '1' MINUTE)
WHERE last_name = 'Chung';

SELECT salary FROM employees3
WHERE employee_id = 107;

UPDATE employees3 SET salary = salary * 1.30
WHERE employee_id = 107;
COMMIT;

SELECT salary FROM employees3
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE employee_id = 107;

SELECT versions_starttime "START_DATE",
        versions_endtime  "END_DATE",
        salary
FROM employees3
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE last_name = 'Lorentz';

SELECT salary FROM employees3
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE employee_id = 107;



