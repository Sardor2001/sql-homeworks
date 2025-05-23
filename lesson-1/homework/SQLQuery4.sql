CREATE TABLE category (
    category_id INT PRIMARY KEY,       
    category_name NVARCHAR(100)        
);


CREATE TABLE item (
    item_id INT PRIMARY KEY,           
    item_name NVARCHAR(100),           
    category_id INT,                   
    CONSTRAINT FK_item_category FOREIGN KEY (category_id) REFERENCES category (category_id)
);

-- Insert sample data
INSERT INTO category (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Furniture');

-- Valid data
INSERT INTO item (item_id, item_name, category_id) VALUES
(101, 'Television', 1),
(102, 'Table', 2);

-- This will fail due to foreign key violation
-- INSERT INTO item (item_id, item_name, category_id) VALUES
-- (103, 'Smartphone', 3);

-- Drop the FOREIGN KEY constraint
ALTER TABLE item
DROP CONSTRAINT FK_item_category;

--Re-add the FOREIGN KEY constraint using ALTER TABLE
ALTER TABLE item
ADD CONSTRAINT FK_item_category
FOREIGN KEY (category_id) REFERENCES category (category_id);