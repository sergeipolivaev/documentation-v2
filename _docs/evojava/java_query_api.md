---
title: Продажа алкоголя. Работа с ЕГАИС
permalink: java_query_api.html
sidebar: evomain
tags:
product:
---

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

Пример приложения, которое использует egais-api.
