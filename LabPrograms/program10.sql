CREATE TABLE employee(
    empId NUMBER,
    empFirstName VARCHAR2(10),
    empLastName VARCHAR2(10),
    salary NUMBER,
    creationDate DATE
);


CREATE TRIGGER SetCreationDate 
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    :NEW.creationDate := SYSDATE;
END;
/

SELECT * FROM employee;

INSERT INTO employee (empId, empFirstName, empLastName,salary ) VALUES (1, 'John', 'D', 10000);
INSERT INTO employee (empId, empFirstName, empLastName,salary ) VALUES (2, 'Jane', 'S', 20000);
INSERT INTO employee (empId, empFirstName, empLastName,salary ) VALUES (3, 'Johnson', 'B', 30000);