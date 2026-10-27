-- 1. Create the food_orders table
CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    item_ordered VARCHAR(100),
    quantity INT,
    price_per_item DECIMAL(10, 2),
    order_date DATE,
    city VARCHAR(50)
);

-- 2. Insert 8 rows spanning 3 cities (Mumbai, Ahmedabad, Bengaluru)
INSERT INTO food_orders (order_id, customer_name, restaurant_name, item_ordered, quantity, price_per_item, order_date, city) VALUES
(1, 'Aarav Sharma', 'Spice Kitchen', 'Butter Chicken', 2, 450.00, '2026-10-01', 'Mumbai'),
(2, 'Priya Patel', 'Udipi Delight', 'Masala Dosa', 3, 120.00, '2026-10-02', 'Ahmedabad'),
(3, 'Rohan Mehta', 'Biryani Blues', 'Hyderabadi Biryani', 1, 350.00, '2026-10-03', 'Mumbai'),
(4, 'Neha Gupta', 'Dragon House', 'Noodles', 2, 280.00, '2026-10-04', 'Bengaluru'),
(5, 'Amit Kumar', 'Spice Kitchen', 'Paneer Tikka', 1, 320.00, '2026-10-05', 'Mumbai'),
(6, 'Sneha Rao', 'Tandoor Palace', 'Dal Makhani', 2, 400.00, '2026-10-06', 'Bengaluru'),
(7, 'Vikram Joshi', 'Fafda House', 'Gathiya & Jalebi', 4, 150.00, '2026-10-07', 'Ahmedabad'),
(8, 'Pooja Nair', 'Coastal Curry', 'Fish Curry', 1, 550.00, '2026-10-08', 'Mumbai');

-- 3. Query 1: Retrieve all orders in 'Mumbai', sorted by price_per_item descending
SELECT * 
FROM food_orders 
WHERE city = 'Mumbai' 
ORDER BY price_per_item DESC;

-- 4. Query 2: Distinct restaurant names with at least one order
SELECT DISTINCT restaurant_name 
FROM food_orders;

-- 5. Query 3: Top 5 most expensive individual orders (total order cost)
SELECT 
    order_id, 
    customer_name, 
    restaurant_name, 
    item_ordered, 
    quantity, 
    price_per_item, 
    (quantity * price_per_item) AS total_order_price
FROM food_orders
ORDER BY total_order_price DESC
LIMIT 5;