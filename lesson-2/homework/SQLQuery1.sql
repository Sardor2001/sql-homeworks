-- Step 1: Create the table
CREATE TABLE test_identity (
    id INT IDENTITY(1,1) PRIMARY KEY,
    data NVARCHAR(100)
);

-- Step 2: Insert rows
INSERT INTO test_identity (data) VALUES ('Row 1'), ('Row 2'), ('Row 3'), ('Row 4'), ('Row 5');

-- Verify initial data
SELECT * FROM test_identity;

-- Step 3: Test DELETE
DELETE FROM test_identity;
SELECT * FROM test_identity; -- Verify empty
INSERT INTO test_identity (data) VALUES ('New Row after DELETE');
SELECT * FROM test_identity; -- Verify IDENTITY behavior after DELETE

-- Step 4: Test TRUNCATE
TRUNCATE TABLE test_identity;
SELECT * FROM test_identity; -- Verify empty
INSERT INTO test_identity (data) VALUES ('New Row after TRUNCATE');
SELECT * FROM test_identity; -- Verify IDENTITY behavior after TRUNCATE

-- Step 5: Test DROP
DROP TABLE test_identity;

-- Recreate the table
CREATE TABLE test_identity (
    id INT IDENTITY(1,1) PRIMARY KEY,
    data NVARCHAR(100)
);

-- Correct Insert
INSERT INTO test_identity (data) VALUES ('Row 1'), ('Row 2');

-- Verify recreated data
SELECT * FROM test_identity;