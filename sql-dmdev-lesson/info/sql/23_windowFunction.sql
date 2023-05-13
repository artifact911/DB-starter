SELECT c.name,
       e.last_name,
       count(e.id) OVER (),
       max(e.salary) OVER (),
       avg(e.salary) OVER ()
FROM company c
         LEFT JOIN employee e
                   ON c.id = e.company_id
ORDER BY c.name;

SELECT c.name,
       e.last_name,
       e.salary,
       row_number() OVER (),
       dense_rank() OVER (partition by c.name ORDER BY e.salary nulls first )
FROM company c
         LEFT JOIN employee e
                   ON c.id = e.company_id
ORDER BY c.name;