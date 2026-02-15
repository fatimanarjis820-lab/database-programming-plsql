-- Step1 & Step2

CREATE TABLE employee (
    EmpNo NUMBER,
    Name VARCHAR2(10),
    Salary NUMBER,
    Designation VARCHAR2(20),
    DeptId NUMBER
);

--SHIFT + ALT + DOWN ARROW (TO COPY PREVIOUS ROW)
INSERT INTO employee VALUES (101, 'Alice', 10000, 'Analyst', 10);
INSERT INTO employee VALUES (102, 'Bob', 20000, 'QA', 20);
INSERT INTO employee VALUES (103, 'Charlie', 30000, 'Developer', 30);
INSERT INTO employee VALUES (104, 'Diana', 40000, 'Tester', 40);
INSERT INTO employee VALUES (105, 'Ethan', 50000, 'SDET', 50);
INSERT INTO employee VALUES (106, 'Fiona', 60000, 'DevOps', 60);
INSERT INTO employee VALUES (107, 'George', 70000, 'Engineer', 70);
INSERT INTO employee VALUES (108, 'Hannah', 80000, 'Help Desk', 80);
INSERT INTO employee VALUES (109, 'Ian', 90000, 'Consultant', 90);
INSERT INTO employee VALUES (110, 'Julia', 100000, 'Programmer', 100);


SELECT * FROM employee;


DECLARE
    emp_no employee.EmpNo%TYPE;
    emp_name employee.Name%TYPE;
    emp_sal employee.Salary%TYPE;
    emp_designation employee.Designation%TYPE;
    emp_dept_id employee.DeptId%TYPE;

    CURSOR highest_paid_cursor IS 
    SELECT EmpNo, Name, Salary, Designation, DeptId FROM employee ORDER BY Salary DESC FETCH FIRST 5 ROWS ONLY;

BEGIN
    OPEN highest_paid_cursor;
    LOOP
        FETCH highest_paid_cursor into emp_no, emp_name, emp_sal, emp_designation, emp_dept_id;

        EXIT WHEN highest_paid_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(RPAD(emp_no, 4) || RPAD(emp_name, 7) || RPAD(emp_sal, 8) || RPAD(emp_designation, 12) || RPAD(emp_dept_id, 4));

    END LOOP;
    CLOSE highest_paid_cursor;
END;
/

SELECT EmpNo, Name, Salary, Designation, DeptId FROM employee ORDER BY Salary DESC FETCH FIRST 5 ROWS ONLY;

-- DROP table employee;






