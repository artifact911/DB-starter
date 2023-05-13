CREATE VIEW employee_view AS
SELECT c.name,
       e.last_name,
       e.salary,
       max(e.salary) OVER (PARTITION BY c.name),
       min(e.salary) OVER (PARTITION BY c.name),
       lag(e.salary) OVER (ORDER BY e.salary) - e.salary
FROM company c
         LEFT JOIN employee e
                   ON c.id = e.company_id
ORDER BY c.name;

SELECT *
FROM employee_view
WHERE name = 'Facebook';

CREATE MATERIALIZED VIEW m_employee_view AS
SELECT c.name,
       e.last_name,
       e.salary,
       max(e.salary) OVER (PARTITION BY c.name),
       min(e.salary) OVER (PARTITION BY c.name),
       lag(e.salary) OVER (ORDER BY e.salary) - e.salary
FROM company c
         LEFT JOIN employee e
                   ON c.id = e.company_id
ORDER BY c.name;

SELECT *
FROM m_employee_view
WHERE max = 2000;

SELECT *
FROM m_employee_view;

SELECT *
FROM employee_view;

REFRESH MATERIALIZED VIEW m_employee_view;