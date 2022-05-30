База данных кондитерской.
База данных кондитерской имеет 8 сущностей.

Назначение: для упрощения, систематизирование и регулирование информации.

Типовые запросы:

SELECT * FROM orders WHERE Сумма_заказа > 250;


SELECT * FROM provider WHERE Условия LIKE '%Поставка воды%';


SELECT employers.ФИО, orders.Desk_id
FROM employers INNER JOIN
orders ON employers.id = orders.Код_официанта
WHERE (orders.Desk_id = 1);


SELECT *
from desk ;


LETE from provider WHERE id = 6;

Технические требования:

Установленая на компьютере, такая программа как: MySQL WorkBench