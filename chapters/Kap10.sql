-- Kapitel 10


INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (380, 'Public Relations', 100, 1700);


DESCR departments;

SELECT * FROM departments;

INSERT INTO departments (department_id, department_name)
VALUES (330, 'Purchasing');

INSERT INTO departments (department_id, department_name)
VALUES ('340', 'Purchasing');


INSERT INTO departments
VALUES (350, 'Finance', NULL, NULL);

SELECT * FROM employees 
ORDER BY email DESC;

DESCR employees;

INSERT INTO employees (employee_id, first_name, 
last_name, email, phone_number, hire_date, job_id, 
salary, commission_pct, manager_id, department_id)
VALUES (213, 'Louis', 'Popp', 'LPOPP2', '515.124.4567',
SYSDATE, 'AC_ACCOUNT', 6900, NULL, 205, 110);


INSERT INTO employees
VALUES (214, 'Den', 'Raphealy', 'DRAPHEAL2', '515.127.4561',
TO_DATE('FEB 3, 2016', 'MON DD, YYYY'), 'SA_REP', 11000,
0.2, 100, 60);

SELECT * FROM employees
WHERE employee_id = 113;


INSERT INTO departments(department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);


INSERT INTO sales_reps (id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';

SELECT * FROM sales_reps;

INSERT INTO copy_emp
SELECT * FROM employees;

SELECT * FROM copy_emp;

UPDATE employees
SET department_id = 100
WHERE employee_id = 113;

UPDATE copy_emp
SET department_id = 110;

UPDATE copy_emp
SET commission_pct = 0.5
WHERE employee_id = 114;

SELECT * FROM copy_emp
WHERE employee_id = 100;

UPDATE copy_emp
SET (job_id, salary) = 
                        (SELECT job_id, salary
                         FROM employees
                         WHERE employee_id = 205)
WHERE employee_id = 103;

UPDATE copy_emp
SET department_id = (SELECT department_id
                     FROM employees
                     WHERE employee_id = 100)
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id = 200);

DELETE FROM departments 
WHERE department_id = 280;

SELECT * FROM departments;

SELECT * FROM copy_emp;

DELETE copy_emp
WHERE department_id IN
                        (SELECT department_id
                         FROM departments
                         WHERE department_name LIKE '%Public%');


TRUNCATE TABLE copy_emp;

DELETE copy_emp;

ROLLBACK;

INSERT INTO copy_emp
SELECT * FROM employees;

SELECT * FROM employees;

DELETE FROM employees
WHERE employee_id = 214;

INSERT INTO departments
VALUES (290, 'Corporate Tax', NULL, 1700);

ROLLBACK;

COMMIT;

DELETE FROM departments
WHERE department_id IN (290, 300);

























