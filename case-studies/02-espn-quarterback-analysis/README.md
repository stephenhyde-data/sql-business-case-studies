# Case Study 2: ESPN Quarterback Analysis

*Finding the longest completion in 2016*

[← Back to all case studies](../../README.md)

## Business question

Find the quarterback who recorded the longest completion in 2016. Return the quarterback's name and their longest throw.

## Why the question matters

Sports analysts often need to pick out the strongest performance from a particular season. This is a simple example of turning a larger performance table into one clear answer for reporting.

## Dataset overview

**Table:** `qb_stats`

| Relevant field | Purpose |
|----------------|---------|
| `qb` | Quarterback name |
| `lg` | Longest completion recorded |
| `year` | Season used to filter the data |

## Approach

- Filter the table to keep only records from 2016.
- Sort the remaining rows by longest completion, highest first.
- Return only the first row, which holds the maximum value.

## SQL solution

```sql
SELECT
    qb,
    lg
FROM qb_stats
WHERE year = 2016
ORDER BY lg DESC
LIMIT 1;
```

## Expected result

| qb | lg |
|----|----|
| Ben Roethlisberger | 90 |

## Explanation

The `WHERE` clause limits the analysis to 2016. `ORDER BY lg DESC` puts the longest completion first, and `LIMIT 1` returns only that record. In the supplied data, Ben Roethlisberger has the highest value at 90 yards.

> [!TIP]
> **Alternative approach:** the same answer could be found with `MAX(lg)`. Sorting and limiting is easy to read and returns the quarterback's name without an extra subquery.

## What I learned

This exercise reinforced that a clear business question doesn't always need complex SQL. Filtering, ordering and limiting can be enough when the requirement is to find the single highest result.
