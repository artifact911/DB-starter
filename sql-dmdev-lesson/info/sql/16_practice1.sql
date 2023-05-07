CREATE DATABASE book_repository;

CREATE TABLE author
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(128) NOT NULL,
    last_name  VARCHAR(128) NOT NULL
);

CREATE TABLE book
(
    id        BIGSERIAL PRIMARY KEY,
    name      VARCHAR(128) NOT NULL,
    year      SMALLINT     NOT NULL,
    pages     SMALLINT     NOT NULL,
    author_id INT REFERENCES author (id)
);

INSERT INTO author (first_name, last_name)
VALUES ('Кей', 'Хорстманн'),
       ('Стивен', 'Кови'),
       ('Тони', 'Роббинс'),
       ('Наполеон', 'Хилл'),
       ('Роберт', 'Кийосаки'),
       ('Дейл', 'Карнеги');

INSERT INTO book (name, year, pages, author_id)
VALUES ('Java. Библтотеку профессионала. Том 1', 2010, 1102, (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('Java. Библтотеку профессионала. Том 2', 2012, 954, (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('Java SE 8. Вврдный курс', 2015, 203, (SELECT id FROM author WHERE last_name = 'Хорстманн')),
       ('7 навыков высокоэффективных людей', 1989, 396, (SELECT id FROM author WHERE last_name = 'Кови')),
       ('Разбуди в себе исполина', 1991, 576, (SELECT id FROM author WHERE last_name = 'Роббинс')),
       ('Думай и богатей', 1937, 336, (SELECT id FROM author WHERE last_name = 'Хилл')),
       ('Богатый папа, бедный папа', 1997, 352, (SELECT id FROM author WHERE last_name = 'Кийосаки')),
       ('Квадрант денежного потока', 1998, 368, (SELECT id FROM author WHERE last_name = 'Кийосаки')),
       ('Как перестать беспокоится и начать жить', 1948, 368, (SELECT id FROM author WHERE last_name = 'Карнеги')),
       ('Как завревывать людей и оказывать влияние на людей', 1936, 352,
        (SELECT id FROM author WHERE last_name = 'Карнеги'));

-- Написать запрос, выбирающий название книги, год и имя автора,
--     отсортированные по году издания книги в возрастащем порядке
SELECT b.name,
       b.year,
       (SELECT a.first_name || ' ' || a.last_name
        FROM author a
        WHERE b.author_id = a.id) autor_name
FROM book b
ORDER BY b.year;

-- То же, но в убывающем
SELECT b.name,
       b.year,
       (SELECT a.first_name || ' ' || a.last_name
        FROM author a
        WHERE b.author_id = a.id) autor_name
FROM book b
ORDER BY b.year DESC;

-- Написать запрос, выбирающий количкество книг у заданного автора
SELECT count(*) books
FROM book b
-- WHERE b.author_id = 1;
WHERE b.author_id = (SELECT id FROM author WHERE first_name = 'Кей');

-- Написать запрос, выбирающий книги, у которых количество страниц больше
--     среднего количества страниц по всем книгам
SELECT *
FROM book b
WHERE b.pages > (SELECT avg(pages)
                 FROM book);

-- Написать запрос, выбирающий 5 самых старых книг
--     Дополнить запрос и посчитать суммарное количество страниц среди этих книг

SELECT *
FROM book b
ORDER BY b.year ASC
LIMIT 5;

SELECT sum(pages)
FROM (SELECT *
      FROM book b
      ORDER BY b.year ASC
      LIMIT 5) page_sum;

-- Написать запрос, изменящий количество книг у одной из книг
UPDATE book
SET pages = pages + 5
WHERE id = 2
RETURNING name, year, pages;

-- Написать запрос, удаляющий автора, написавшего самую большую книгу
DELETE
FROM book
    WHERE author_id = (SELECT author_id
                       FROM book
                       WHERE pages = (SELECT max(pages)
                                      FROM book));

DELETE
FROM author a
WHERE a.id = 1
RETURNING *;