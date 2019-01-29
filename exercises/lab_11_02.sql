

CREATE TABLE emp5(
    id NUMBER(7),
    last_name VARCHAR2(25),
    first_name VARCHAR2(25),
    dept_id NUMBER(7),
    CONSTRAINT emp5_dept_id_fk FOREIGN KEY(dept_id) REFERENCES dept4(id)
);

DESCR emp5;

ALTER TABLE emp5
ADD (commission NUMBER(2,2));

ALTER TABLE emp5
MODIFY (last_name VARCHAR2(50));

ALTER TABLE emp5
DROP (first_name);

ALTER TABLE emp5
SET UNUSED(dept_id);

ALTER TABLE emp5
DROP UNUSED COLUMNS;

CREATE TABLE employees2
AS SELECT employee_id ID, first_name FIRST_NAME, last_name LAST_NAME, salary SALARY, department_id DEPT_ID
   FROM employees;

DESCR employees2;

ALTER TABLE employees2
READ ONLY;

ALTER TABLE employees2
ADD job_id2 VARCHAR2(5);




















