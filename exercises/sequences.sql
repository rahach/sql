-- sequences

INSERT INTO test
    SELECT * FROM test;

UPDATE test SET salary=0;  

CREATE SEQUENCE test_idx_inc
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    MAXVALUE 99999999
    NOCYCLE
    NOCACHE;

DROP SEQUENCE test_salary_inc;
    
SELECT * FROM user_objects
WHERE OBJECT_TYPE='SEQUENCE';

DESCR user_objects;

UPDATE test SET salary=0;

UPDATE test SET salary=TEST_SALARY_INC.NEXTVAL;

ALTER TABLE test
ADD idx NUMBER(10);

ALTER TABLE test
DROP (num);

UPDATE test SET idx=TEST_IDX_INC.NEXTVAL;

SELECT COUNT(*) FROM test;

SELECT * FROM test 
WHERE idx=159333;

SELECT COUNT(*) FROM test 
WHERE employee_id=122;

CREATE INDEX test_idx_inc_inc
ON test(idx);

CREATE UNIQUE INDEX test_idx_inc_inc
ON test(idx);

DROP INDEX test_idx_inc_inc;

SELECT * FROM test t1
JOIN test t2
ON t1.idx=t2.idx;

SELECT * FROM test t1
JOIN test t2
ON t1.employee_id=t2.employee_id;

SELECT INDEX_NAME, TABLE_NAME
FROM USER_INDEXES;

ALTER TABLE test ADD PRIMARY KEY(idx) 
USING INDEX test_idx_inc_inc;

CREATE INDEX test_last_name_upper
ON test(UPPER(last_name));

SELECT * FROM test
WHERE UPPER(last_name) = 'KING';

SELECT * FROM test
WHERE UPPER(email) LIKE '%ING%';





































