-- Kapitel 18

SELECT * FROM system_privilege_map;

CREATE user demo
IDENTIFIED BY demo;

GRANT create session, create table, create sequence, create view
TO demo;

SELECT * FROM users;

CREATE ROLE manager;

GRANT create table, create View
TO manager;

GRANT manager TO demo;

ALTER USER user IDENTIFIED BY demo;

GRANT select 
ON hr.employees
TO demo;

GRANT update (department_name, location_id)
ON hr.departments
TO demo, manager;

SELECT * FROM ROLE_SYS_PRIVS;

REVOKE update
ON hr.departments
FROM demo;




