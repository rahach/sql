-- KAP 12

DESCR DICTIONARY;

SELECT * FROM dictionary
WHERE table_name='user_objects';

SELECT object_name, object_type
FROM user_objects;

SELECT *
FROM user_objects;

SELECT *
FROM all_objects
WHERE owner='%hr%';

SELECT *
FROM user_constraints
WHERE table_name='EMPLOYEES2';

SELECT * FROM all_objects
WHERE owner='HR';

SELECT * FROM user_cons_columns
WHERE owner='HR';

CREATE SEQUENCE employees2_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999999
    NOCACHE
    NOCYCLE;

UPDATE employees2 
SET id=(employees2_id_seq.NEXTVAL);

SELECT employees2_id_seq.NEXTVAL FROM dual;




