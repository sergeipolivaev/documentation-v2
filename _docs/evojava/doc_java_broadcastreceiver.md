---
title: Использование приёмников широковещательных сообщений
permalink: doc_java_broadcastreceiver.html
sidebar: evojava
product: Java SDK
---

Смарт-терминал автоматически рассылает *широковещательные сообщения* при возникновении различных событий: открытии чека продажи, сканировании штрихкода, открытии карточки товара и др.

Чтобы ваше приложение реагировало на такие события, подпишите его на получение соответствующих широковещательных сообщений. Для этого используйте *приёмники широковещательных сообщений* (`BroadcastReceiver`).

В `integration-library` все широковещательные сообщения поделены на группы. Для каждой из групп есть свой приёмник, который содержит методы обработки соответствующих сообщений. Всего таких приёмников восемь:

* [**SellReceiptBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/SellReceiptBroadcastReceiver.html) – приёмник событий, связанных с чеком продажи.

   Приёмник содержит методы для обработки следующих сообщений:

   * `evotor.intent.action.receipt.sell.OPENED` – открытие чека.
   * `evotor.intent.action.receipt.sell.POSITION_ADDED` – добавление позиции в чек.
   * `evotor.intent.action.receipt.sell.POSITION_EDITED` – редактирование позиции чека.
   * `evotor.intent.action.receipt.sell.POSITION_REMOVED` – удаление позиции из чека.
   * `evotor.intent.action.receipt.sell.CLEARED` – очистка всего чека.
   * `evotor.intent.action.receipt.sell.RECEIPT_CLOSED` – закрытие чека.

* [**PaybackReceiptBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/PaybackReceiptBroadcastReceiver.html) – приёмник событий, связанных с чеком возврата.

   Приёмник содержит методы для обработки следующих сообщений:

   * `evotor.intent.action.receipt.payback.OPENED` – открытие чека.
   * `evotor.intent.action.receipt.payback.POSITION_ADDED` – добавление позиции в чек.
   * `evotor.intent.action.receipt.payback.POSITION_EDITED` – редактирование позиции чека.
   * `evotor.intent.action.receipt.payback.POSITION_REMOVED` – удаление позиции из чека.
   * `evotor.intent.action.receipt.payback.CLEARED` – очистка всего чека.
   * `evotor.intent.action.receipt.payback.RECEIPT_CLOSED` – закрытие чека.

* [**BuyReceiptBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/BuyReceiptBroadcastReceiver.html) – приёмник событий, связанных с чеком покупки.

   Приёмник содержит методы для обработки следующих сообщений:

   * `evotor.intent.action.receipt.buy.OPENED` – открытие чека.
   * `evotor.intent.action.receipt.buy.POSITION_ADDED` – добавление позиции в чек.
   * `evotor.intent.action.receipt.buy.POSITION_EDITED` – редактирование позиции чека.
   * `evotor.intent.action.receipt.buy.POSITION_REMOVED` – удаление позиции из чека.
   * `evotor.intent.action.receipt.buy.CLEARED` – очистка всего чека.
   * `evotor.intent.action.receipt.buy.RECEIPT_CLOSED` – закрытие чека.

* [**BuybackReceiptBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/BuybackReceiptBroadcastReceiver.html) – приёмник событий, связанных с чеком возврата покупки.

   Приёмник содержит методы для обработки следующих сообщений:

   * `evotor.intent.action.receipt.buyback.OPENED` – открытие чека.
   * `evotor.intent.action.receipt.buyback.POSITION_ADDED` – добавление позиции в чек.
   * `evotor.intent.action.receipt.buyback.POSITION_EDITED` – редактирование позиции чека.
   * `evotor.intent.action.receipt.buyback.POSITION_REMOVED` – удаление позиции из чека.
   * `evotor.intent.action.receipt.buyback.CLEARED` – очистка всего чека.
   * `evotor.intent.action.receipt.buyback.RECEIPT_CLOSED` – закрытие чека.

* [**InventoryBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/InventoryBroadcastReceiver.html) – приёмник событий, связанных с товароучётом.

   Приёмник содержит методы для обработки следующих сообщений:

   * `evotor.intent.action.inventory.CARD_OPEN` – открытие карточки товара.

* [**CashDrawerBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/CashDrawerBroadcastReceiver.html) – приёмник событий, связанных с денежным ящиком.

   Приёмник содержит методы для обработки следующих сообщений:

   * `evotor.intent.action.cashDrawer.OPEN` – открытие денежного ящика.

* [**KktBroadcastReceiver**](./integration-library/ru/evotor/framework/kkt/event/handler/receiver/KktBroadcastReceiver.html) – приёмник событий, связанных с денежными операциями.

   Приёмник содержит методы для обработки следующих сообщений:

   * `evotor.intent.action.cashOperation.CASH_IN` – внесение наличных.
   * `evotor.intent.action.cashOperation.CASH_OUT` – изъятие наличных.

* [**ScannerBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/ScannerBroadcastReceiver.html) – приёмник событий, связанных со сканером штрихкодов.

   Приёмник содержит методы для обработки следующих сообщений:

   * `ru.evotor.devices.ScannedCode` – получение отсканированного штрихкода.

  Подробнее о работе со сканером штрихкодов читайте [здесь](./doc_java_barcode_scanner.html).

## Подписка приложения на сообщения

*Чтобы подписать приложение на получение сообщений:*

1. Создайте приёмник, унаследованный от соответствующего класса.

   Приёмник должен переопределять методы класса.

2. В манифесте приложения, в intent-фильтре приёмника, укажите какие события требуется получать.

<!-- ### Приёмники и сообщения

Приёмник `SellReceiptBroadcastReceiver` содержит методы для обработки следующих сообщений чека продажи:

* `evotor.intent.action.receipt.sell.OPENED` – открытие чека.
* `evotor.intent.action.receipt.sell.POSITION_ADDED` – добавление позиции в чек.
* `evotor.intent.action.receipt.sell.POSITION_EDITED` – редактирование позиции чека.
* `evotor.intent.action.receipt.sell.POSITION_REMOVED` – удаление позиции из чека.
* `evotor.intent.action.receipt.sell.CLEARED` – очистка всего чека.
* `evotor.intent.action.receipt.sell.CLOSED` – закрытие чека.

Приёмник `PaybackReceiptBroadcastReceiver` содержит методы для обработки следующих сообщений чека возврата:

* `evotor.intent.action.receipt.payback.OPENED` – открытие чека.
* `evotor.intent.action.receipt.payback.POSITION_ADDED` – добавление позиции в чек.
* `evotor.intent.action.receipt.payback.POSITION_EDITED` – редактирование позиции чека.
* `evotor.intent.action.receipt.payback.POSITION_REMOVED` – удаление позиции из чека.
* `evotor.intent.action.receipt.payback.CLEARED` – очистка всего чека.
* `evotor.intent.action.receipt.payback.CLOSED` – закрытие чека.

Приёмник `BuyReceiptBroadcastReceiver` содержит методы для обработки следующих сообщений чека покупки:

* `evotor.intent.action.receipt.buy.OPENED` – открытие чека.
* `evotor.intent.action.receipt.buy.POSITION_ADDED` – добавление позиции в чек.
* `evotor.intent.action.receipt.buy.POSITION_EDITED` – редактирование позиции чека.
* `evotor.intent.action.receipt.buy.POSITION_REMOVED` – удаление позиции из чека.
* `evotor.intent.action.receipt.buy.CLEARED` – очистка всего чека.
* `evotor.intent.action.receipt.buy.CLOSED` – закрытие чека.

Приёмник `BuybackReceiptBroadcastReceiver` содержит методы для обработки следующих сообщений чека возврата покупки:

* `evotor.intent.action.receipt.buyback.OPENED` – открытие чека.
* `evotor.intent.action.receipt.buyback.POSITION_ADDED` – добавление позиции в чек.
* `evotor.intent.action.receipt.buyback.POSITION_EDITED` – редактирование позиции чека.
* `evotor.intent.action.receipt.buyback.POSITION_REMOVED` – удаление позиции из чека.
* `evotor.intent.action.receipt.buyback.CLEARED` – очистка всего чека.
* `evotor.intent.action.receipt.buyback.CLOSED` – закрытие чека.

Приёмник `CashDrawerBroadcastReceiver` содержит методы для обработки следующих сообщений денежного ящика:

* `evotor.intent.action.cashDrawer.OPEN` – открытие денежного ящика.

Приёмник `CashOperationBroadcastReceiver` содержит методы для обработки следующих сообщений о денежных операциях:

* `evotor.intent.action.cashOperation.CASH_IN` – внесение наличных.
* `evotor.intent.action.cashOperation.CASH_OUT` – изъятие наличных.

Приёмник `InventoryBroadcastReceiver` содержит методы для обработки следующих сообщений товароучёта:

* `evotor.intent.action.inventory.CARD_OPEN` – открытие карточки товара.

Приёмник `ScannerBroadcastReceiver` содержит методы для обработки следующих сообщений сканера штрихкодов:

* `ru.evotor.devices.ScannedCode` – получение отсканированного штрихкода. -->

## Пример

Приёмник `MyReceiver`, обрабатывающий сообщения об открытии и закрытии чека покупки:

```java
public class MyReceiver extends BuyReceiptBroadcastReceiver {

    @Override
    void  handleReceiptOpenedEvent(Context context, ReceiptOpenedEvent receiptOpenedEvent) {
      //Тело метода.
    };

    @Override
    void  handleReceiptClosedEvent(Context context, ReceiptClosedEvent receiptClosedEvent) {
      //Тело метода.
    };
};
```

Приёмник `MyReceiver` в манифесте приложения:

```xml
<receiver
    android:name=".MyReceiver"
    android:enabled="true"
    android:exported="true">
    <intent-filter>
        <action android:name="evotor.intent.action.receipt.buy.OPENED" />
        <action android:name="evotor.intent.action.receipt.buy.CLOSED" />
    </intent-filter>
</receiver>
```
