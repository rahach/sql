-- Kapitel 4

SELECT 'The job id for'||UPPER(last_name)||' is '||LOWER(job_id) AS "EMPLOYEE DETAILS"
FROM employees;

SELECT employee_id, last_name, department_id 
FROM employees
WHERE LOWER(last_name) = 'whalen';

SELECT employee_id, UPPER(last_name), department_id
FROM employees
WHERE INITCAP(Last_name) = 'Higgins';

SELECT last_name, CONCAT('Job category is ', job_id) "Job" 
FROM employees
WHERE SUBSTR(job_id, 4) = 'REP';

SELECT employee_id, 
CONCAT(first_name, last_name) NAME, 
LENGTH (last_name),
INSTR(last_name, 'a') "Contains 'a'?"
FROM employees
WHERE SUBSTR(last_name, -1, 1) = 'n';

SELECT last_name,
    UPPER(CONCAT(SUBSTR(LAST_NAME, 1, 8), '_US'))
FROM employees
WHERE department_id = 60;

SELECT ROUND(45.923, 2), ROUND(45.923, 0), ROUND(45.923, -1), ROUND(545.923, -2)
FROM dual;

SELECT TRUNC(45.923, 2), TRUNC(45.923), TRUNC(45.923, -1), TRUNC(450.923, -2)
FROM dual;

SELECT employee_id AS "Even Numbers", last_name
FROM employees
WHERE MOD(employee_id, 2) = 0;

SELECT last_name, hire_date
FROM employees
WHERE hire_date < '01.02.1993';

SELECT sysdate
FROM dual;

SELECT SESSIONTIMEZONE, CURRENT_DATE FROM dual;

SELECT SESSIONTIMEZONE, CURRENT_TIMESTAMP FROM dual;

SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS, sysdate
FROM employees
WHERE department_id = 90;

SELECT employee_id, hire_date, MONTHS_BETWEEN (SYSDATE, hire_date) TENURE,
ADD_MONTHS (hire_date, 6), NEXT_DAY(hire_date, 'FRIDAY'), LAST_DAY(hire_date)
FROM employees 
WHERE MONTHS_BETWEEN (SYSDATE, hire_date) < 222;

SELECT employee_id, hire_date,
ROUND(hire_date, 'MONTH'), TRUNC(hire_date, 'MONTH')
FROM employees
WHERE hire_date LIKE '%0'; 

-- ----------------------------------------------------------------------------------
SELECT salary 
FROM employees
WHERE department_id=100;

SELECT last_name, salary 
FROM employees
WHERE department_id=100;

SELECT *
FROM employees;

SELECT concat(last_name || ' ' || first_name || ' - ', employee_id)
FROM employees;

SELECT TO_NUMBER(TO_DATE('01-JAN-2018', 'DD-MON-RRRR')-SYSDATE)
FROM dual;

ALTER TABLE emp3
MODIFY first_name NULL;

ALTER TABLE emp3
MODIFY first_name NOT NULL;

DROP TABLE emp3;

CREATE OR REPLACE VIEW employees_vu
AS  SELECT employee_id, last_name "EMPLOYEE", department_id
    FROM emp2;

DROP TABLE emp2;

SELECT ROUND(494.4955,-1)
FROM dual;

SELECT ROUND(494.4455,1)
FROM dual;

SELECT ROUND(494.6455,0)
FROM dual;

SELECT TRUNC(497.4955,-1)
FROM dual;

SELECT TRUNC(497.4955,1)
FROM dual;

SELECT TRUNC(497.4955,0)
FROM dual;

SELECT TRUNC(ROUND(496.4955,-1),-1)
FROM dual;





















































