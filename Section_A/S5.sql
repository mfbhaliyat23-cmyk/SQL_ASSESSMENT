SCENARIO_5:-

1)
SELECT 
    customer_id,
    SUM(total_amount) AS total_lifetime_spend,
    CASE 
        WHEN SUM(total_amount) > 5000 THEN 'Platinum'
        WHEN SUM(total_amount) >= 2000 THEN 'Gold'
        ELSE 'Standard'
    END AS customer_tier
FROM orders
GROUP BY customer_id;

2. What Happens at Exactly Rs 5,000?
A customer with a total spend of exactly Rs 5,000 will fall into the Gold tier.

Here is why:

The first condition evaluates whether spend is strictly greater than 5,000 (> 5000). 
Since 5,000 is not strictly greater than 5,000, this evaluates to FALSE.

SQL proceeds to the second condition (BETWEEN 2000 AND 5000 or >= 2000). 
Since 5,000 falls within this range, it evaluates to TRUE, assigning the customer to Gold.

Note on standard inclusion: If business rules require exactly Rs 5,000 to qualify for Platinum, 
the first condition must use >= 5000 instead of > 5000.

3. How the Order of WHEN Conditions Controls the Outcome
SQL evaluates CASE conditions sequentially from top to bottom and stops evaluating as soon as it encounters 
the first condition that evaluates to TRUE (short-circuit evaluation).

Because of this order-dependent behavior:

Top-to-Bottom Precedence:
If you evaluate WHEN SUM(total_amount) >= 2000 before checking for 5,000, 
a customer who spent Rs 8,000 would match the >= 2000 check immediately and be incorrectly labeled as Gold, 
never reaching the 5,000 check.

Specific to General Ordering:
Conditions must be ordered from the most restrictive/highest threshold down to the lowest threshold 
(or use explicit non-overlapping ranges like BETWEEN).

Checking the highest threshold (> 5000) first ensures that high-value customers are filtered out immediately into Platinum, 
allowing remaining customers to be correctly categorized into Gold or Standard.