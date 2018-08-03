---
title: Интеграционные службы
keywords: react
sidebar: evoreact
toc: true
permalink: rn_reference_integrationapi.html
product: React Native
---

## Описание

С помощью интеграционных служб вы можете подписываться на события при формировании чека и вносить свои изменения.

{% include note.html content="Информацию о регистрации интеграционных служб смотрите в разделе [Инициализация служб](./rn_reference_seviceapi.html)." %}

Изменения вносятся с помощью методов класса `IntegrationCallback`, экземпляр которого передаётся в каждый слушатель интеграционной службы.

## Методы класса IntegrationCallback

### onResult

```js
onResult(result: IntegrationServiceEventResult): Promise<void>
```

**Описание**

Устанавливает результат события интеграционной службы.

**Параметры**

* `result` – [результат события интеграционной службы](./rn_reference_integrationapi.html#IntegrationServiceEventResult).

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./rn_errorshandling.html#integrationerror)

### startActivity

```js
startActivity(intent: Intent): Promise<void>
```

**Описание**

Запускает интеграционную операцию.

**Параметры**

* `intent`

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./rn_errorshandling.html#integrationerror)

### skip

```js
skip(): Promise<void>
```

**Описание**

Завершает событие интеграционной службы без применения результата.

**Возвращает**

* `Promise`

**Возможные ошибки**

* [`IntegrationError`](./rn_errorshandling.html#integrationerror)

## Параметры

### Тип IntegrationServiceEventResult {#IntegrationServiceEventResult}

```js
export type IntegrationServiceEventResult =
    BeforePositionsEditedEventResult |
    ReceiptDiscountEventResult |
    PaymentSelectedEventResult |
    PrintGroupRequiredEventResult |
    PrintExtraRequiredEventResult;
```

### Класс BeforePositionsEditedEventResult

```js
export class BeforePositionsEditedEventResult {
    constructor(changes: PositionChange[] | null, extra: SetExtra | null) {}
}
```

**См. также**

* [`PositionChange`](./rn_reference_integrationapi.html#PositionChange)

### Класс ReceiptDiscountEventResult

```js
export class ReceiptDiscountEventResult {
    constructor(discount: number, extra: SetExtra | null, changes: PositionChange[]) {}
}
```

**См. также**

* [`SetExtra`](./rn_reference_receiptapi.html#setextra)
* [`PositionChange`](./rn_reference_integrationapi.html#PositionChange)

### Класс PaymentSelectedEventResult

```js
export class PaymentSelectedEventResult {
    constructor(extra: SetExtra | null, paymentParts: PaymentPurpose[]) {}
}
```

**См. также**

* [`SetExtra`](./rn_reference_receiptapi.html#setextra)
* [`PaymentPurpose`](./rn_reference_receiptapi.html#PaymentPurpose)


### Класс PrintGroupRequiredEventResult

```js
export class PrintGroupRequiredEventResult {
    constructor(extra: SetExtra | null, setPrintGroups: SetPrintGroup[]) {}
}
```

**См. также**

* [`SetExtra`](./rn_reference_receiptapi.html#setextra)
* [`SetPrintGroup`](./rn_reference_receiptapi.html#SetPrintGroup)

### Класс PrintExtraRequiredEventResult

```js
export class PrintExtraRequiredEventResult {
    constructor(extra: SetPrintExtra[]) {}
}
```

**См. также**

* [`SetPrintExtra`](./rn_reference_receiptapi.html#SetPrintExtra)

### Тип PositionChange {#PositionChange}

```js
export type PositionChange = PositionAdd | PositionEdit | PositionRemove
```
