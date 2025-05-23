-- Step 1: Create the invoice table
CREATE TABLE invoice (
    invoice_id INT IDENTITY(1, 1) PRIMARY KEY, -- Auto-incrementing column starting from 1
    amount DECIMAL(10, 2)                      -- Decimal column with no constraints
);

-- Step 2: Insert rows (identity auto-generates invoice_id)
INSERT INTO invoice (amount) VALUES (100.50);
INSERT INTO invoice (amount) VALUES (200.75);
INSERT INTO invoice (amount) VALUES (300.10);
INSERT INTO invoice (amount) VALUES (400.25);
INSERT INTO invoice (amount) VALUES (500.00);

-- Step 3: Enable IDENTITY_INSERT to manually insert a specific invoice_id
SET IDENTITY_INSERT invoice ON;
INSERT INTO invoice (invoice_id, amount) VALUES (100, 600.00);
SET IDENTITY_INSERT invoice OFF;

-- Step 4: Insert more rows (identity auto-increments invoice_id)
INSERT INTO invoice (amount) VALUES (700.50);
INSERT INTO invoice (amount) VALUES (800.75);

-- Final output: Check the table content
SELECT * FROM invoice;