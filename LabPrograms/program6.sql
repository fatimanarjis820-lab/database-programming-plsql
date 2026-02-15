CREATE TABLE employee(
    empId NUMBER,
    empFirstName VARCHAR2(10),
    empLastName VARCHAR2(10),
    salary NUMBER
);
-- DROP TABLE employee;

INSERT INTO employee VALUES (1, 'John', 'D', 10000);
INSERT INTO employee VALUES (2, 'Jane', 'S', 20000);
INSERT INTO employee VALUES (3, 'Johnson', 'B', 30000);

COMMIT;

DECLARE
    c_empId employee.empId%TYPE;
    c_empFirstName employee.empFirstName%TYPE;
    c_empLastName employee.empLastName%TYPE;
    c_salary employee.salary%TYPE;

CURSOR employee_cursor IS
    SELECT empId, empFirstName, empLastName, salary FROM employee FOR UPDATE;

BEGIN
    OPEN employee_cursor;
    LOOP
        FETCH employee_cursor INTO c_empId, c_empFirstName, c_empLastName, c_salary;
        EXIT WHEN employee_cursor%NOTFOUND;

        UPDATE employee SET salary = c_salary + (c_salary * 0.10) WHERE CURRENT OF employee_cursor;

        -- DBMS_OUTPUT.PUT_LINE(RPAD(c_empId, 2) || RPAD(c_empFirstName, 10) ||  RPAD(c_empLastName, 2) || RPAD(c_salary, 8));

    END LOOP;
    CLOSE employee_cursor;
END;
/

SELECT * FROM employee;
