-- Case Study 4: Marketing Campaign Performance
-- Question: Total units sold per product, banded against performance thresholds.
-- Skills:   GROUP BY, SUM, CASE
-- Dialect:  Standard SQL

SELECT
    product_id,
    SUM(quantity) AS total_units_sold,
    -- Check the highest threshold first so each total lands in the right band
    CASE
        WHEN SUM(quantity) >= 30 THEN 'Outstanding'
        WHEN SUM(quantity) BETWEEN 20 AND 29 THEN 'Satisfactory'
        WHEN SUM(quantity) BETWEEN 10 AND 19 THEN 'Unsatisfactory'
        ELSE 'Poor'
    END AS ad_performance
FROM marketing_campaign
GROUP BY product_id
ORDER BY total_units_sold DESC;

-- Expected result:
-- 101 | 65 | Outstanding
-- 103 | 35 | Outstanding
-- 102 | 27 | Satisfactory
-- 105 | 18 | Unsatisfactory
-- 104 | 17 | Unsatisfactory
