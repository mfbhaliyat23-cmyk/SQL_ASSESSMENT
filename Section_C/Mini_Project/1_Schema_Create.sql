-- 1. Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- 2. Restaurants Table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    cuisine_type VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- 3. Delivery Agents Table
CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- 4. Orders Table (Linking all entities via Foreign Keys)
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    agent_id INT NOT NULL,
    order_amount DECIMAL(10, 2) NOT NULL,
    delivery_time_mins INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (agent_id) REFERENCES delivery_agents(agent_id)
);