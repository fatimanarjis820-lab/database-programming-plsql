-- Function in PL/SQL
CREATE TABLE employees ( id NUMBER, salary NUMBER );

INSERT INTO employees VALUES (101, 20000);
INSERT INTO employees VALUES (102, 20000);
INSERT INTO employees VALUES (103, 40000);
INSERT INTO employees VALUES (104, 50000);
INSERT INTO employees VALUES (102, 30000);


SELECT * FROM employees;

CREATE FUNCTION calculateSalary(emp_id IN NUMBER) RETURN NUMBER 
IS 
total_sal NUMBER := 0;
BEGIN
    SELECT SUM(salary) INTO total_sal FROM employees WHERE id = emp_id;
    RETURN total_sal;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END calculateSalary;
/

DECLARE
    check_emp_id NUMBER := 102;
    check_total_salary NUMBER;
BEGIN
    check_total_salary := calculateSalary(check_emp_id);  
    IF check_total_salary IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Salary of employees '|| check_emp_id || ' is ' || check_total_salary);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employees with employees id '|| check_emp_id || ' is  not found');
    END IF;
END;
/






