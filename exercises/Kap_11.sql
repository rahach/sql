-- KAP 11

CREATE TABLE dept3
    (deptno NUMBER(2),
     dname VARCHAR2(14),
     loc VARCHAR2(13),
     create_date DATE DEFAULT SYSDATE);






-- 1
CREATE TABLE my_employee3
    (id NUMBER(4) CONSTRAINT my_employee_id_pk PRIMARY Key,
     last_name VARCHAR2(25),
     first_name VARCHAR2(25),
     userid VARCHAR2(8),
     salary NUMBER(9, 2)
    );

INSERT INTO my_employee3 VALUES(1, 'Patel', 'Ralph', 'rpatel', 895);

INSERT INTO my_employee3(id, last_name, first_name, userid, salary) VALUES(2, 'Dancs', 'Betty', 'bdancs', 860);

COMMIT;

UPDATE my_employee3 SET last_name='Drexler' WHERE id=3;

UPDATE my_employee3 SET salary=1000 WHERE salary<900;

DELETE FROM my_employee3 WHERE last_name='Dancs';

SELECT * FROM my_employee3;

SAVEPOINT intermediate;

DELETE FROM my_employee3;

ROLLBACK to intermediate;

COMMIT;

CREATE TABLE employees4
AS SELECT employee_id, last_name, salary*12 ANNSAL, hire_date
   FROM employees
   WHERE department_id = 10;






























































