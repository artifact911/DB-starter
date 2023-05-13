SELECT company.name,
       employee.first_name || employee.last_name fio
FROM employee,
     company
WHERE employee.company_id = company.id;

-- INNER JOIN
SELECT c.name,
       employee.first_name || employee.last_name fio
FROM employee
-- JOIN - the same
         INNER JOIN company c
                    ON c.id = employee.company_id;

SELECT c.name,
       employee.first_name || ' ' || employee.last_name fio,
       ec.contact_id,
       c2.number
FROM employee
         JOIN company c
              ON c.id = employee.company_id
         JOIN employee_contact ec
              ON employee.id = ec.employee_id
         JOIN contact c2
              ON ec.contact_id = c2.id;

-- CROSS JOIN
SELECT *
FROM employee
         CROSS JOIN company;

SELECT *
FROM company
         CROSS JOIN (SELECT count(*) FROM employee) t;