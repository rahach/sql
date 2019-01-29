-- Übungsblatt 1

-- 6)

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, l.city, c.country_name, r.region_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
JOIN locations l
ON d.location_id=l.location_id
JOIN countries c
ON l.country_id=c.country_id
JOIN regions r
ON c.region_id=r.region_id;


SELECT e.employee_id, e.first_name, e.last_name, d.department_name, l.city, c.country_name, r.region_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id=d.department_id
LEFT OUTER JOIN locations l
ON d.location_id=l.location_id
LEFT OUTER JOIN countries c
ON l.country_id=c.country_id
LEFT OUTER JOIN regions r
ON c.region_id=r.region_id;

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, l.city, c.country_name, r.region_name
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id=d.department_id
RIGHT OUTER JOIN locations l
ON d.location_id=l.location_id
RIGHT OUTER JOIN countries c
ON l.country_id=c.country_id
RIGHT OUTER JOIN regions r
ON c.region_id=r.region_id;

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, l.city, c.country_name, r.region_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id=d.department_id
FULL OUTER JOIN locations l
ON d.location_id=l.location_id
FULL OUTER JOIN countries c
ON l.country_id=c.country_id
FULL OUTER JOIN regions r
ON c.region_id=r.region_id;

-- 7) ADE 

-- 8) BD

-- 9) C
SELECT employee_id AS "Employee", '$2' AS "Late Fee" FROM employees;


-- ---------------------------------------------------------------------------------------------------------------


CREATE TABLE emp10
    AS
        SELECT * 
        FROM employees;


CREATE TABLE emp11(status NUMBER(20) CHECK(MOD(STATUS,2) = 0));

INSERT INTO emp11 (status)
    SELECT employee_id
    FROM employees
    WHERE MOD(employee_id,2) = 0
;

INSERT INTO emp11 (status)
VALUES(2);

CREATE VIEW vw_employees AS
SELECT last_name, first_name
FROM employees;

CREATE OR REPLACE VIEW vw_employees
AS
SELECT *
FROM employees;

UPDATE vw_employees 
SET first_name='Erwin'
WHERE last_name ='King';

INSERT INTO vw_employees
VALUES('erwin', 'lottermann', 168, 'ELOTT', '11.11.11', '07.02.99', 'IT_PROG',1100,NULL,NULL,NULL);

SELECT * 
FROM vw_employees;

SELECT *
FROM USER_VIEWS;


