# Case Study 6: Second-Highest Salary by Department

*Ranking distinct salary levels with DENSE_RANK*

[← Back to all case studies](../../README.md)

## Business question

Identify the second-highest salary in each department. Include the department, employee ID and salary. Employees on the same salary should share a rank, with no gap before the next rank.

## Why DENSE_RANK is appropriate

The requirement is based on distinct salary levels. If two employees share the highest salary, both should rank first and the next lower salary should rank second. `DENSE_RANK()` gives exactly this behaviour.

## Approach

- Partition employees by department so each department is ranked separately.
- Order salaries from highest to lowest.
- Use `DENSE_RANK()` so equal salaries share a position without creating gaps.
- Filter the ranked result to `salary_rank = 2`.

## SQL solution

```sql
WITH ranked_salaries AS (
    SELECT
        department,
        employee_id,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employee
)
SELECT
    department,
    employee_id,
    salary AS second_highest_salary
FROM ranked_salaries
WHERE salary_rank = 2
ORDER BY department, employee_id;
```

## Expected result

| department | employee_id | second_highest_salary |
|------------|-------------|-----------------------|
| Finance | 201 | 85000 |
| HR | 101 | 60000 |
| IT | 302 | 110000 |
| Sales | 404 | 72000 |

## Explanation

Finance has two employees earning 95,000, so both rank first and 85,000 ranks second. HR also has a shared top salary of 75,000, which makes 60,000 the second-highest distinct level. IT has a single top salary of 120,000 followed by 110,000. In Sales, 75,000 is highest and 72,000 is second.

> [!WARNING]
> **Common mistake:** `ROW_NUMBER()` would give employees with equal salaries different numbers, and `RANK()` would leave gaps after ties. `DENSE_RANK()` is the best match for the stated rule.

## What I learned

This was the most advanced problem in the set. It strengthened my understanding of CTEs, window functions, partitions and the differences between ranking functions.
