-- Kapitel 12

DESCRIBE DICTIONARY;

SELECT * FROM dictionary
WHERE table_name = 'USER_OBJECTS';

SELECT * FROM dictionary
WHERE table_name = 'DBA_OBJECTS';

SELECT table_name
FROM dictionary
WHERE LOWER(comments) LIKE '%columns%';

SELECT object_name, object_type, created, status
FROM user_objects
ORDER BY object_type;

DESCRIBE user_tables;

SELECT table_name
FROM user_tables;

SELECT table_name
FROM tabs;

SELECT * FROM tabs;

DESCRIBE user_tab_columns;

SELECT * FROM user_tab_columns;

SELECT column_name, data_type, data_length, data_default, data_precision, data_scale, nullable
FROM user_tab_columns
WHERE table_name = 'EMPLOYEES';

SELECT column_name, data_type, data_length, data_default, data_precision, data_scale, nullable
FROM user_tab_columns
WHERE table_name = 'HIRE_DATES';

SELECT constraint_name, constraint_type, search_condition, r_constraint_name, delete_rule, status
FROM user_constraints
WHERE table_name = 'EMPLOYEES';

DESCRIBE user_cons_columns;

SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'EMPLOYEES';

COMMENT ON TABLE employees
IS 'Informationen zur Tabelle "employees"';

COMMENT ON COLUMN employees.first_name
IS 'Vorname';


SELECT * FROM user_col_comments
WHERE table_name = 'EMPLOYEES';



























