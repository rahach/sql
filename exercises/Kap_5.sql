-- Übungen Kapitel 5

-- Task 1
-- 1
SELECT last_name||' earns '
||TO_CHAR(salary, 'fm$99,999.00')
||' monthly but wants '
||TO_CHAR(salary*3, 'fm$99,999.00')
||'.' "Dream Salaries"
FROM employees;

-- 2
SELECT last_name, hire_date, TO_CHAR(ADD_MONTHS(sysdate, ROUND(MOD(MONTHS_BETWEEN(sysdate, hire_date), 6))), 'fmDay, "den" DD. Month YYYY') review
FROM employees;

-- 3
SELECT last_name, NVL(TO_CHAR(commission_pct), 'No Commission')
FROM employees;

-- 4
SELECT job_id,
CASE job_id
    WHEN 'AD_PRES' THEN 'A'
    WHEN 'ST_MAN' THEN 'B'
    WHEN 'IT_PROG' THEN 'C'
    WHEN 'SA_REP' THEN 'D'    
    WHEN 'ST_CLERK' THEN 'E'
    ELSE '0'    
END grade
FROM employees;

-- 5
SELECT job_id,
CASE 
    WHEN job_id='AD_PRES' THEN 'A'
    WHEN job_id='ST_MAN' THEN 'B'
    WHEN job_id='IT_PROG' THEN 'C'
    WHEN job_id='SA_REP' THEN 'D'    
    WHEN job_id='ST_CLERK' THEN 'E'
    ELSE '0'    
END grade
FROM employees;

-- 6
SELECT job_id,
DECODE( 
job_id, 'AD_PRES' , 'A',
        'ST_MAN'  , 'B',
        'IT_PROG' , 'C',
        'SA_REP'  , 'D',    
        'ST_CLERK', 'E',
    '0') grade
FROM employees;































