WITH FilteredOrders AS (
    -- Select orders from 2023 and assign an OrderStatus
    SELECT 
        CustomerName,
        TotalAmount,
        Status,
        CASE 
            WHEN Status IN ('Shipped', 'Delivered') THEN 'Completed'
            WHEN Status = 'Pending' THEN 'Pending'
            WHEN Status = 'Cancelled' THEN 'Cancelled'
        END AS OrderStatus
    FROM Orders
    WHERE OrderDate BETWEEN '2023-01-01' AND '2023-12-31'
),
OrderInsights AS (
    -- Group by OrderStatus and calculate total orders and revenue
    SELECT 
        OrderStatus,
        COUNT(*) AS TotalOrders,
        SUM(TotalAmount) AS TotalRevenue
    FROM FilteredOrders
    GROUP BY OrderStatus
)
-- Filter statuses with revenue > 5000 and sort results
SELECT OrderStatus, TotalOrders, TotalRevenue
FROM OrderInsights
WHERE TotalRevenue > 5000
ORDER BY TotalRevenue DESC;