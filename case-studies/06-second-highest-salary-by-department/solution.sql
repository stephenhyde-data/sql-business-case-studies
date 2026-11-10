-- Case Study 6: Second-Highest Salary by Department
-- Question: What is the second-highest distinct salary in each department?
-- Skills:   CTE, DENSE_RANK(), PARTITION BY
-- Dialect:  Standard SQL (window functions)

WITH ranked_salaries AS (
    -- Rank salaries within each department; ties share a rank, no gaps
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

-- Expected result:
-- Finance | 201 | 85000
-- HR      | 101 | 60000
-- IT      | 302 | 110000
-- Sales   | 404 | 72000
