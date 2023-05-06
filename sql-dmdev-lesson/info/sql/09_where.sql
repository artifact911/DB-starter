SELECT DISTINCT id,
                first_name f_name,
                last_name  l_name,
                salary
FROM employee empl
WHERE salary <> 1000
ORDER BY first_name, salary DESC;

SELECT DISTINCT id,
                first_name f_name,
                last_name  l_name,
                salary
FROM employee empl
WHERE first_name = 'Ivan'
ORDER BY first_name, salary DESC;

SELECT DISTINCT id,
                first_name f_name,
                last_name  l_name,
                salary
FROM employee empl
WHERE first_name LIKE 'Pet%'
ORDER BY first_name, salary DESC;

SELECT DISTINCT id,
                first_name f_name,
                last_name  l_name,
                salary
FROM employee empl
WHERE salary BETWEEN 1000 AND 1500
ORDER BY first_name, salary DESC;

SELECT DISTINCT id,
                first_name f_name,
                last_name  l_name,
                salary
FROM employee empl
WHERE salary IN (1000, 1100, 2000)
  AND first_name LIKE 'Iv%'
ORDER BY first_name, salary DESC;

SELECT DISTINCT id,
                first_name f_name,
                last_name  l_name,
                salary
FROM employee empl
WHERE salary IN (1000, 1100, 2000)
   OR (first_name LIKE 'Iv%' AND last_name ILIKE '%ov')
ORDER BY first_name, salary DESC;