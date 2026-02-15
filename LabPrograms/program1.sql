-- Step1 & Step2

CREATE TABLE school (
    student_id NUMBER,
    student_name VARCHAR2(10)
);

--Step3
DECLARE
    stud_id NUMBER := 0;
    stud_name VARCHAR2(10);
BEGIN
    FOR i IN 1..10 LOOP
        stud_id := i;
        stud_name := 'student'||i;
        INSERT INTO school (student_id, student_name) VALUES (stud_id, stud_name);
        DBMS_OUTPUT.PUT_LINE('Inserted '||stud_id|| '|' ||stud_name);
    END LOOP;
END;
/

SELECT * from school;


