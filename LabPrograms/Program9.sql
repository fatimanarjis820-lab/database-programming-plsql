CREATE TABLE Emp (
    EmpID NUMBER,
    Name VARCHAR2(100),
    Salary NUMBER
);

INSERT INTO Emp (EmpID, Name, Salary) VALUES (1, 'John Smith', 50000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (2, 'Jane Doe', 60000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (3, 'Alice Johnson', 55000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (4, 'Bob Williams', 45000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (5, 'Charlie Brown', 70000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (6, 'Emily Davis', 52000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (7, 'David Miller', 48000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (8, 'Sophia Wilson', 63000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (9, 'Michael Moore', 59000);
INSERT INTO Emp (EmpID, Name, Salary) VALUES (10, 'Olivia Taylor', 61000);

SELECT * FROM Emp;

CREATE PROCEDURE GetEmployeeDetails(emp_id IN NUMBER)
AS
    emp_name VARCHAR2(100);
    emp_salary NUMBER;
BEGIN

    BEGIN
        SELECT Name, Salary INTO emp_name, emp_salary FROM Emp WHERE EmpID = emp_id;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No Employee Found with ID '||emp_id);
            RETURN;
    END;

    DBMS_OUTPUT.PUT_LINE('Employee ID is '||emp_id);
    DBMS_OUTPUT.PUT_LINE('Employee Name is '||emp_name);
    DBMS_OUTPUT.PUT_LINE('Employee Salary is '||emp_salary);
END GetEmployeeDetails;
/



BEGIN
    FOR i IN 1..10 LOOP
        GetEmployeeDetails(i);
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');
    END LOOP;
END;
/
