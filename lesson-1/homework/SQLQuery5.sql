CREATE TABLE account (
    account_id INT PRIMARY KEY,                -- Primary key for account_id
    balance DECIMAL(10, 2) CONSTRAINT CK_balance CHECK (balance >= 0),
    account_type NVARCHAR(50) CONSTRAINT CK_account_type CHECK (account_type IN ('Saving', 'Checking')) 
);

ALTER TABLE account DROP CONSTRAINT CK_balance;
ALTER TABLE account DROP CONSTRAINT CK_account_type;

ALTER TABLE account
ADD CONSTRAINT CK_balance CHECK (balance >= 0);

ALTER TABLE account
ADD CONSTRAINT CK_account_type CHECK (account_type IN ('Saving', 'Checking'));