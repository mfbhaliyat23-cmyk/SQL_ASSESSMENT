SCENARIO_2:-

1. The Right JOIN for the Job: LEFT JOIN
To ensure every registered customer appears in the final report—even those who have never ordered—you must use a 
LEFT JOIN (or LEFT OUTER JOIN).

How it works here: You place the customers table on the left and the orders table on the right. 
The database returns all records from the customers table. 
If a customer has matching records in the orders table, those details are attached. 
If a customer has no matching orders, they are still included in the results, 
with NULL values displayed for the order-related columns.

2. Comparing LEFT JOIN with INNER JOIN
LEFT JOIN: Prioritizes the "left" table (customers). 
It guarantees that every row from the left table makes it into the final output, regardless of whether a match exists on the right side.

INNER JOIN: Acts as a strict filter. It only returns rows where there is a matching entry in both tables. 
If a record exists in one table but not the other, it is dropped entirely.

3. What Data Would Be Lost If You Used INNER JOIN?
If you used an INNER JOIN instead of a LEFT JOIN, you would completely lose sight of any customer who has never placed an order.

Specifically, you would lose:

New or Inactive Users: Customers who signed up for the app, created an account, browsed, 
but ultimately dropped off before checking out their first order.

Marketing Opportunities: The marketing team would be unable to run re-engagement campaigns 
or analyze sign-up trends for acquisition vs. activation because those unactivated users would vanish from the dataset.