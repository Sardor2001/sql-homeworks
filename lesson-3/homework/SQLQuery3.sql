WITH CategoryProducts AS (
    SELECT 
        Category,
        ProductName,
        Price,
        Stock,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum
    FROM Products
),
MostExpensiveProducts AS (
    SELECT 
        Category,
        ProductName,
        Price,
        Stock,
        CASE 
            WHEN Stock = 0 THEN 'Out of Stock'
            WHEN Stock BETWEEN 1 AND 10 THEN 'Low Stock'
            ELSE 'In Stock'
        END AS InventoryStatus
    FROM CategoryProducts
    WHERE RowNum = 1
)
SELECT Category, ProductName, Price, InventoryStatus
FROM MostExpensiveProducts
ORDER BY Price DESC
OFFSET 5 ROWS;