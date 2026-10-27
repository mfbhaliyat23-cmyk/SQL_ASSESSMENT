SCENARIO_4:-

1. Comparing RANK() vs. DENSE_RANK()
Both are window functions used with an ORDER BY clause to assign a numerical rank 
to rows within a partition (in this case, within each city), but they handle ties and numbering sequences differently:

RANK(): When there is a tie, rows receive the exact same rank number. However, 
the next rank number skips based on how many items were tied. 
For example, if two items tie for 2nd place, the next item is ranked 4th (skipping 3).

DENSE_RANK(): When there is a tie, rows also receive the same rank number, but the sequence continues consecutively without any gaps. 
If two items tie for 2nd place, the next item is ranked 3rd.

2. Side-by-Side Example
Imagine four restaurants in Surat with the following monthly revenues:

Spice Route: Rs. 50,000 (Rank 1)

Biryani House: Rs. 40,000 (Tie)

Tandoori Flames: Rs. 40,000 (Tie)

Curry Club: Rs. 30,000

Here is how each function numbers them:
RestaurantRevenue (Rs.)RANK() 
OutputDENSE_RANK() OutputSpice Route50,
00011Biryani House40,
00022Tandoori Flames40,
00022Curry Club30,
0004 (Skipped 3)3 (Sequential)

3. Which Function to Choose and Why
For a product team building a "Top N" revenue report, DENSE_RANK() is generally the better choice.

Reasoning: Stakeholders (like product managers and business leads) 
expect a "Top 3" list to represent distinct performance tiers (1st place, 2nd place, 3rd place).
If a tie occurs at the 2nd position, using RANK() results in a numbering jump to 4th place, 
which can confuse readers who look at the report and ask, "Where is 3rd place?"

DENSE_RANK() keeps the ranking clean and intuitive (1, 2, 2, 3), ensuring that the fourth restaurant is correctly identified 
as belonging to the 3rd performance tier rather than being pushed artificially down to 4th.

4. Practical Impact on the Product Team's Report
Handling Ties in Filtering: If the product team writes a filter like WHERE ranking <= 3, 
both functions will successfully include all tied restaurants (in the example above, 
all four restaurants would actually be captured if the filter is set to <= 3, because the tied restaurants share rank 2, 
and the next rank is either 3 or 4).

Visual Presentation and Clarity: If the report displays the rank number in a UI or spreadsheet, 
DENSE_RANK() prevents confusing visual gaps like "Rank 1, Rank 2, Rank 2, Rank 4". 
It maintains a polished, professional appearance that aligns with standard business reporting expectations.

