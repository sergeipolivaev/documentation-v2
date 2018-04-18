---
title: Обращение к базе данных смарт-терминала
permalink: java_query_api.html
sidebar: evojava
tags:
product: Java SDK
---

С помощью запросов к базе данных смарт-терминала приложения могут получать необходимую информацию, например, данные товаров ([класс ProductQuery.kt](./integration-library/ru/evotor/framework/inventory/ProductQuery.html)).

## Построение запроса

Пример запроса для получения данных товара:

```js
const products = await new ProductQuery()
        .alcoholByVolume.between(40, 70)
        .intersection(new ProductQuery()
            .price.greater(100, true)
            .or().tareVolume.greater(10)
            .union(new ProductQuery()
                .price.lower(5)
                .and().name.like("Водка")
            )
        ).sortOrder(new ProductSortOrder()
            .price.asc()
            .alcoholByVolume.desc()
            .tareVolume.asc()
        ).limit(1000)
        .execute();
```

## Операторы

### Операторы сравнения {#comparisonOperators}

Для построения запросов доступны следующие операторы сравнения:

* `fun equal(value: V)` – аналогичен оператору "равно" `=`.
* `fun notEqual(value: V)` – аналогичен оператору "равно" `!=`.
* `fun greater(value: V, including: Boolean = false)` – аналогичен оператору "больше" `>`.
* `fun lower(value: V, including: Boolean = false)` – аналогичен оператору "меньше" `<`.
* `fun like(text: String, useEscape: Boolean = false)` – определяет совпадает ли символьная строка с заданным шаблоном.
* `fun between(leftValue: V, rightValue: V)` – задаёт диапазон для проверки.
* `fun notBetween(leftValue: V, rightValue: V)` – задаёт диапазон, за пределами которого находится удовлетворяющий условию результат.
* `fun inside(values: List<V>)` – определяет находится ли значение в заданном списке.
* `fun inside(values: Array<V>)` – определяет находится ли значение в заданном массиве.
* `fun notInside(values: List<V>)` – определяет находится ли значение за пределами заданного списка.
* `fun notInside(values: Array<V>)` – определяет находится ли значение за пределами заданного массива.



### Логические операторы

Для построения запросов доступны следующие логические операторы:

* `and(intersection: Executor<Q, S, R>)` – логическое "И" (пересечение).
* `or(union: Executor<Q, S, R>)` – логическое "ИЛИ" (объединение).
* `and(): Q` – логическое "И".
* `or(): Q` – логическое "ИЛИ".


## Пример

Пример приложения, которое получает данные товара.
