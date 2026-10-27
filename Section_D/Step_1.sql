WITH agent_city_stats AS (
    -- Step 1: Calculate total completed orders and average delivery time per agent per city
    SELECT 
        da.agent_id,
        da.name AS agent_name,
        da.city,
        COUNT(o.order_id) AS total_orders,
        AVG(o.delivery_time_mins) AS avg_delivery_time
    FROM delivery_agents da
    JOIN orders o ON da.agent_id = o.agent_id
    GROUP BY da.agent_id, da.name, da.city
    HAVING COUNT(o.order_id) > 5 -- Filter for agents who completed more than 5 orders
),
ranked_agents AS (
    -- Step 2: Apply window function to rank agents within each city by total orders descending
    SELECT 
        city,
        agent_name,
        total_orders,
        ROUND(avg_delivery_time, 2) AS avg_delivery_time,
        RANK() OVER (PARTITION BY city ORDER BY total_orders DESC) AS agent_rank
    FROM agent_city_stats
)
-- Step 3: Select top 3 agents per city and apply final sorting
SELECT 
    city,
    agent_name,
    total_orders,
    avg_delivery_time,
    agent_rank
FROM ranked_agents
WHERE agent_rank <= 3
ORDER BY city ASC, agent_rank ASC;

