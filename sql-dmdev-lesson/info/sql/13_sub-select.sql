SELECT
    avg(empl.salary)
FROM (SELECT
          *
      FROM employee
      ORDER BY salary DESC
      LIMIT 2) empl;

select *,
       (select avg(salary) from employee) avg,
       (select max(salary) from employee) max
from employee;

select *,
       (select max(salary) from employee) - salary diff
from employee;

select *
from employee
where company_id IN (select company.id from company where date > '2000-01-01')