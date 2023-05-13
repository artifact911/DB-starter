-- LEFT JOIN
SELECT c.name, e.first_name
FROM company c
         LEFT JOIN employee e ON c.id = e.company_id

SELECT c.name, e.first_name
FROM employee e
         LEFT JOIN company c on e.company_id = c.id

-- RIGHT JOIN
SELECT c.name, e.first_name
FROM employee e
         RIGHT JOIN company c on e.company_id = c.id
    AND c.date > '2001-01-01'

-- FULL JOIN
SELECT c.name, e.first_name
FROM employee e
         FULL JOIN company c on e.company_id = c.id;