-- STEP 1: Create the table with PRIMARY KEY
CREATE TABLE orders (
    order_id INT PRIMARY KEY,       -- order_id is set as the primary key
    customer_name NVARCHAR(100),    -- No constraint on customer_name
    order_date DATE                 -- No constraint on order_date
);

-- STEP 2: Find the name of the PRIMARY KEY constraint (Optional)
SELECT kc.name AS Constraint_Name
FROM sys.key_constraints kc
INNER JOIN sys.tables t ON kc.parent_object_id = t.object_id
WHERE kc.type = 'PK' AND t.name = 'orders';

-- STEP 3: Drop the PRIMARY KEY constraint (Use the found constraint name)
ALTER TABLE orders
DROP CONSTRAINT PK__orders__46596229705A0406;

-- STEP 4: Re-add the PRIMARY KEY constraint with a new name
ALTER TABLE orders
ADD CONSTRAINT PK_orders PRIMARY KEY (order_id);