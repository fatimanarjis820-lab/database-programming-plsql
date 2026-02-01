CREATE TABLE students 
(
    student_id NUMBER, 
    student_name VARCHAR2(4)

);


INSERT INTO students (student_id, student_name) VALUES (101, 'Joh');


SELECT * FROM students;

DELETE FROM students;

DROP TABLE students;
