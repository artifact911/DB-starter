# SQL lesson

**Оглавление:**

1. [Common](#common)
2. [GetStart](#getStart)
3. [ConnectingDB](#connectingDB)
4. [DDL_DML](#ddl-dml)
5. [CreateTable](#createTable)
6. [Id-AutoGeneration](#id-AutoGeneration)
7. [Select. OrderBy. Aliases](#select-OrderBy-Aliases)
8. [Where. Like](#where-Like)
9. [Foreign Key](#foreignKey)
10. [Union](#union)
11. [Sub-select](#sub-select)
12. [Delete](#delete)
13. [Update](#update)
14. [DB-Normalizing](#db-Normalizing)
15. [DB-NormalForm 1, 2, 3](#db-NormalForm1-2-3)
16. [Table Relations](#tableRelations)

## <p id='common'>0. Common</p>
1) Constraints
   - NOT NULL - поле не может быть null
   - UNIQUE - поле должно быть уникальным
       -  UNIQUE (first_name, last_name) - сложение двух полей и проверка на уникальность
   - CHECK - проверка на поле по какому-либо признаку
   - PRIMARY KEY
   - FOREIGN KEY

2) DataType
   - INT - Integer
   - BIGINT - Long
   - DECIMAL, NUMERIC - с плавающей точкой (большие)
   - SERIAL, BIGSERIAL - автоинкрементируются
   - DATE - для даты
   - TIME - время
   - TIMESTAMP - дата и время
   - TEXT - не ограничен по длинне
   - CHAR(2) - определенной длинны (не больше не меньше)
   - VARCHAR(128) - ограниченной длинны ("ДО")

3) Agregation DB Function - все встроенные функции лежат в схеме pg_catalog. все агрегирующие функции объединяют выборку в одну строку
   - sum(salary) - постчитает сумму всех salary
   - avg(salary) - посчитает среднее
   - max(salary) - достанет максимальное
   - min(salary) - достанет минимальное
   - count(*) - посчитает количество строк
       - "*" - строки
       - "salary" - только те строки, где не null значание salary
   - upper(first_name) - в верхний регистр
   - lower(first_name) - в нижний
   - concat(first_name, ' ', last_name) - конкатенация
       - first_name || ' ' || last_name - альтернатива
   - now() - вернет текущую дату по серверу

## <p id='getStart'>1. GetStart</p>

![субд.png](scr%2F%D1%81%D1%83%D0%B1%D0%B4.png)

Субд - простыми словами это программа, которая управляет файликами с данными на диске.
    
- [Postre SQL для начинающих](https://edu.postgrespro.ru/introbook_v7.pdf)
- [Документация PostgreSQL](https://postgrespro.ru/docs/postgresql/15/)

## <p id='connectingDB'>3. ConnectingDB</p>

#### from IDEA
![idea-step1.png](scr%2Fidea-step1.png)

    Имя БД можно написать любое
    username при установке postgres указывали - по умолчанию postgres
    password при установке postgres указывали - по умолчанию postgres
![idea-step2.png](scr%2Fidea-step2.png)

![idea-step3.png](scr%2Fidea-step3.png)

## <p id='ddl-dml'>4. DDL DML</p>

![ddl-dml.png](scr%2Fddl-dml.png)

#### Синтаксис SQL
- ключевые слова пишем на капсе
- неключевые через нижнее подчеркивание
- каждая инструкция sql заканчивается ";"

После создания БД не отображаются ее схемы. Нужно перейти в настройки и включить отображение
![noSchemas afrer creating.png](scr%2FnoSchemas%20afrer%20creating.png)

При создании новой схемы она у нас создалась не в нашей новой базе, а в postgres. Это связано с тем, что при создании
новой БД нужно делать новое подключение, но IDEA позволяет выбрать БД удобным способом

    это в подключениях
![new schema in wrong db.png](scr%2Fnew%20schema%20in%20wrong%20db.png)

    так переключим
![change DB for sql-command.png](scr%2Fchange%20DB%20for%20sql-command.png)

## <p id='createTable'>5. Create Table</p>
При создании таблиц нужно указывать в IDEA к какой схеме мы образаемся, либо в SQL-запросе прописывать это явно,
иначе будет выбрана public-по умолчанию.

## <p id='id-AutoGeneration'>7. Id-AutoGeneration</p>
При использовании для ID автоинкрементального типа данных, нам не нужно заботится об этом самим.

## <p id='select-OrderBy-Aliases'>8. Select. OrderBy. Aliases</p>

      SELECT DISTINCT id,
      first_name AS f_name,
      last_name AS l_name,
      salary
      FROM employee AS empl
      ORDER BY first_name, salary
      LIMIT 2
      OFFSET 2;

Postgres понимает, что после имени поля, кроме запятой в селекте ничего больше быть не может, поэтому
тут не обязательно использовать AS

- DISTINCT - уникальные
- LIMIT - только 2 записи в результирующем наборе
- OFFSET - сначала пропусти 2 записи, а потом возьми остальные

Но лимит и offset без сортировки юзать плохо, т.к. выборка рандомная. Поэтому накануне делают сортировку
- ORDER BY

В данном примере сортировка будет по first_name и если они совпадут, то по salary

## <p id='where-Like'>9. Where. Like</p>
- WHERE salary >= 1000
- WHERE first_name = 'Ivan'
- WHERE first_name != 'Ivan'

- WHERE first_name LIKE 'Pet%'
- WHERE last_name LIKE '%ov'
- WHERE last_name LIKE '%ov%'

- WHERE salary BETWEEN 1000 AND 1500

- WHERE salary IN (1000, 1100, 2000)
- WHERE salary IN (1000, 1100, 2000) AND first_name LIKE 'Iv%'
- WHERE salary IN (1000, 1100, 2000) OR first_name LIKE 'Iv%'

!= - не равно. Не все СУБД поддерживают такой синтаксис. Тогда они юзают <>

- LIKE - при использовании LIKE процент говорит, что меня не интересует ничкго, после моего префикса. Если
я не поставлю процент, то будет работат, как обычное сравнение строк.
   - LIKE - чувствителен к регистру.
   - ILIKE - не чувствителен, но не все СУБД его поддерживают.

- BETWEEN - поиск между

- IN - если хотим доставать конкретные поля

## <p id='foreignKey'>11. Foreign Key</p>
      CREATE TABLE employee
      (
      id         SERIAL PRIMARY KEY,
      first_name VARCHAR(128) NOT NULL,
      last_name  VARCHAR(128) NOT NULL,
      company_id INT REFERENCES company (id),
      salary     INT,
      UNIQUE (first_name, last_name)
      --     FOREIGN KEY (company_id) REFERENCES company
      );

Таким образом мы говорим, что company_id это foreignKey и он ссылается на company.id. company (id) - Id - можно не
указывать, в этом случае поумолчанию берется первичный ключ.

--     FOREIGN KEY (company_id) REFERENCES company - альтернативная запись - не предпочтительная

## <p id='union'>12. Union</p>
      SELECT
      id,
      first_name
      FROM employee
      WHERE company_id IS NOT NULL
      UNION ALL
      SELECT
      id,
      first_name
      FROM employee
      WHERE employee.salary IS NULL

- UNION ALL - соберет все значения и дубликаты тоже из второй выборки
- UNION - соберет все значения из первой выдобки и добавит из второй выборки те, которых в первой не было

Для UNION ограничения:
- количество полей в выбокрах должно совпадать
- типы данных полей должны совпадать
- Не нужно мешать боб с горохом, например в первой талице взять числовой id, а в другой числовой salary

Union можно писать в одом запросе сколько угодно раз

## <p id='sub-select'>13. Sub-select</p>
- Для подзапроса ОБЯЗАТЕЛЕН алиас

  - подзапрос получает двух сотрудников по ЗП
  - запрос считает их среднюю ЗП
  
        SELECT
        avg(empl.salary)
        FROM (SELECT
        *
        FROM employee
        ORDER BY salary DESC
        LIMIT 2) empl;


  - подзапрос считает всю среднюю ЗП
  - подзапрос достаюет максимальную ЗП
  - запрос добавляет соответсвующие столбцы из подзапросов к выборке

          select *,
          (select avg(salary) from employee) avg,
          (select max(salary) from employee) max
          from employee;


  - подзапрос достает максимальную ЗП и отнимает ЗП сотрудника
  - запрос добавляет соответсвующий столбец из подзапроса к выборке и показывает разницу от максимальной ЗП

          select *,
          (select max(salary) from employee) - salary diff
          from employee;


  - подзапрос достает компании с датой больше '2000-01-01'
  - запрос показывает всех работников с такими компаниями

          select *
          from employee
          where company_id IN (select company.id from company where date > '2000-01-01')

## <p id='delete'>14. Delete</p>
- DELETE FROM employee; - удалит ВСЕ записи из таблицы

У нас не получится удалить запись, если на нее ссылается другая запись в таблице.
В данном примере, мы нее можем удалить компанию, т.к. на нее имеет fKey запить из таблицы employee

      DELETE
      FROM company
      WHERE id = 1;

Решения:
   1. Удалить сначала всез сотрудников, которые ссылаются на эту компанию, а потом саму компанию

            DELETE
            FROM employee
            WHERE company_id = 1;

   2. При создании таблицы сотрудников указать каскадное удаление, и тогда при удалении комапнии из базы удалятся все ее сотрудники.
            
            CREATE TABLE employee
            (
                id         SERIAL PRIMARY KEY,
                first_name VARCHAR(128) NOT NULL,
                last_name  VARCHAR(128) NOT NULL,
                company_id INT REFERENCES company (id) ON DELETE CASCADE ,
                salary     INT,
                UNIQUE (first_name, last_name)
            );

- ON DELETE бывает:
  - CASCADE
  - NO ACTION - ничего не делать при удалении строки на которую ссылается запись эта запись
  - RESTRICT - ничего не делать при удалении строки на которую ссылается запись эта запись
  - SET DEFAULT - установить какое-то дефолтное значение
  - SET NULL - установить NULL

## <p id='update'>15. Update</p>

      UPDATE employee
      SET company_id = 1,
      salary = 1700;      - удалит ВСЕ записи из таблицы

- Обновление/удаление строк возвращает количество строк, которые изменили.
- Если мы хотим видеть, что это были за строки, то нам нужно юзать спец оператор RETURNING

        UPDATE employee
        SET company_id = 1,
            salary = 1700
        WHERE id = 10
        -- RETURNING id, first_name || ' ' || employee.last_name fio
        RETURNING *;

## <p id='db-Normalizing'>17. DB-Normalizing</p>
#### Реляционная БД
- это упорядоченная информация, связанная между собой определенными отношениями

#### Нормализация
- это метод проектирования БД, который позволяет привести БД к минимальной избыточности

#### Избыточность данных
- это когда одни и те же данные хранятся в БД в нескольких местах(таблицах), именно это и приводит к различным аномалиям

#### Нормальная форма БД
- это набор правил и критериев, которым должна отвечать БД


    На практике используется только 1-3 формы, т.к. чем выше, тем строже. Соответственно очень медленно все работает.
    Каждая следующая форма поддерживает предыдущую
![DB normalForm.png](scr%2FDB%20normalForm.png)

## <p id='db-NormalForm1-2-3'>18. DB-NormalForm 1, 2, 3</p>
#### NF-1
![18_NF1.png](scr%2F18_NF1.png)

    Сейчас таблица выглядит так. Сейчас она нарущает нормализауцию в части хранения однородных данных (домашний и
    рабочий телефоны - это ENUM)
![18_NF1_was.png](scr%2F18_NF1_was.png)

    Тогда разнесем так и исправим положение
![18_NF1_actual.png](scr%2F18_NF1_actual.png)

#### NF-2
![18_NF2.png](scr%2F18_NF2.png)

    Добавим Primary Key
![18_NF2_actual.png](scr%2F18_NF2_actual.png)

#### NF-3
![18_NF3.png](scr%2F18_NF3.png)

    Нарушен пункт2: у нас все данные можно получить затребовав id и все данные к id привязаны в строке. НО 
    домашний/рабочий зависят не от id, а от телефона. Создаем новую таблицу:
![18_NF3_actual.png](scr%2F18_NF3_actual.png)

#### Total
![18_NF_total.png](scr%2F18_NF_total.png)

## <p id='tableRelations'>19. Table Relations</p>
### Один ко многим
    Вот такая таблица у нас есть и нам не нравится, что дублируются строки, ссылаясь на разнве контакты.
![18_NF3_actual.png](scr%2F18_NF3_actual.png)

    Тогда мы можем это реализовать иначе: мы удалим у employee ссылку на таблицу contact и пусть теперь 
    contact ссылается на employee. Итого, у одного сотрудника может быть много номеров, 
    но у каждого номера, один хозяин
![19_One to Many.png](scr%2F19_One%20to%20Many.png)

### Один ко одному
    У одного сотрудника, только один телефон и у одного телефона только один хозяин
![19_One to One_1.png](scr%2F19_One%20to%20One_1.png)

    Можно объеденить столбцы и сказать, что наш primaryKey = foreignKey 
![19_One to One_2.png](scr%2F19_One%20to%20One_2.png)

### Многие ко многим
    Представим, что в офисе есть телефон, по которому можно дозвониться до многих сотрудников. Получается, что 
    у номера много абонентов. И у абонентов много номеров (домашний, рабочий, мобильный). Такая связь реализуется через 
    промежуточную таблицу
![19_Many to Many.png](scr%2F19_Many%20to%20Many.png)

### UML
    Для того, чтобы делиться структурой БД, сущесвуют uml-диаграммы. Для генерации:
    rClick по нужной схеме -> diagrams -> show visualisation
![19_uml.png](scr%2F19_uml.png)
![19_erd.png](scr%2F19_erd.png)
