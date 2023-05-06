CREATE TABLE company_storage.company
(
    id   INT PRIMARY KEY ,
    name VARCHAR(128) UNIQUE NOT NULL ,
    date DATE NOT NULL CHECK (date > '1995-01-01' AND date < '2020-01-01')
);