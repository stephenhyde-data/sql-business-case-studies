-- Case Study 3: Where Are the Managers?
-- Question: Which employees have or had a job title containing "Manager"?
-- Skills:   INNER JOIN, LIKE with wildcards
-- Dialect:  Standard SQL

SELECT
    w.first_name,
    t.worker_title
FROM workers AS w
INNER JOIN titles AS t
    ON w.worker_id = t.worker_ref_id      -- link each worker to their title history
WHERE t.worker_title LIKE '%Manager%';    -- any title containing "Manager"

-- Expected result:
-- Alice | HR Manager
-- David | Engineering Manager
-- Emma  | Marketing Manager
