-- Step 1: Create the table with a default constraint
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,        -- Primary key
    name NVARCHAR(100),                 -- No special constraint
    city NVARCHAR(100) DEFAULT 'Unknown' -- Default value
);

-- Verify default behavior with sample inserts
INSERT INTO customer (customer_id, name, city) VALUES (1, 'Alice', 'New York'); -- Explicit city
INSERT INTO customer (customer_id, name) VALUES (2, 'Bob');                    -- Defaults to 'Unknown'

-- Check the table content
SELECT * FROM customer;

-- Step 2: Find and drop the default constraint
-- Query to find the default constraint name
SELECT 
    name AS Constraint_Name, 
    OBJECT_NAME(parent_object_id) AS Table_Name,
    COL_NAME(parent_object_id, parent_column_id) AS Column_Name
FROM sys.default_constraints
WHERE OBJECT_NAME(parent_object_id) = 'customer';

-- Drop constraint (Replace with actual constraint name if unknown)
ALTER TABLE customer
DROP CONSTRAINT DF__customer__city__5CD6CB2B;

-- Step 3: Re-add the default constraint with an explicit name
ALTER TABLE customer
ADD CONSTRAINT DF_customer_city DEFAULT 'Unknown' FOR city;

-- Test default behavior after re-adding the constraint
INSERT INTO customer (customer_id, name) VALUES (3, 'Charlie'); -- Defaults to 'Unknown'

-- Final check
SELECT * FROM customer;