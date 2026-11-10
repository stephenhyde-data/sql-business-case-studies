# Case Study 4: Marketing Campaign Performance

*Summarising sales and applying performance bands*

[← Back to all case studies](../../README.md)

## Business question

Calculate total units sold for each product and classify advertising performance as:

| Band | Total units sold |
|------|------------------|
| Outstanding | 30+ |
| Satisfactory | 20–29 |
| Unsatisfactory | 10–19 |
| Poor | 1–9 |

Return the product ID, total units sold (highest first) and the performance band.

## Approach

- Group transactions by `product_id`.
- Use `SUM(quantity)` to calculate total units sold.
- Use `CASE` to turn the numeric totals into meaningful performance bands.
- Sort the result from the highest total to the lowest.

## SQL solution

```sql
SELECT
    product_id,
    SUM(quantity) AS total_units_sold,
    CASE
        WHEN SUM(quantity) >= 30 THEN 'Outstanding'
        WHEN SUM(quantity) BETWEEN 20 AND 29 THEN 'Satisfactory'
        WHEN SUM(quantity) BETWEEN 10 AND 19 THEN 'Unsatisfactory'
        ELSE 'Poor'
    END AS ad_performance
FROM marketing_campaign
GROUP BY product_id
ORDER BY total_units_sold DESC;
```

## Expected result

| product_id | total_units_sold | ad_performance |
|------------|------------------|----------------|
| 101 | 65 | Outstanding |
| 103 | 35 | Outstanding |
| 102 | 27 | Satisfactory |
| 105 | 18 | Unsatisfactory |
| 104 | 17 | Unsatisfactory |

## Explanation

`SUM(quantity)` calculates the total for every product once the rows are grouped. `CASE` checks each total from the highest threshold downwards and assigns a readable band. The output turns transaction-level data into a summary that managers can act on.

> [!IMPORTANT]
> **Why order matters:** `CASE` conditions are checked from top to bottom. Starting with the highest threshold stops a value such as 65 being placed in a lower band.

## Business interpretation

Products 101 and 103 achieved Outstanding performance. Product 102 was Satisfactory, while products 104 and 105 were Unsatisfactory. The sample data contains no product in the Poor band.

## What I learned

This exercise showed how aggregation and business rules work together. SQL can calculate totals and also translate them into bands that are easier for managers to interpret.
