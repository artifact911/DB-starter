SELECT company.name, count(e.id)
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
-- WHERE company.name = 'Amazon'
GROUP BY company.name;


SELECT company.name, count(e.id)
FROM company
         LEFT JOIN employee e
                   ON company.id = e.company_id
GROUP BY company.name
HAVING count(e.id) > 0;