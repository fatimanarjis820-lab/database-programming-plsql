DECLARE
    num1 NUMBER := 10; 
    num2 NUMBER := 0;
    result NUMBER;
    divided_by_zero EXCEPTION;

BEGIN
    BEGIN
        result := num1/num2;
        DBMS_OUTPUT.PUT_LINE('Result is '||result);
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('Number divided by zero is not allowed');
            RAISE divided_by_zero;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error Occured due to '||SQLERRM);
    END;

EXCEPTION 
    WHEN divided_by_zero THEN
        DBMS_OUTPUT.PUT_LINE('Any customized message we can display');
DBMS_OUTPUT.PUT_LINE('We are executing Program 5');

END;
/