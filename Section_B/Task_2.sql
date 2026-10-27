-- 1. Create the delivery_orders table
CREATE TABLE delivery_orders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    total_amount DECIMAL(10, 2),
    order_status VARCHAR(20),
    order_date DATE
);

-- 2. Insert 10 rows covering 4 different restaurants
INSERT INTO delivery_orders (order_id, restaurant_name, city, total_amount, order_status, order_date) VALUES
(101, 'Spice Kitchen', 'Mumbai', 4500.00, 'Delivered', '2026-10-01'),
(102, 'Spice Kitchen', 'Mumbai', 6500.00, 'Delivered', '2026-10-02'),
(103, 'Biryani Blues', 'Bengaluru', 3200.00, 'Delivered', '2026-10-03'),
(104, 'Biryani Blues', 'Bengaluru', 2800.00, 'Delivered', '2026-10-04'),
(105, 'Udipi Delight', 'Ahmedabad', 1200.00, 'Delivered', '2026-10-05'),
(106, 'Udipi Delight', 'Ahmedabad', 1800.00, 'Delivered', '2026-10-06'),
(107, 'Dragon House', 'Delhi', 1500.00, 'Delivered', '2026-10-07'),
(108, 'Dragon House', 'Delhi', 2000.00, 'Delivered', '2026-10-08'),
(109, 'Spice Kitchen', 'Mumbai', 1200.00, 'Delivered', '2026-10-09'),
(110, 'Biryani Blues', 'Bengaluru', 1100.00, 'Delivered', '2026-10-10');

-- 3. Query combining aggregates, HAVING clause, and CASE WHEN expression
SELECT 
    restaurant_name,
    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders,
    AVG(total_amount) AS average_order_value,
    CASE 
        WHEN SUM(total_amount) > 10000 THEN 'High Revenue'
        ELSE 'Moderate Revenue'
    END AS revenue_tier
FROM delivery_orders
GROUP BY restaurant_name
HAVING SUM(total_amount) > 5000;