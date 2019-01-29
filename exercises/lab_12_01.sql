--1.

SELECT table_name FROM user_tables;

SELECT table_name FROM all_tables
WHERE OWNER NOT IN('HR');

SELECT column_name, data_type, data_length
FROM USER_TABLES
WHERE table_name='&Table';


select * from dictionary
WHERE table_name='employees';



