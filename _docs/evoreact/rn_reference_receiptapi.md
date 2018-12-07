---
title: Класс ReceiptAPI
keywords: react
sidebar: evoreact
toc: true
permalink: rn_reference_receiptapi.html
product: React Native
---

## Описание

С помощью методов класса приложения получают данные чеков и передают их для обработки в смарт-терминал.

## Методы

### getPositionsByBarcode

```js
static getPositionsByBarcode(barcode: string): Promise<Position[]>
```

**Описание**

Получает массив позиций чека по значению штрихкода.

**Параметры**

* `barcode`– штрихкод товара.

**Возвращает**

* `Promise`, результат которого – массив [позиций](./rn_reference_receiptapi.html#position).

### openSellReceipt

```js
static openSellReceipt(positions?: Position[] | null, extra?: SetExtra): Promise<OpenReceiptCommandResult>
```

**Описание**

Формирует чек продажи из полученных данных. Вы можете передать чек на оплату с помощью [метода NavigationAPI](./rn_reference_navigationapi.html#createIntentForSellReceiptPayment)

**Параметры**

* `positions` – массив [позиций](./rn_reference_receiptapi.html#position).
* `extra` – указывает наличие [дополнительных полей](./rn_reference_receiptapi.html#setextra) в чеке.

**Возвращает**

* `Promise`

### openPaybackReceipt

```js
static openPaybackReceipt(positions?: Position[] | null, extra?: SetExtra): Promise<OpenReceiptCommandResult>
```

**Описание**

Формирует чек возврата из полученных данных. Вы можете передать чек на оплату с помощью [метода NavigationAPI](./rn_reference_navigationapi.html#createIntentForPaybackReceiptPayment)

**Параметры**

* `positions` – массив [позиций](./rn_reference_receiptapi.html#position).
* `extra` – указывает наличие [дополнительных полей](./rn_reference_receiptapi.html#setextra) в чеке.

**Возвращает**

* `Promise`

### sendElectronReceipt

```js
static sendElectronReceipt(printReceipts: PrintReceipt[],
                           extra: SetExtra | null,
                           phone: string | null,
                           email: string | null,
                           discount?: number): Promise<SendElectronReceiptCommandResult>
```

**Описание**

Формирует чек из полученных данных и отправляет его на электронную почту и/или телефон.

**Параметры**

* `printReceipts` – массив [печатных форм чека](./rn_reference_receiptapi.html#printreceipt).
* `extra` – [дополнительные поля](./rn_reference_receiptapi.html#setextra) в чеке.
* `phone` – телефонный номер покупателя.
* `email` – адрес электронной почты покупателя.
* `discount` – скидка на чек.

**Возвращает**

* `Promise`, результат которого – строка.

### getReceiptByType

```js
static getReceiptByType(type: ReceiptType): Promise<Receipt | null>
```

**Описание**

Получает чек по типу: чек продажи (`SELL`) или чек возврата (`PAYBACK`).

**Параметры**

* `type` – [тип чека](./rn_reference_receiptapi.html#receipttype).

**Возвращает**

* `Promise`, результат которого – [чек](./rn_reference_receiptapi.html#receipt) или `null`.

### getReceiptByUuid

```js
static getReceiptByUuid(uuid: string): Promise<Receipt | null>
```

**Описание**

Получает чек по идентификатору (`uuid`).

**Параметры**

* `uuid` – идентификатор чека.

**Возвращает**

* `Promise`, результат которого – [чек](./rn_reference_receiptapi.html#receipt) или `null`.

### getReceiptHeaders

```js
static getReceiptHeaders(type?: ReceiptType): Promise<ReceiptHeader[] | null>
```

**Описание**

Получает заголовки чека.

**Параметры**

* `type` – тип чека: чек продажи (`SELL`) или чек возврата (`PAYBACK`).

**Возвращает**

* `Promise`, результат которого –  массив [заголовков чека](./rn_reference_receiptapi.html#receiptheader).

## Параметры

### Класс PositionAdd

```js
export class PositionAdd extends AbstractBundlable {
    constructor(position: Position) {}
}
```

**См. также**

* [`Position`](./rn_reference_receiptapi.html#position)


### Класс PositionEdit

```js
export class PositionEdit extends AbstractBundlable {
    constructor(position: Position) {}
}
```

**См. также**

* [`Position`](./rn_reference_receiptapi.html#position)

### Класс PositionRemove

```js
export class PositionRemove extends AbstractBundlable {
    constructor(positionUuid: string) {}
}
```

### Класс SetExtra {#setextra}

```js
export class SetExtra extends AbstractBundlable {
    constructor(extra: Object) {}
}
```

### Класс SetPrintGroup {#SetPrintGroup}

```js
export class SetPrintGroup extends AbstractBundlable {
    constructor(printGroup: PrintGroup | null,
                paymentPurposeIds: string[],
                positionUuids: string[]) {}
}
```

**См. также**

* [`PrintGroup`](./rn_reference_receiptapi.html#PrintGroup)

### Класс SetPrintExtra {#SetPrintExtra}

```js
export class SetPrintExtra extends AbstractBundlable {
    constructor(printExtraPlace: PrintExtraPlace,
                printables: Printable[]) {}
}
```

**См. также**

* [`Printable`](./rn_reference_devicesprinter.html#printable)

### Тип PrintExtraPlace

```js
export type PrintExtraPlace =
    PrintExtraPlacePrintGroupTop |
    PrintExtraPlacePrintGroupHeader |
    PrintExtraPlacePrintGroupSummary |
    PrintExtraPlacePositionFooter |
    PrintExtraPlacePositionAllSubpositionsFooter;
```

### Класс PrintExtraPlacePrintGroupTop

```js
export class PrintExtraPlacePrintGroupTop {
    constructor(printGroupId?: string) {}
}
```

### Класс PrintExtraPlacePrintGroupHeader

```js
export class PrintExtraPlacePrintGroupHeader {
    constructor(printGroupId?: string) {}
}
```

### Класс PrintExtraPlacePrintGroupSummary

```js
export class PrintExtraPlacePrintGroupSummary {
    constructor(printGroupId?: string) {}
}
```

### Класс PrintExtraPlacePositionFooter

```js
export class PrintExtraPlacePositionFooter {
    constructor(positionUuid?: string) {}
}
```

### Класс PrintExtraPlacePositionAllSubpositionsFooter

```js
export class PrintExtraPlacePositionAllSubpositionsFooter {
    constructor(positionUuid?: string) {}
}
```

### Класс ExtraKey {#ExtraKey}

```js
export class ExtraKey {
    constructor(identity: string | null, appId: string | null, description: string | null) {}
}
```

### Класс Position {#position}

```js
export class Position {
    constructor(uuid: string | null,
                productUuid: string | null,
                productCode: string | null,
                productType: ProductType,
                name: string,
                measureName: string,
                measurePrecision: number,
                taxNumber: TaxNumber | null,
                price: number,
                priceWithDiscountPosition: number,
                quantity: number,
                barcode: string | null,
                mark: string | null,
                alcoholByVolume: number | null,
                alcoholProductKindCode: number | null,
                tareVolume: number | null,
                extraKeys: ExtraKey[],
                subPositions: Position[]) {}
}
```

**См. также**

* [`ProductType`](./rn_reference_inventoryapi.html#ProductType)
* [`TaxNumber`](./rn_reference_receiptapi.html#TaxNumber)
* [`ExtraKey`](./rn_reference_receiptapi.html#ExtraKey)

### Класс ReceiptHeader {#receiptheader}

```js
export class ReceiptHeader {
    constructor(uuid: string,
                number: string | null,
                type: ReceiptType,
                date: string | null,
                clientEmail: string | null,
                clientPhone: string | null,
                extra: string | null) {}
}
```

**См. также**

* [`ReceiptType`](./rn_reference_receiptapi.html#receipttype)

### Класс PrintGroup {#PrintGroup}

```js
export class PrintGroup {
    constructor(identifier: string | null,
                type: PrintGroupType | null,
                orgName: string | null,
                orgInn: string | null,
                orgAddress: string | null,
                taxationSystem: TaxationSystem | null,
                shouldPrintReceipt: boolean) {}
}
```

**См. также**

* [`PrintGroupType`](./rn_reference_receiptapi.html#PrintGroupType)
* [`TaxationSystem`](./rn_reference_receiptapi.html#TaxationSystem)

### Класс Payment {#payment}

```js
export class Payment {
    constructor(uuid: string,
                value: number,
                system: PaymentSystem | null,
                purposeIdentifier: string | null,
                accountId: string | null,
                accountUserDescription: string | null) {}
}
```

**См. также**

* [`PaymentSystem`](./rn_reference_receiptapi.html#PaymentSystem)

### Класс PrintReceipt {#printreceipt}

```js
export class PrintReceipt {
    constructor(printGroup: PrintGroup | null,
                positions: Position[],
                payments: Map<Payment, number>,
                changes: Map<Payment, number>) {}
}
```

**См. также**

* [`PrintGroup`](./rn_reference_receiptapi.html#PrintGroup)
* [`Position`](./rn_reference_receiptapi.html#position)

### Класс Receipt {#receipt}

```js
export class Receipt {

    constructor(header: ReceiptHeader,
                printDocuments: PrintReceipt[]) {}
}
```

**См. также**

* [`ReceiptHeader`](./rn_reference_receiptapi.html#receiptheader)
* [`PrintReceipt`](./rn_reference_receiptapi.html#printreceipt)

#### Методы

##### getPositions

```js
getPositions(): Position[]
```

**Описание**

Получает позиции добавленные в чек.

**Возвращает**

* Массив [позиций](./rn_reference_receiptapi.html#position).

##### getPayments
```js
getPayments(): Payment[]
```

**Описание**

Получает платежи, с помощью которых оплачен чек.

**Возвращает**

* Массив [платежей](./rn_reference_receiptapi.html#payment)

### Класс PaymentPurpose {#PaymentPurpose}

```js
export class PaymentPurpose {
    constructor(identifier: string | null,
                paymentSystemId: string | null,
                total: number,
                accountId: string | null,
                userMessage: string | null) {}
}
```

### Класс PaymentSystem {#PaymentSystem}

```js
export class PaymentSystem {
    constructor(paymentType: PaymentType, userDescription: string, paymentSystemId: string) {}
}
```

**См. также**

* [`PaymentType`](./rn_reference_receiptapi.html#PaymentType)

### Перечисление ReceiptType {#receipttype}

```js
export enum ReceiptType {
    SELL = "SELL",
    PAYBACK = "PAYBACK"
}
```

### Перечисление TaxNumber {#TaxNumber}

```js
export enum TaxNumber {
    VAT_18 = "VAT_18",
    VAT_10 = "VAT_10",
    NO_VAT = "NO_VAT",
    VAT_18_118 = "VAT_18_118",
    VAT_10_110 = "VAT_10_110",
    VAT_0 = "VAT_0"
}
```

### Перечисление TaxationSystem {#TaxationSystem}

```js
export enum TaxationSystem {
    COMMON = "COMMON",
    SIMPLIFIED_INCOME = "SIMPLIFIED_INCOME",
    SIMPLIFIELD_INCOME_OUTCOME = "SIMPLIFIELD_INCOME_OUTCOME",
    SINGLE_IMPUTED_INCOME = "SINGLE_IMPUTED_INCOME",
    SINGLE_AGRICULTURE = "SINGLE_AGRICULTURE",
    PATENT = "PATENT"
}
```

### Перечисление PrintGroupType {#PrintGroupType}

```js
export enum PrintGroupType {
    CASH_RECEIPT = "CASH_RECEIPT",
    INVOICE = "INVOICE",
    string_UTII = "string_UTII"
}
```

### Перечисление PaymentType {#PaymentType}

```js
export enum PaymentType {
    UNKNOWN = "UNKNOWN",
    CASH = "CASH",
    ELECTRON = "ELECTRON"
}
```

### Перечисление PaymentSystemOperationType {#PaymentSystemOperationType}

```js
export enum PaymentSystemOperationType {
    SELL = "SELL",
    SELL_CANCEL = "SELL_CANCEL",
    PAYBACK = "PAYBACK",
    PAYBACK_CANCEL = "PAYBACK_CANCEL"
}
```
