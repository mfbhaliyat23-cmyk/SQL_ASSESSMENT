-- 1. Create the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(20)
);

-- 2. Create the restaurants table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine_type VARCHAR(50),
    city VARCHAR(50)
);

-- 3. Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    amount DECIMAL(10, 2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- 4. Insert data into customers (6 rows; Amit Kumar and Sneha Rao have no orders)
INSERT INTO customers (customer_id, name, city, phone) VALUES
(1, 'Aarav Sharma', 'Mumbai', '9876543210'),
(2, 'Priya Patel', 'Ahmedabad', '9123456789'),
(3, 'Rohan Mehta', 'Mumbai', '9988776655'),
(4, 'Neha Gupta', 'Bengaluru', '9811223344'),
(5, 'Amit Kumar', 'Ahmedabad', '9700112233'),
(6, 'Sneha Rao', 'Bengaluru', '9655443322');

-- 5. Insert data into restaurants (6 rows)
INSERT INTO restaurants (restaurant_id, name, cuisine_type, city) VALUES
(101, 'Spice Kitchen', 'North Indian', 'Mumbai'),
(102, 'Udipi Delight', 'South Indian', 'Ahmedabad'),
(103, 'Biryani Blues', 'Mughlai', 'Mumbai'),
(104, 'Dragon House', 'Chinese', 'Bengaluru'),
(105, 'Tandoor Palace', 'North Indian', 'Bengaluru'),
(106, 'Fafda House', 'Gujarati', 'Ahmedabad');

-- 6. Insert data into orders (6 rows referencing active customers 1 to 4)
INSERT INTO orders (order_id, customer_id, restaurant_id, amount, order_date) VALUES
(1001, 1, 101, 450.00, '2026-10-01'),
(1002, 2, 102, 300.00, '2026-10-02'),
(1003, 1, 103, 850.00, '2026-10-03'),
(1004, 3, 101, 1200.00, '2026-10-04'),
(1005, 4, 104, 600.00, '2026-10-05'),
(1006, 2, 106, 250.00, '2026-10-06');

-- 7. INNER JOIN Query: List each order with customer name and restaurant name
SELECT 
    o.order_id,
    c.name AS customer_name,
    r.name AS restaurant_name,
    o.amount,
    o.order_date
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

-- 8. LEFT JOIN Query: List all customers (including those with no orders, showing NULLs)
SELECT 
    c.customer_id,
    c.name AS customer_name,
    c.city AS customer_city,
    o.order_id,
    o.amount,
    o.order_date,
    r.name AS restaurant_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

-- 9. Same-City Filter Query: Show only orders where customer and restaurant belong to the same city
SELECT 
    o.order_id,
    c.name AS customer_name,
    c.city AS customer_city,
    r.name AS restaurant_name,
    r.city AS restaurant_city,
    o.amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN restaurants r ON o.restaurant_id = r.restaurant_id
WHERE c.city = r.city;