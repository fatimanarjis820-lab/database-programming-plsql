-- Table created
CREATE TABLE relationTable(
    column1 NUMBER,
    column2 VARCHAR2(4)
);

--Procedure created
CREATE PROCEDURE insertTuple(i NUMBER) 
AS
BEGIN
    INSERT INTO relationTable(column1, column2) VALUES (i, 'xxx');
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Tuple inserted successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Occured: '||SQLERRM);
END;
/

--Procedure call
DECLARE
    passing_value NUMBER := 123;
BEGIN
    insertTuple(passing_value);
END;
/


SELECT * FROM relationTable;

