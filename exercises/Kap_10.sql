-- KAP 10

UPDATE my_employee SET last_name = 'Drexler'
WHERE id=3;

COMMIT;

UPDATE my_employee SET salary = 1000
WHERE salary<900;

SELECT * FROM my_employee;

DELETE FROM my_employee WHERE first_name = 'Betty' AND last_name = 'Dancs';

INSERT INTO my_employee (id, last_name, first_name, userid, salary) VALUES (&id, &last_name, &first_name, &userid, &salary);

SAVEPOINT update_done;

DELETE FROM my_employee;

SELECT * FROM my_employee;

ROLLBACK TO update_done;

COMMIT;

DELETE FROM my_employee WHERE id=3;


























