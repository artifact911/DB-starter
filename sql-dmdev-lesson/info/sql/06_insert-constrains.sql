CREATE TABLE company_storage.company
(
    id   INT PRIMARY KEY ,
    name VARCHAR(128) UNIQUE NOT NULL ,
    date DATE NOT NULL CHECK (date > '1995-01-01' AND date < '2020-01-01')
);

INSERT INTO company_storage.company(id, name, date)
VALUES (1, 'Google', '2001-01-01'),
       (2, 'Apple', '2002-10-29'),
       (3, 'Facebook', '1998-09-13');