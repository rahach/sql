-- Kapitel 20

ALTER SESSION SET TIME_ZONE = '-05:00';
ALTER SESSION SET TIME_ZONE = dbtimezone;
ALTER SESSION SET TIME_ZONE = local;
ALTER SESSION SET TIME_ZONE = 'America/New_York';

ALTER SESSION
SET NLS_DATE_FORMAT = 'DD-MON-YYYY HH24:MI:SS';
ALTER SESSION SET TIME_ZONE = '-5:00';

SELECT SESSIONTIMEZONE, CURRENT_DATE FROM DUAL;

SELECT SESSIONTIMEZONE, CURRENT_TIMESTAMP FROM DUAL;

SELECT SESSIONTIMEZONE, LOCALTIMESTAMP FROM DUAL;

SELECT DBTIMEZONE FROM DUAL;

SELECT SESSIONTIMEZONE FROM DUAL;

SELECT hire_date 
FROM emp4;

ALTER TABLE emp4
MODIFY hire_date TIMESTAMP;

ALTER TABLE emp4
MODIFY hire_date TIMESTAMP(7);

CREATE TABLE web_orders
(order_date TIMESTAMP WITH TIME ZONE,
delivery_time TIMESTAMP WITH LOCAL TIME ZONE);

INSERT INTO web_orders values
(current_date, current_timestamp + 2);

SELECT * FROM web_orders;

CREATE TABLE warrenty
(prod_id number, warrenty_time INTERVAL YEAR (3) TO MONTH);
INSERT INTO warrenty VALUES (123, INTERVAL '8' MONTH);
INSERT INTO warrenty VALUES (155, INTERVAL '200' YEAR(3));
INSERT INTO warrenty VALUES (678, '200-11');
SELECT * FROM warrenty;

CREATE TABLE lab
( exp_id number, test_time INTERVAL DAY (2) TO SECOND);
INSERT INTO lab VALUES (100012, '90 00:00:00');
INSERT INTO lab VALUES (56098, INTERVAL '6 03:30:16' DAY TO SECOND);

SELECT * FROM lab;

SELECT last_name, employee_id, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM TO_DATE(hire_date, 'DD.MM.RR')) > 1990
ORDER BY hire_date;

SELECT last_name, hire_date,
EXTRACT(MONTH FROM HIRE_DATE)
FROM employees
WHERE manager_id = 100;

SELECT hire_date FROM employees;

ALTER TABLE employees 
MODIFY hire_date DATE;

SELECT TZ_OFFSET('US/Eastern'),
       TZ_OFFSET('Canada/Yukon'),
       TZ_OFFSET('Europe/London')
FROM DUAL;

SELECT * FROM V$TIMEZONE_NAMES;

SELECT  hire_date, 
        hire_date + TO_YMINTERVAL('01-02') AS
        HIRE_DATE_YMININTERVAL
FROM employees
WHERE department_id = 20;

SELECT last_name,
  TO_CHAR(hire_date, 'mm-dd-yy:hh:mi:ss') hire_date,
  TO_CHAR(hire_date + TO_DSINTERVAL('100 10:00:00'), 'mm-dd-yy:hh:mi:ss') hiredate2
FROM employees;






