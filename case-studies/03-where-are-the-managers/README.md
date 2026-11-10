# Case Study 3: Where Are the Managers?

*Joining workers to their job-title history*

[← Back to all case studies](../../README.md)

## Business question

Find all employees who have or had a job title containing the word "Manager". Return each employee's first name and the matching title.

## Business context

Employee details and job-title history are stored in separate tables. To answer the question, the records have to be connected using the employee identifier.

## Approach

- Join `workers.worker_id` to `titles.worker_ref_id`.
- Search `worker_title` for titles containing "Manager".
- Return the first name and matching title, including past titles.

## SQL solution

```sql
SELECT
    w.first_name,
    t.worker_title
FROM workers AS w
INNER JOIN titles AS t
    ON w.worker_id = t.worker_ref_id
WHERE t.worker_title LIKE '%Manager%';
```

## Expected result

| first_name | worker_title |
|------------|--------------|
| Alice | HR Manager |
| David | Engineering Manager |
| Emma | Marketing Manager |

## Explanation

The `INNER JOIN` combines employee and title records where the IDs match. `LIKE` with wildcards finds any title that contains "Manager", not just titles that are exactly that word. Emma appears because her title history includes Marketing Manager, even though she also has another title record.

> [!TIP]
> **Business insight:** using the title-history table means the query answers "have or had", rather than looking only at each employee's current role.

## What I learned

This case study strengthened my understanding of relational data. The information needed for one business answer may be split across tables, so choosing the correct join key is essential.
