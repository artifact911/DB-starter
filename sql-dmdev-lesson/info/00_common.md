### Constraints
- NOT NULL - поле не может быть null
- UNIQUE - поле должно быть уникальным
  -  UNIQUE (first_name, last_name) - сложение двух полей и проверка на уникальность
- CHECK - проверка на поле по какому-либо признаку
- PRIMARY KEY
- FOREIGN KEY

### DataType
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

### Agregation DB Function - все встроенные функции лежат в схеме pg_catalog. все агрегирующие функции объединяют выборку в одну строку
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
