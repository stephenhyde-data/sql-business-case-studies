-- Case Study 5: Employees Earning More Than Their Managers
-- Question: Which employees earn more than their manager?
-- Skills:   Self join, table aliases
-- Dialect:  Standard SQL

SELECT
    employee.first_name,
    employee.salary
FROM employee_detail AS employee
INNER JOIN employee_detail AS manager       -- same table, used as the manager side
    ON employee.manager_id = manager.id
WHERE employee.salary > manager.salary;

-- Expected result:
-- Jane    | 95000
-- Charlie | 88000
