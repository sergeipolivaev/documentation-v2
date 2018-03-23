---
title: Класс Scales
keywords: react
sidebar: evoreact
toc: true
permalink: rn_reference_devicescales.html
tags: [terminal, react]
folder: rn_reference
---

## Описание

Класс позволяет работать с весами, подключёнными к смарт-терминалу.

## Методы

### getWeight

```js
static getWeight(): Promise<Weight>
```

**Описание**

Получает вес товара, установленного на весах.

**Возвращает**

* `Promise`, результат которого - [вес товара](./rn_reference_devicescales.html#weight).

**Возможные ошибки**

* [`DeviceError`](./rn_errorshandling.html#DeviceError)

## Параметры

### Weight {#weight}

```js
export class Weight {
    constructor(weightInGrams: number, supportStable: boolean, stable: boolean) {}
}
```
