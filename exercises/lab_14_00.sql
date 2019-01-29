-- 
SELECT hire_date
FROM employees
WHERE hire_date < '01-FEB-2000';

SELECT TO_NUMBER('$254,367', '$999,999.99') 
FROM dual;

SELECT TO_NUMBER('$5,367.77', '$9,999.99') 
FROM dual;

SELECT TO_CHAR(888, 'C999D99') 
FROM dual;

SELECT TO_CHAR(SYSDATE+11/24, 'DAY, DD, MONTH, RRRR, HH, MI, SS')
FROM dual;

SELECT NEXT_DAY(SYSDATE, 'MONDAY')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'DD/MM/YY HH:MI:SS')
FROM dual;

SELECT TO_CHAR(SYSDATE+12/24, 'DAY, DD. MONTH YYYY HH24:MI:SS')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'DY MON YYYY')
FROM dual;

SELECT TO_CHAR(SYSDATE, 'dd MON YYYY')
FROM dual;

DEFINE test = 50;

SET VERIFY ON;

SELECT *
FROM employees
WHERE department_id = &test;

UNDEFINE test;

SELECT NVL2(commission_pct, 'Yes', 'No')
FROM employees;

SELECT NVL(commission_pct, 0)
FROM employees;

SELECT last_name, salary, commission_pct,
COALESCE((salary+(commission_pct*salary)), salary+2000) "New Salary"
FROM employees;




