DROP TABLE company_storage.company;
CREATE TABLE company_storage.company
(
    id   INT PRIMARY KEY,
    name VARCHAR(128) UNIQUE NOT NULL,
    date DATE                NOT NULL CHECK (date > '1995-01-01' AND date < '2020-01-01')
);

INSERT INTO company_storage.company(id, name, date)
VALUES (1, 'Google', '2001-01-01'),
       (2, 'Apple', '2002-10-29'),
       (3, 'Facebook', '1998-09-13'),
       (4, 'Amazon', '2005-06-17');

DROP TABLE company_storage.employee;
CREATE TABLE company_storage.employee
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL,
    company_id INT REFERENCES company (id) ON DELETE CASCADE,
    salary     INT,
    UNIQUE (first_name, last_name)
--     FOREIGN KEY (company_id) REFERENCES company

);

INSERT INTO employee (first_name, last_name, salary, company_id)
VALUES ('Ivan', 'Sidorov', 500, 1),
       ('Ivan', 'Brown', 500, 1),
       ('Ivan', 'Ivanov', 1000, 2),
       ('qIvan', 'Petrov', 1000, 2),
       ('Arni', 'Paramonov', NULL, 2),
       ('Petr', 'Petrov', 2000, 3),
       ('qPetr', 'Sidorov', 500, 3),
       ('Sveta', 'Svetikova', 1500, NULL);

DROP TABLE company_storage.contact;
CREATE TABLE company_storage.contact
(
    id     SERIAL PRIMARY KEY,
    number VARCHAR(128),
    type   VARCHAR(128)
);

INSERT INTO contact (number, type)
VALUES ('234-56-78', 'домашний'),
       ('987-65-43', 'рабочий'),
       ('565-25-91', 'мобильный'),
       ('332-55-67', NULL),
       ('465-11-22', NULL);

DROP TABLE company_storage.employee_contact;
CREATE TABLE company_storage.employee_contact
(
    employee_id INT REFERENCES employee (id),
    contact_id  INT REFERENCES contact (id)
);

INSERT INTO employee_contact (employee_id, contact_id)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (2, 3),
       (2, 4),
       (3, 5);