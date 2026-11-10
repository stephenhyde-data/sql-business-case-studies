-- Case Study 1: Customer Session Analysis
-- Question: How many hours was each user active on the day?
--           A session starts when state = 1 and ends when state = 0.
-- Skills:   CTE, LEAD() window function, DATEDIFF
-- Dialect:  SQL Server (T-SQL)

WITH total_sessions AS (
    -- Pair every event with the next event for the same customer
    SELECT
        cust_id,
        state,
        timestamp,
        LEAD(timestamp) OVER (
            PARTITION BY cust_id
            ORDER BY timestamp
        ) AS next_timestamp
    FROM cust_tracking
)
SELECT
    cust_id,
    -- Only logins start a session; convert total minutes to hours
    SUM(DATEDIFF(MINUTE, timestamp, next_timestamp)) / 60.0 AS active_hours
FROM total_sessions
WHERE state = 1
GROUP BY cust_id;
