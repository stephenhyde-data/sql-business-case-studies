# Case Study 1: Customer Session Analysis

*Calculating customer engagement with window functions*

[← Back to all case studies](../../README.md)

## Business question

Given users' session logs on a particular day, calculate how many hours each user was active that day. A session starts when `state = 1` and ends when `state = 0`.

## Why the question matters

Understanding customer engagement helps organisations measure how much a platform is used and supports business decisions.

## Dataset overview

**Table:** `cust_tracking`

| Column | Description |
|--------|-------------|
| `cust_id` | Unique customer identifier |
| `state` | `1` = login, `0` = logout |
| `timestamp` | Event time |

## Approach

- Create a CTE to organise the events.
- Pair each login with the next event using `LEAD()`.
- Calculate each session's length with `DATEDIFF()`.
- Total all sessions for each customer.

## SQL solution

```sql
WITH total_sessions AS (
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
    SUM(DATEDIFF(MINUTE, timestamp, next_timestamp)) / 60.0 AS active_hours
FROM total_sessions
WHERE state = 1
GROUP BY cust_id;
```

> [!NOTE]
> `DATEDIFF(MINUTE, …)` is SQL Server syntax. See the [dialect notes](../../README.md#sql-dialect-notes) for PostgreSQL and MySQL equivalents.

## Explanation

The CTE organises the events. `LEAD()` pairs each login with the next event for the same customer, `DATEDIFF()` calculates how long each session lasted, and the final query adds up the active hours.

> [!TIP]
> **Alternative approach:** a self join could also pair login and logout events, but `LEAD()` is simpler for sequential data.

## What I learned

This exercise improved my understanding of CTEs, window functions and analysing sequential event data.
