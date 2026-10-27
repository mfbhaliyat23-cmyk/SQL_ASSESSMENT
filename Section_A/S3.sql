SCENARIO_3:-

1. How to Write the Subquery
To find delivery agents whose average delivery time is faster than the overall platform average, 
the query needs to perform two main steps:

Calculate the overall platform average delivery time across all orders.

Group the performance data by agent, calculate each agents average delivery time, 
and filter for those lower than the platform average.

SELECT agent_id, AVG(delivery_time_minutes) AS agent_avg_delivery_time
FROM deliveries
GROUP BY agent_id
HAVING AVG(delivery_time_minutes) < (
        SELECT AVG(delivery_time_minutes) 
        FROM deliveries
);

2. Which Type of Subquery Is Most Appropriate and Why?
The most appropriate type here is a Scalar Subquery.

Definition: A scalar subquery returns exactly one single value (one row and one column).

Why it's appropriate: The overall platform average is a single aggregate number (e.g., 32.5 minutes). 
A scalar subquery allows you to perform a direct single-value comparison (AVG(agent) < 32.5) 
inside the HAVING clause across all grouped delivery agents.

3. What Happens If You Place the Subquery in the SELECT Clause Instead of the WHERE/HAVING Clause?
If you place the scalar subquery in the SELECT clause, it changes the functionality from filtering rows to appending a calculated column:

In the WHERE / HAVING Clause: It acts as a filter. The database compares each agent's performance against the overall benchmark 
and excludes agents who are slower than or equal to the platform average.

In the SELECT Clause: It acts as an informative column. The query will return all agents 
and simply display the overall platform average next to each agent's individual average for comparison 
(e.g., Agent A: 28 mins | Platform Avg: 32.5 mins). It will not filter out the slower agents on its own.