-- Case Study 2: ESPN Quarterback Analysis
-- Question: Which quarterback recorded the longest completion in 2016?
-- Skills:   WHERE filtering, ORDER BY, LIMIT
-- Dialect:  MySQL / PostgreSQL / SQLite (use SELECT TOP 1 in SQL Server)

SELECT
    qb,
    lg
FROM qb_stats
WHERE year = 2016      -- keep only the 2016 season
ORDER BY lg DESC       -- longest completion first
LIMIT 1;               -- return the single top record

-- Expected result: Ben Roethlisberger | 90
