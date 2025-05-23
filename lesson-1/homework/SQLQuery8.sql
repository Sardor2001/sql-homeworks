-- Create the table with constraints
CREATE TABLE books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,            -- Auto-incrementing primary key
    title NVARCHAR(255) NOT NULL,                    -- Title must not be empty
    price DECIMAL(10, 2) CHECK (price > 0),          -- Price must be greater than 0
    genre NVARCHAR(100) DEFAULT 'Unknown'            -- Genre defaults to 'Unknown'
);

-- Valid inserts
INSERT INTO books (title, price, genre) VALUES ('Book 1', 15.99, 'Fiction'); -- All valid
INSERT INTO books (title, price) VALUES ('Book 2', 20.00);                  -- No genre (defaults to 'Unknown')

-- Invalid cases (will fail)
-- INSERT INTO books (title, price, genre) VALUES (NULL, 10.00, 'Non-fiction'); -- Invalid: NULL title
-- INSERT INTO books (title, price, genre) VALUES ('Book 3', -5.00, 'Fantasy'); -- Invalid: Negative price
-- INSERT INTO books (title, price) VALUES ('Book 4', 0.00);                    -- Invalid: Zero price

-- Insert row with default genre
INSERT INTO books (title, price) VALUES ('Book 5', 25.50); -- No genre (defaults to 'Unknown')

-- Check data
SELECT * FROM books;

-- Verify constraints
SELECT name AS Constraint_Name,
       OBJECT_NAME(parent_object_id) AS Table_Name,
       definition AS Constraint_Definition
FROM sys.check_constraints
WHERE OBJECT_NAME(parent_object_id) = 'books';