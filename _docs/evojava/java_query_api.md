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

```java
val products = ProductQuery()
                .alcoholByVolume.between(BigDecimal(40), BigDecimal(70))
                .and(ProductQuery()
                        .price.greater(BigDecimal(100), true)
                        .or().tareVolume.greater(BigDecimal(10))
                        .or(ProductQuery()
                                .price.lower(BigDecimal(5))
                                .and().name.like("Спиртное")
                        )
                ).sortOrder(ProductQuery.SortOrder()
                        .price.asc()
                        .alcoholByVolume.desc()
                        .tareVolume.asc()
                ).limit(1000)
                .execute(context)
```

## Операторы

### Операторы сравнения {#comparisonOperators}

Для построения запросов доступны следующие операторы сравнения:

* `fun equal(value: V)` – аналогичен оператору "равно" `=`.
* `fun notEqual(value: V)` – аналогичен оператору "не равно" `!=`.
* `fun greater(value: V, including: Boolean = false)` – аналогичен оператору "больше" `>`.
* `fun lower(value: V, including: Boolean = false)` – аналогичен оператору "меньше" `<`.
* `fun like(text: String, escape: Char? = null)` – определяет совпадает ли символьная строка с заданным шаблоном. Где escape – символ, предшествующий спецсимволам, если их надо использовать в прямом из значении (например, "%"), аналогично синтаксису SQL.
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
