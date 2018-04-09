---
title: Чтение данных из ЕГАИС
permalink: doc_egais_data_reading_access.html
sidebar: evojava
tags:
product:
---

С помощью `egais-api` ваше приложение может получать данные из ЕГАИС.

ЕГАИС предоставляет доступ к следующим данным:

* Информация о товаре;
* Информация о магазине;
* Остатки товара на складе;
* Остатки товара в магазине;
* Акты приёмки товара в магазин;
* Акты списания товара из магазина;
* Товарно-транспортные накладные;
* waybill act (?)ю

Поля, по которым можно выполнять фильтрацию, описаны в [справочнике](./egais-api/index.html).

## Построение запроса

Пример запроса для поиска информации об организации:

```java

```

## Операторы

### Операторы сравнения

Для построения запросов доступны следующие операторы сравнения:

* `fun equal(value: V): Executor<Q, S, R>` –
* `fun notEqual(value: V): Executor<Q, S, R>` –
* `fun greater(value: V, including: Boolean = false): Executor<Q, S, R>` –
* `fun lower(value: V, including: Boolean = false): Executor<Q, S, R>` –
* `fun like(text: String, useEscape: Boolean = false): Executor<Q, S, R>` –
* `fun between(leftValue: V, rightValue: V): Executor<Q, S, R>` –
* `fun notBetween(leftValue: V, rightValue: V): Executor<Q, S, R>` –
* `fun inside(values: List<V>): Executor<Q, S, R>` –
* `fun inside(values: Array<V>): Executor<Q, S, R>` –
* `fun notInside(values: List<V>): Executor<Q, S, R>` –
* `fun notInside(values: Array<V>): Executor<Q, S, R>` –



### Логические операторы

Для построения запросов доступны следующие логические операторы:

* `and(intersection: Executor<Q, S, R>): Executor<Q, S, R>` –
* `or(union: Executor<Q, S, R>): Executor<Q, S, R>` –
* `and(): Q` –
* `or(): Q` –


## Пример

Пример приложения, которое использует egais-api
