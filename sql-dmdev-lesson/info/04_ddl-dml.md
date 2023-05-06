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