CREATE TABLE account(
    account_num NUMBER,
    account_bal NUMBER
);

INSERT INTO account VALUES (123, 1000);

SELECT * FROM account;

CREATE PROCEDURE DEBIT_TRANSACTION(c_account_num NUMBER, c_account_amount NUMBER) -- 123, 200
AS
c_bal NUMBER;

BEGIN
    SELECT account_bal INTO c_bal FROM account WHERE account_num = c_account_num;
    IF c_bal >= c_account_amount THEN -- 800 >= 200
        UPDATE account SET account_bal = account_bal - c_account_amount WHERE account_num = c_account_num;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Debit transaction is successful');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient funds');
    END IF;
END;
/

-- BEGIN
--     DEBIT_TRANSACTION(123, 900);
-- END;
-- /

SELECT * FROM account;







