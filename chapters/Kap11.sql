-- Kapitel 11

CREATE TABLE dept
    (deptno NUMBER(2),
     dname VARCHAR2(14),
     loc VARCHAR2(13),
     create_date DATE DEFAULT SYSDATE); 


DESCR dept;

INSERT INTO dept(deptno, dname, loc) VALUES (1,'HR', 'Hamburg');

SELECT * FROM dept;

SELECT table_name FROM user_tables;

CREATE TABLE hire_dates
        (id NUMBER(8),
         hire_date DATE DEFAULT SYSDATE);

DESCR hire_dates;

INSERT INTO hire_dates values(45, NULL);

INSERT INTO hire_dates(id) values(35);

SELECT * FROM hire_dates;  

SELECT * FROM user_;


CREATE TABLE teach_emp (
    empno       NUMBER(5) PRIMARY KEY,
    ename       VARCHAR2(15) NOT NULL,
    job         VARCHAR(10),
    mgr         NUMBER(5),
    hiredate    DATE DEFAULT(sysdate),
    photo       BLOB,
    sal         NUMBER(7, 2),
    deptno      NUMBER(3) NOT NULL
                    CONSTRAINT admin_dept_fkey
                REFERENCES
                    departments(department_id)
);

DESCR teach_emp;

UPDATE employees 
SET department_id = 55
WHERE department_id = null;

ROLLBACK;

SELECT * FROM employees;

CREATE TABLE dept80
    AS
        SELECT employee_id, last_name, salary*12 ANNSAL, hire_date
        FROM employees
        WHERE department_id = 80;

DESCR dept80;

SELECT * FROM dept80;

ALTER TABLE dept80
ADD (job_id VARCHAR2(9));

ALTER TABLE dept80
MODIFY (last_name VARCHAR(30));

ALTER TABLE dept80
DROP (job_id);

ALTER TABLE dept80 SET UNUSED(hire_date) ONLINE;

ALTER TABLE dept80
DROP UNUSED COLUMNS;

DROP TABLE dept80;







