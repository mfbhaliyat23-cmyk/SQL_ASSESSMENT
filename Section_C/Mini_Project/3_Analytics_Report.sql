1. Revenue Report Query (GROUP BY & HAVING)

SELECT 
    r.name AS restaurant_name,
    r.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_amount) AS total_revenue,
    AVG(o.order_amount) AS avg_order_value
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.name, r.city
HAVING COUNT(o.order_id) > 3;

2. Customer Segmentation Query (CASE WHEN)

SELECT 
    c.customer_id,
    c.name AS customer_name,
    COALESCE(SUM(o.order_amount), 0.00) AS total_lifetime_spend,
    CASE 
        WHEN COALESCE(SUM(o.order_amount), 0.00) > 5000 THEN 'Platinum'
        WHEN COALESCE(SUM(o.order_amount), 0.00) BETWEEN 2000 AND 5000 THEN 'Gold'
        ELSE 'Standard'
    END AS customer_tier
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_lifetime_spend DESC;

3. Window Function Queries

WITH restaurant_revenue AS (
    SELECT 
        r.restaurant_id,
        r.name AS restaurant_name,
        r.city,
        SUM(o.order_amount) AS total_revenue
    FROM restaurants r
    JOIN orders o ON r.restaurant_id = o.restaurant_id
    GROUP BY r.restaurant_id, r.name, r.city
),
ranked_restaurants AS (
    SELECT 
        restaurant_name,
        city,
        total_revenue,
        DENSE_RANK() OVER (PARTITION BY city ORDER BY total_revenue DESC) AS revenue_rank
    FROM restaurant_revenue
)
SELECT 
    city,
    restaurant_name,
    total_revenue,
    revenue_rank
FROM ranked_restaurants
WHERE revenue_rank <= 3;

B. Each Customers Single Most Recent Order (using ROW_NUMBER)

WITH customer_orders_ranked AS (
    SELECT 
        c.customer_id,
        c.name AS customer_name,
        o.order_id,
        o.order_amount,
        o.order_date,
        ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY o.order_date DESC) AS rn
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
)
SELECT 
    customer_name,
    order_id,
    order_amount,
    order_date
FROM customer_orders_ranked
WHERE rn = 1;

4. Saved View & Recent Orders Filter

-- 1. Create the SQL VIEW joining all four tables
CREATE VIEW vw_daily_order_summary AS
SELECT 
    o.order_date,
    c.name AS customer_name,
    r.name AS restaurant_name,
    da.name AS agent_name,
    o.order_amount,
    o.delivery_time_mins
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
JOIN delivery_agents da ON o.agent_id = da.agent_id;

-- 2. Query the view to display only orders placed in the last 7 days
SELECT *
FROM vw_daily_order_summary
WHERE order_date >= CURRENT_DATE - INTERVAL 7 DAY;