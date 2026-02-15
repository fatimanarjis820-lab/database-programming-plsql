CREATE TABLE employees ( id NUMBER, salary NUMBER );

INSERT INTO employees VALUES (101, 20000);
INSERT INTO employees VALUES (102, 20000);
INSERT INTO employees VALUES (103, 40000);
INSERT INTO employees VALUES (104, 50000);
INSERT INTO employees VALUES (105, 30000);

SELECT * FROM employees;

--Specifications
CREATE PACKAGE employeePackage AS 
tax_rate CONSTANT NUMBER := 0.15;

PROCEDURE calcNetSalary(
    emp_id IN NUMBER,
    emp_gross_salary OUT NUMBER,
    emp_net_salary OUT NUMBER
);

END employeePackage;
/

--Body
CREATE PACKAGE BODY employeePackage AS
PROCEDURE calcNetSalary(
    emp_id IN NUMBER,
    emp_gross_salary OUT NUMBER,
    emp_net_salary OUT NUMBER
)
IS
emp_basic_salary NUMBER;
BEGIN
    BEGIN
        SELECT salary INTO emp_basic_salary FROM employees WHERE id = emp_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NO DATA FOUND FROM EMPLOYEE ID '||emp_id);
    END;

    emp_gross_salary := emp_basic_salary;
    emp_net_salary := emp_basic_salary * (1-tax_rate);
END calcNetSalary;
END employeePackage;
/

DECLARE
    v_emp_id NUMBER := 103;
    v_gross_salary NUMBER;
    v_net_salary NUMBER;
BEGIN
    employeePackage.calcNetSalary(
        emp_id => v_emp_id,
        emp_gross_salary => v_gross_salary, 
        emp_net_salary => v_net_salary
    );
    IF v_gross_salary IS NOT NULL THEN 
        DBMS_OUTPUT.PUT_LINE('Employee Id is '||v_emp_id);
        DBMS_OUTPUT.PUT_LINE('Gross Salary is '||v_gross_salary);
        DBMS_OUTPUT.PUT_LINE('Net Salary is '||v_net_salary);
    END IF;
END;
/


