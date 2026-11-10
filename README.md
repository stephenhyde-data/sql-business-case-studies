# SQL Business Case Studies

Six SQL case studies that start from a business question and work through to a checked, explained answer. Each one covers the thinking behind the solution, the SQL itself, the expected result and what I learned.

The aim isn't to make every solution complex. It's to show that I can understand a question, choose a suitable method, write readable SQL, check the result and explain what it means for the business.

**Author:** Stephen Hyde · [LinkedIn](https://www.linkedin.com/in/stephenhyde-data)

> [!NOTE]
> These case studies are based on practice questions from the **Data in Motion** Data Analytics Career Pivot Programme. The solutions, explanations and reflections are my own.

## Case studies

| # | Case study | Business question | Main SQL skills |
|---|------------|-------------------|-----------------|
| 1 | [Customer Session Analysis](case-studies/01-customer-session-analysis) | How many hours was each user active in a day? | CTE, `LEAD()` window function, `DATEDIFF` |
| 2 | [ESPN Quarterback Analysis](case-studies/02-espn-quarterback-analysis) | Which quarterback had the longest completion in 2016? | Filtering, sorting, `LIMIT` |
| 3 | [Where Are the Managers?](case-studies/03-where-are-the-managers) | Which employees have or had a manager title? | `INNER JOIN`, `LIKE` with wildcards |
| 4 | [Marketing Campaign Performance](case-studies/04-marketing-campaign-performance) | How did each product perform against sales thresholds? | `GROUP BY`, `SUM`, `CASE` |
| 5 | [Employees Earning More Than Their Managers](case-studies/05-employees-earning-more-than-managers) | Which employees earn more than their manager? | Self join |
| 6 | [Second-Highest Salary by Department](case-studies/06-second-highest-salary-by-department) | What is the second-highest salary in each department? | CTE, `DENSE_RANK()`, `PARTITION BY` |

The cases are arranged from simple filtering to joins, aggregation, conditional logic, self joins and window functions.

## How each case study is structured

1. **Business question.** What's being asked and why it matters.
2. **Approach.** The question broken into clear steps.
3. **SQL solution.** Readable, commented SQL, also saved as `solution.sql`.
4. **Expected result.** The output checked against the sample data.
5. **Explanation and learning.** How the query works and what I took from it.

## Skills demonstrated

| Skill | Where it was used |
|-------|-------------------|
| `WHERE` / filtering | Selecting the 2016 quarterback records (Case 2) |
| `ORDER BY` and `LIMIT` | Returning the single longest completion (Case 2) |
| `INNER JOIN` | Connecting workers with their title history (Case 3) |
| `LIKE` and wildcards | Finding titles that contain "Manager" (Case 3) |
| `GROUP BY` and `SUM` | Calculating product sales totals (Case 4) |
| `CASE` | Classifying campaign performance (Case 4) |
| Self join | Comparing employees with their managers (Case 5) |
| CTEs | Organising session events and separating ranking logic (Cases 1 and 6) |
| `LEAD()` | Pairing each login with the next event (Case 1) |
| `DENSE_RANK()` | Finding the second-highest distinct salary by department (Case 6) |

## SQL dialect notes

Most queries use standard SQL. Two depend on the database:

- **Case 1** uses `DATEDIFF(MINUTE, start, end)`, which is SQL Server (T-SQL) syntax. In PostgreSQL you'd use `EXTRACT(EPOCH FROM (next_timestamp - timestamp)) / 60`, and in MySQL `TIMESTAMPDIFF(MINUTE, timestamp, next_timestamp)`.
- **Case 2** uses `LIMIT 1`, which works in MySQL, PostgreSQL and SQLite. In SQL Server you'd use `SELECT TOP 1`.

## Repository structure

```
sql-business-case-studies/
├── README.md
└── case-studies/
    ├── 01-customer-session-analysis/
    │   ├── README.md
    │   └── solution.sql
    ├── 02-espn-quarterback-analysis/
    ├── 03-where-are-the-managers/
    ├── 04-marketing-campaign-performance/
    ├── 05-employees-earning-more-than-managers/
    └── 06-second-highest-salary-by-department/
```

## Overall reflection

The main lesson across all six problems is that SQL starts with understanding the business requirement. Once the question is broken into clear steps, the right SQL technique becomes much easier to see.

## Acknowledgements

Practice questions and sample datasets come from the Data in Motion Data Analytics Career Pivot Programme.
