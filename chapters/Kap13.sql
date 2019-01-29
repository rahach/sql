-- Kapitel 13

CREATE SEQUENCE dept_deptid_seq
        START WITH 280
        INCREMENT BY 10
        MAXVALUE 9999
        NOCACHE
        NOCYCLE;

INSERT INTO departments(department_id, department_name, location_id)
VALUES (dept_deptid_seq.NEXTVAL, 'Support', 2500);

SELECT dept_deptid_seq.CURRVAL
FROM dual;

SELECT * FROM departments;

-- -->

CREATE SEQUENCE ID_SEQ START WITH 1;

CREATE TABLE emp (ID NUMBER DEFAULT ID_SEQ.NEXTVAL NOT NULL, name VARCHAR(10));

INSERT INTO emp (name) VALUES ('john');

INSERT INTO emp (name) VALUES ('mark');

INSERT INTO emp (name) VALUES ('erwin');

INSERT INTO emp (name) VALUES ('erna');

SELECT * FROM emp;

-- <--

ALTER SEQUENCE dept_deptid_seq
                INCREMENT BY 20
                MAXVALUE 999999
                NOCACHE
                NOCYCLE;

DROP SEQUENCE dept_deptid_seq;

CREATE SYNONYM dept01
FOR departments;

SELECT * FROM dept01;

SELECT * FROM departments;

DROP SYNONYM dept01;

SELECT * FROM user_synonyms;

CREATE INDEX emp_last_name_idx
ON employees(last_name);

SELECT last_name FROM employees;

CREATE TABLE NEW_EMP
(employee_id NUMBER(6)
            PRIMARY KEY USING INDEX
            (CREATE INDEX emp_id_idx ON
            NEW_EMP(employee_id)),
first_name VARCHAR2(20),
last_name VARCHAR2(25));

SELECT INDEX_NAME, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'NEW_EMP';

DESCR new_emp;

SELECT * FROM new_emp;

CREATE TABLE EMP_UNNAMED_INDEX
(employee_id NUMBER(6) PRIMARY KEY,
first_name VARCHAR2(20),
last_name VARCHAR2(25));

SELECT INDEX_NAME, TABLE_NAME
FROM USER_INDEXES
WHERE TABLE_NAME = 'EMP_UNNAMED_INDEX';

CREATE TABLE NEW_EMP2
(employee_id NUMBER(6),
first_name VARCHAR2(20),
last_name VARCHAR2(25)
);

CREATE INDEX emp_id_idx2 ON
new_emp2(employee_id);

ALTER TABLE new_emp2 ADD PRIMARY KEY (employee_id) USING
INDEX emp_id_idx2;

CREATE INDEX upper_dept_name_idx
ON departments (UPPER(department_name));

CREATE INDEX emp_id_name_ix1
ON employees (employee_id, first_name);

ALTER INDEX emp_id_name_ix1 INVISIBLE;

CREATE BITMAP INDEX emp_id_name_ix2
ON employees(employee_id, first_name);

DESCRIBE user_indexes;

SELECT index_name, table_name, uniqueness
FROM user_indexes
WHERE table_name = 'EMPLOYEES';

SELECT index_name, table_name
FROM user_indexes
WHERE table_name = 'EMP_LIB';

DESCRIBE user_ind_columns;

SELECT index_name, column_name, table_name
FROM user_ind_columns
WHERE index_name = 'LNAME_IDX';

CREATE VIEW empvu80
AS SELECT employee_id, last_name, salary
FROM employees
WHERE department_id = 80; 

DESCRIBE empvu80;

SELECT * FROM empvu80;

CREATE VIEW salvu50
AS SELECT employee_id ID_NUMBER, last_name NAME, salary*12 ANN_SALARY
FROM employees
WHERE department_id = 50;

SELECT ID_NUMBER, NAME, ANN_SALARY
FROM salvu50;

CREATE OR REPLACE VIEW empvu80
(id_number, name, sal, department_id)
AS SELECT employee_id, first_name || ' ' || last_name, salary, department_id
FROM employees
WHERE department_id = 80;

SELECT * FROM empvu80;

CREATE OR REPLACE VIEW dept_sum_vu
(name, minsal, maxsal, avgsal)
AS SELECT d.department_name, MIN(e.salary), MAX(e.salary), AVG(e.salary)
FROM employees e JOIN departments d
USING (department_id)
GROUP BY d.department_name;

SELECT * FROM dept_sum_vu;

DESCRIBE user_views;

SELECT view_name FROM user_views;

SELECT text FROM user_views
WHERE view_name = 'EMP_DETAILS_VIEW';

CREATE OR REPLACE VIEW empvu20
AS SELECT *
FROM employees
WHERE department_id = 20
WITH CHECK OPTION CONSTRAINT empvu20_ck;

SELECT * FROM empvu20;

UPDATE empvu20
SET department_id = 10
WHERE employee_id = 201;

CREATE OR REPLACE VIEW empvu10
(employee_number, employee_name, job_title)
AS SELECT employee_id, last_name, job_id
FROM employees
WHERE department_id = 10
WITH READ ONLY;

UPDATE empvu10
SET department_id = 10
WHERE employee_id = 200;

SELECT * FROM empvu10;

























