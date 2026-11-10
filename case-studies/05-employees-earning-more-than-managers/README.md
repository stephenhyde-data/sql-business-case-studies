# Case Study 5: Employees Earning More Than Their Managers

*Comparing rows in the same table with a self join*

[← Back to all case studies](../../README.md)

## Business question

Find employees whose salary is greater than their manager's salary. Return each employee's first name and salary.

## Approach

- Use the `employee_detail` table twice: once for the employee and once for the manager.
- Match `employee.manager_id` to `manager.id`.
- Compare the employee's salary with the manager's.
- Keep only employees whose salary is higher.

## SQL solution

```sql
SELECT
    employee.first_name,
    employee.salary
FROM employee_detail AS employee
INNER JOIN employee_detail AS manager
    ON employee.manager_id = manager.id
WHERE employee.salary > manager.salary;
```

## Expected result

| first_name | salary |
|------------|--------|
| Jane | 95000 |
| Charlie | 88000 |

## Explanation

A self join treats one copy of the table as employee records and another copy as manager records. Jane reports to John and earns 95,000 compared with John's 90,000. Charlie reports to Bob and earns 88,000 compared with Bob's 85,000. Alice and Eve don't earn more than their managers.

> [!TIP]
> **Key concept:** aliases such as `employee` and `manager` make a self join easier to follow, because both sides come from the same physical table.

## What I learned

This case study helped me understand hierarchical data. A self join is useful when one row refers to another row in the same table, such as employees and their managers.
