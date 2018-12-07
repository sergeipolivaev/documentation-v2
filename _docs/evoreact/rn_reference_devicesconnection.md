---
title: Класс DeviceServiceConnector
keywords: react
sidebar: evoreact
toc: true
permalink: rn_reference_devicesconnection.html
product: React Native
---

## Описание

Класс подключает устройства (принтер чеков и весы) к смарт-терминалу.

## Методы

### startInitConnections

```js
static startInitConnections(): void
```

**Описание**

Инициализирует подключение устройств.


### addEventListener

```js
static addEventListener(type: DeviceConnectionEventType, listener: DeviceConnectionEventListener, isGlobal: boolean = true): void
```

**Описание**

Регистрирует слушатель и [подписывает приложение на события](./rn_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`DeviceConnectionEventType`](./rn_reference_devicesconnection.html#DeviceConnectionEventType).
* `listener` – слушатель типа [`DeviceConnectionEventListener`](./rn_reference_devicesconnection.html#DeviceConnectionEventListener).
* `isGlobal` – [глобальная доступность слушателя](./rn_interactiontypes.html#eventsubscription).

### removeEventListener

```js
static removeEventListener(type: DeviceConnectionEventType, listener?: DeviceConnectionEventListener): boolean
```

**Описание**

Удаляет слушатель и отменяет [подписку на события](./rn_interactiontypes.html#eventsubscription).

**Параметры**

* `type` – событие типа [`DeviceConnectionEventType`](./rn_reference_devicesconnection.html#DeviceConnectionEventType).
* `listener` – слушатель типа [`DeviceConnectionEventListener`](./rn_reference_devicesconnection.html#DeviceConnectionEventListener). Не передавайте параметр, если хотите удалить все слушатели.

**Возвращает**

* `true` – если слушатель удалён.
* `false` – если слушатель не удалён.

## Параметры

### Перечисление DeviceConnectionEventType {#DeviceConnectionEventType}

```js
export enum DeviceConnectionEventType {
    PRINTER_CONNECTION_CHANGED = "PRINTER_CONNECTION_CHANGED",
    SCALES_CONNECTION_CHANGED = "SCALES_CONNECTION_CHANGED"
}
```

### Тип DeviceConnectionEventListener {#DeviceConnectionEventListener}

```js
export type DeviceConnectionEventListener = (connected: boolean) => void;
```
