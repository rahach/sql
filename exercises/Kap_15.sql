-- Kapitel 15
-- 1)
CREATE TABLE dept5 (id NUMBER(7), name varchar2(25));

DESCR dept5;

-- 2)
INSERT INTO dept5
SELECT department_id, department_name
FROM departments;

SELECT * 
FROM dept5;

-- 3)
CREATE TABLE emp12 (id NUMBER(7), last_name VARCHAR2(25), first_name VARCHAR2(25), dept_id NUMBER(7));

DESCR emp12;

-- 4)
ALTER TABLE emp12
ADD CONSTRAINT my_emp_id_pk PRIMARY KEY(id);

-- 5)
ALTER TABLE dept5
ADD CONSTRAINT my_dept5_id_pk PRIMARY KEY(id);

-- 6)
ALTER TABLE emp12
ADD CONSTRAINT my_emp_dept5_fk_id FOREIGN KEY (dept_id) REFERENCES dept5 (id);

-- 7)
ALTER TABLE emp12
ADD (commission NUMBER(2,2) CHECK(commission > 0));


-- 8)
DROP TABLE emp12;

PURGE TABLE emp12;

DROP TABLE dept5 PURGE;















