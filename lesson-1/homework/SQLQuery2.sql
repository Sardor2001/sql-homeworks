DROP TABLE IF EXISTS product;

CREATE TABLE product(
    product_id INT,
    product_name VARCHAR(255),
    price DECIMAL(10, 2),
    CONSTRAINT UQ_product_id UNIQUE(product_id)
)

ALTER TABLE product
DROP CONSTRAINT UQ_product_id;

ALTER TABLE product
ADD CONSTRAINT UQ_product_product_id UNIQUE (product_id);

ALTER TABLE product
DROP CONSTRAINT UQ_product_product_id; -- Drop existing constraint
ALTER TABLE product
ADD CONSTRAINT UQ_product_product_id_name UNIQUE (product_id, product_name);