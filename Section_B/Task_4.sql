-- 1. Create the deliveries table
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    delivery_time_mins INT,
    order_date DATE
);

-- 2. Insert at least 10 rows across 4 delivery agents with varied delivery times
INSERT INTO deliveries (delivery_id, agent_name, restaurant_name, delivery_time_mins, order_date) VALUES
(1, 'Rahul Verma', 'Spice Kitchen', 25, '2026-10-01'),
(2, 'Rahul Verma', 'Biryani Blues', 30, '2026-10-02'),
(3, 'Anita Shah', 'Udipi Delight', 20, '2026-10-01'),
(4, 'Anita Shah', 'Dragon House', 22, '2026-10-02'),
(5, 'Vikram Singh', 'Tandoor Palace', 45, '2026-10-01'),
(6, 'Vikram Singh', 'Fafda House', 40, '2026-10-02'),
(7, 'Pooja Patel', 'Coastal Curry', 18, '2026-10-01'),
(8, 'Pooja Patel', 'Spice Kitchen', 22, '2026-10-02'),
(9, 'Rahul Verma', 'Udipi Delight', 28, '2026-10-03'),
(10, 'Vikram Singh', 'Dragon House', 50, '2026-10-03');

-- 3. Query combining CTE, RANK(), scalar subquery, and CASE WHEN
WITH agent_stats AS (
    SELECT 
        agent_name,
        AVG(delivery_time_mins) AS avg_delivery_time,
        COUNT(delivery_id) AS total_deliveries
    FROM deliveries
    GROUP BY agent_name
)
SELECT 
    agent_name,
    total_deliveries,
    ROUND(avg_delivery_time, 2) AS avg_delivery_time,
    RANK() OVER (ORDER BY avg_delivery_time ASC) AS speed_rank,
    CASE 
        WHEN avg_delivery_time <= (SELECT AVG(delivery_time_mins) FROM deliveries) THEN 'On Track'
        ELSE 'Needs Improvement'
    END AS performance_status,
    ROUND((SELECT AVG(delivery_time_mins) FROM deliveries), 2) AS platform_overall_avg
FROM agent_stats
ORDER BY speed_rank;