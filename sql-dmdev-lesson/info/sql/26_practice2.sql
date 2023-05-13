-- 1. Создать БД перелетов flight_repository с таблицами:

-- airport c полями:
---- code(уникальный код аэропорта)
---- country(страна)
---- city(город)

-- aircraft(самолет) c полями:
---- id
---- model(модель самолета)

-- seat(место в самолете) c полями:
---- aircraft_id(самолет)
---- seat_no (номер места в самолете)

-- flight(рейс) c полями:
---- id(номер рейса не уникальный, поэтому нужен id)
---- flight_no(номер рейса)
---- departure_date(дата вылета)
---- departure_airport_code(аэропорт вылета)
---- arrival_date(дата прибытия)
---- arrival_airport_code(аэропорт прибытия)
---- aircraft_id(самолет)
---- status(статус рейса: cancelled, arrived, departed, scheduled)

-- ticket(билет на сомолет) c полями:
---- id
---- passenger_no(номер пасспорта пассажира)
---- passenger_name(имя и фамилия пассажира)
---- flight_id(рейс)
---- seat_no(номер места в самолете - flight_id + seat_no - unique)
---- cost(стоимость)

-- 2. Занести инфу в БД
-- 3. Запросы:
---- Кто летел позавчера рейсом Минск(MNK) - Лондон(LND) на месте B01?
---- Сколько мест осталось незанятыми 2020-06-04 на рейсе MN3002?

CREATE DATABASE flight_repository;

CREATE TABLE airport
(
    code    CHAR(3) PRIMARY KEY,
    country VARCHAR(256) NOT NULL,
    city    VARCHAR(128) NOT NULL
);

CREATE TABLE aircraft
(
    id    SERIAL PRIMARY KEY,
    model VARCHAR(128) NOT NULL
);

CREATE TABLE seat
(
    aircraft_id INT REFERENCES aircraft (id) ON DELETE CASCADE,
    seat_no     VARCHAR(4) NOT NULL,
    -- проще сделать отдельный id. Тут мы учимся
    PRIMARY KEY (aircraft_id, seat_no)
);

CREATE TABLE flight
(
    id                     BIGSERIAL PRIMARY KEY,
    flight_no              VARCHAR(16)                       NOT NULL,
    departure_date         TIMESTAMP                         NOT NULL,
    departure_airport_code CHAR(3) REFERENCES airport (code) NOT NULL,
    arrival_date           TIMESTAMP                         NOT NULL,
    arrival_airport_code   CHAR(3) REFERENCES airport (code) NOT NULL,
    aircraft_id            INT REFERENCES aircraft (id)      NOT NULL,
    status                 VARCHAR(32)                       NOT NULL
);

CREATE TABLE ticket
(
    id             SERIAL PRIMARY KEY,
    passenger_no   VARCHAR(32)                   NOT NULL UNIQUE,
    passenger_name VARCHAR(128)                  NOT NULL,
    flight_id      BIGINT REFERENCES flight (id) NOT NULL,
    seat_no        VARCHAR(4)                    NOT NULL,
    cost           NUMERIC(8, 2)                 NOT NULL -- NUMERIC(8, 2) - 8 всего, 2 после запятой
);