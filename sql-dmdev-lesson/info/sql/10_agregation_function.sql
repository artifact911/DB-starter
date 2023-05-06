SELECT
    avg(salary)
FROM employee empl;

SELECT
    sum(salary)
FROM employee empl;

SELECT
    max(salary)
FROM employee empl;

SELECT
    min(salary)
FROM employee empl;

SELECT
    count(salary)
FROM employee empl;

SELECT
    upper(first_name)
FROM employee empl;

SELECT
    lower(first_name)
FROM employee empl;

SELECT
    lower(first_name),
    concat(first_name, ' ', last_name) fio
FROM employee empl;

SELECT
    lower(first_name),
    first_name || ' ' || last_name fio,
    now()
FROM employee empl;
