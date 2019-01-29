-- Kapitel 15

CREATE TABLE emp2
AS SELECT * FROM employees;

DESCRIBE emp2;

ALTER TABLE emp2
MODIFY employee_id PRIMARY KEY;

ALTER TABLE emp2
ADD CONSTRAINT emp_mgr_fk
FOREIGN KEY(manager_id)
REFERENCES emp2(employee_id);

SELECT * FROM emp2;

ALTER TABLE emp2
DROP PRIMARY KEY CASCADE;

SELECT * FROM USER_CONSTRAINTS
WHERE table_name = 'emp2';

CREATE TABLE myemp2
(emp_id NUMBER(6) CONSTRAINT emp_name_pk PRIMARY KEY, 
emp_name VARCHAR2(20));

ALTER TABLE myemp2
DROP CONSTRAINT emp_name_pk ONLINE;

CREATE TABLE dept2
AS SELECT * FROM departments;

CREATE TABLE loc2
AS SELECT * FROM locations;

SELECT * FROM dept2;

ALTER TABLE dept2
MODIFY department_id PRIMARY KEY;

ALTER TABLE loc2
MODIFY location_id PRIMARY KEY;

ALTER TABLE dept2 ADD CONSTRAINT dept_lc_fk_1
FOREIGN KEY (location_id)
REFERENCES loc2(location_id) ON DELETE CASCADE;

ROLLBACK;

ALTER TABLE emp2 ADD CONSTRAINT emp_dt_fk_1
FOREIGN KEY (department_id)
REFERENCES dept2(department_id) ON DELETE SET NULL;

DELETE FROM dept2 WHERE department_id=10;

CREATE TABLE test1(
col1_pk NUMBER PRIMARY KEY,
col2_fk NUMBER,
col1 NUMBER,
col2 NUMBER,
CONSTRAINT fk_constraint FOREIGN KEY (col2_fk) REFERENCES test1,
CONSTRAINT ck1 CHECK (col1_pk > 0 and col1 > 0),
CONSTRAINT ck2 CHECK (col2_fk > 0));

ALTER TABLE emp2
DROP COLUMN employee_id CASCADE CONSTRAINTS;

ALTER TABLE test1
DROP (col1_pk, col2_fk, col1) CASCADE CONSTRAINTS;

CREATE TABLE marketing (team_id NUMBER(10),
                        target VARCHAR2(50),
                        CONSTRAINT mktg_pk PRIMARY KEY(team_id));

ALTER TABLE marketing RENAME COLUMN team_id TO id;

ALTER TABLE test1 DROP (col1_pk, col2_fk, col2) CASCADE CONSTRAINTS;

ALTER TABLE emp2
DISABLE CONSTRAINT emp_dt_fk;

ALTER TABLE dept2
DISABLE PRIMARY KEY CASCADE;

ALTER TABLE dept2
ENABLE NOVALIDATE PRIMARY KEY;

CREATE TABLE emp_new_sal (salary NUMBER
    CONSTRAINT sal_ck CHECK (salary > 100)
    DEFERRABLE INITIALLY IMMEDIATE,
    bonus NUMBER
    CONSTRAINT bonus_ck CHECK(bonus > 0)
    DEFERRABLE INITIALLY DEFERRED);

INSERT INTO emp_new_sal VALUES(90,5);

INSERT INTO emp_new_sal VALUES(110,-1);

COMMIT;

ALTER SESSION SET CONSTRAINTS = DEFERRED;

INSERT INTO emp_new_sal VALUES(90,5);

ALTER SESSION SET CONSTRAINTS = IMMEDIATE;

INSERT INTO emp_new_sal VALUES(110,-1);

CREATE GLOBAL TEMPORARY TABLE cart(n NUMBER, d DATE)
ON COMMIT DELETE ROWS;

CREATE GLOBAL TEMPORARY TABLE emp_details_1
ON COMMIT PRESERVE ROWS AS
    SELECT * FROM employees;

SELECT * FROM emp_details_1;

CREATE OR REPLACE DIRECTORY emp_dir
AS '/home/oracle/share/ORACLE';

CREATE TABLE oldemp (fname CHAR(25), lname CHAR(25), email CHAR(50))
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY emp_dir
ACCESS PARAMETERS
(RECORDS DELIMITED BY NEWLINE
FIELDS(fname POSITION (1:25) CHAR,
lname POSITION (26:41) CHAR,
email POSITION (42:92) CHAR))
LOCATION ('emp.dat'));

SELECT * FROM oldemp;





