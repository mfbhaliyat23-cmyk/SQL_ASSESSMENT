-- Insert Customers (10 rows across Mumbai, Ahmedabad, Bengaluru)
INSERT INTO customers (customer_id, name, city, phone) VALUES
(1, 'Aarav Sharma', 'Mumbai', '9876543210'),
(2, 'Priya Patel', 'Ahmedabad', '9123456789'),
(3, 'Rohan Mehta', 'Mumbai', '9988776655'),
(4, 'Neha Gupta', 'Bengaluru', '9811223344'),
(5, 'Amit Kumar', 'Ahmedabad', '9700112233'),
(6, 'Sneha Rao', 'Bengaluru', '9655443322'),
(7, 'Vikram Joshi', 'Ahmedabad', '9544332211'),
(8, 'Pooja Nair', 'Mumbai', '9433221100'),
(9, 'Karan Verma', 'Bengaluru', '9322110099'),
(10, 'Ananya Iyer', 'Mumbai', '9211009988');

-- Insert Restaurants (10 rows across Mumbai, Ahmedabad, Bengaluru)
INSERT INTO restaurants (restaurant_id, name, cuisine_type, city) VALUES
(101, 'Spice Kitchen', 'North Indian', 'Mumbai'),
(102, 'Udipi Delight', 'South Indian', 'Ahmedabad'),
(103, 'Biryani Blues', 'Mughlai', 'Mumbai'),
(104, 'Dragon House', 'Chinese', 'Bengaluru'),
(105, 'Tandoor Palace', 'North Indian', 'Bengaluru'),
(106, 'Fafda House', 'Gujarati', 'Ahmedabad'),
(107, 'Coastal Curry', 'Seafood', 'Mumbai'),
(108, 'Punjab Grill', 'North Indian', 'Ahmedabad'),
(109, 'Dosa Plaza', 'South Indian', 'Bengaluru'),
(110, 'Mumbai Chowpatty', 'Street Food', 'Mumbai');

-- Insert Delivery Agents (10 rows across Mumbai, Ahmedabad, Bengaluru)
INSERT INTO delivery_agents (agent_id, name, city, phone) VALUES
(201, 'Rahul Verma', 'Mumbai', '9800112233'),
(202, 'Anita Shah', 'Ahmedabad', '9700223344'),
(203, 'Vikram Singh', 'Bengaluru', '9600334455'),
(204, 'Deepak Patel', 'Ahmedabad', '9500445566'),
(205, 'Sunita Rao', 'Mumbai', '9400556677'),
(206, 'Manoj Kumar', 'Bengaluru', '9300667788'),
(207, 'Kiran Joshi', 'Mumbai', '9200778899'),
(208, 'Suresh Nair', 'Ahmedabad', '9100889900'),
(209, 'Pooja Deshmukh', 'Bengaluru', '9000990011'),
(210, 'Ajay Mehta', 'Mumbai', '8900112233');

-- Insert Orders (12 rows spanning recent dates to test views and aggregations)
INSERT INTO orders (order_id, customer_id, restaurant_id, agent_id, order_amount, delivery_time_mins, order_date) VALUES
(1001, 1, 101, 201, 5500.00, 25, '2026-10-25'),
(1002, 2, 102, 202, 1800.00, 20, '2026-10-24'),
(1003, 3, 101, 201, 6200.00, 30, '2026-10-25'),
(1004, 4, 104, 203, 3400.00, 22, '2026-10-23'),
(1005, 1, 103, 205, 4800.00, 35, '2026-10-26'),
(1006, 5, 106, 204, 1500.00, 18, '2026-10-22'),
(1007, 6, 105, 206, 2900.00, 28, '2026-10-21'),
(1008, 2, 108, 208, 2100.00, 24, '2026-10-20'),
(1009, 3, 101, 207, 7500.00, 32, '2026-10-26'),
(1010, 7, 102, 202, 1200.00, 19, '2026-10-25'),
(1011, 4, 109, 209, 3100.00, 26, '2026-10-24'),
(1012, 1, 101, 201, 4200.00, 22, '2026-10-26');