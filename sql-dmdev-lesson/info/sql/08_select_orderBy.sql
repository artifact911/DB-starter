SELECT id,
       first_name,
       last_name,
       salary
FROM employee;

SELECT id,
       first_name AS f_name,
       last_name AS l_name,
       salary
FROM employee AS empl;

SELECT DISTINCT id,
                first_name f_name,
                last_name l_name,
                salary
FROM employee empl
ORDER BY first_name, salary
LIMIT 20 OFFSET 0;
