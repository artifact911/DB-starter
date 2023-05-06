SELECT
    id,
    first_name
FROM employee
WHERE company_id IS NOT NULL
   UNION ALL
SELECT
    id,
    first_name
FROM employee
WHERE employee.salary IS NULL
