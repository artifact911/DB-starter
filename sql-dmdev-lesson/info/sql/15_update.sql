UPDATE employee
SET company_id = 1,
    salary = 1700
WHERE id = 10
RETURNING id, first_name || ' ' || employee.last_name fio;
-- RETURNING *;

select *
from employee;

select *
from company;