-- Kapitel 14
-- 1)

CREATE OR REPLACE VIEW employees_vu
AS  SELECT employee_id, last_name "EMPLOYEE", department_id
    FROM employees;

-- 2)
SELECT * FROM employees_vu;

-- 3)
SELECT employee, department_id FROM employees_vu;

-- 4)
CREATE VIEW dept80
AS  SELECT employee_id "EMPNO", last_name "EMPLOYEE", department_id "DEPTNO"
    FROM employees
    WHERE department_id = 80
WITH CHECK OPTION CONSTRAINT emp_dept_80;

--5)
DESCRIBE dept80;

SELECT * FROM dept80;

--6)
UPDATE dept80 
SET deptno = 80
WHERE employee = 'Abel';


DROP VIEW dept80;





