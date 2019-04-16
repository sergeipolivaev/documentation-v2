---
title: Способы взаимодействия со смарт-терминалом
keywords:
sidebar: evojava
permalink: draft_doc_app_integration_points.html
product: Java SDK
---

Для взаимодействия со смарт-терминалом, ваши приложения могут:

* обрабатывать события смарт-терминала, которые содержат данные о различных действиях пользователя и других приложений.
* отдавать устройству команды на выполнение определённых действий.
* обрабатывать широковещательные сообщения, о различных событиях на смарт-терминале: открытии карточки товара, открытии чека продажи и других.

В этом разделе вы найдёте обзор всех трёх способов, с помощью которых интеграционные приложения взаимодействуют со смарт-терминалом.

## События {#events}

С помощью событий смарт-терминал сообщает установленным интеграционным приложениям о различных действиях пользователя и других приложений: изменении позиций в чеке, разделении платежей, начислении скидок на чек и других.


Схема ниже показывает процесс распространения события в смарт-терминале.

{% include image.html file="EventSequenceDiagram.png" url="images/EventSequenceDiagram.png" caption="Жизненный цикл события, которое распространяет смарт-терминал." %}

{% include note.html content="Первое приложение, которое получает событие, смарт-терминал выбирает случайным образом." %}
{% include important.html content="Когда ваше приложение реагирует на изменения, сделанные другими приложениями, возможно возникновение бесконечного цикла обработки события. Чтобы избежать этого, приложения должны проверять необходимость добавления собственных изменений после изменений, сделанных другими приложениями." %}

После оповещения приложения, смарт-терминал ожидает результата обработки события. Для обработки событий требуется использовать соответствующие им процессоры. Например, для обработки события начисления скидки на чек, используйте процессор [`ReceiptDiscountEventProcessor`](./integration-library/ru/evotor/framework/core/action/event/receipt/discount/ReceiptDiscountEventProcessor.html).

Для получения события, в элементе `<action>` intent-фильтра соответствующей интеграционной службы вашего приложения требуется указать значение выбранной константы события.

Например, служба, которая обрабатывает событие начисления скидки на чек продажи, в манифесте приложения будет выглядеть так:

```xml
<service
  android:name=".MyDiscountService"
  android:enabled="true"
  android:exported="true">
  <intent-filter>
    <action android:name="evo.v2.receipt.sell.receiptDiscount"/>
  </intent-filter>
</service>
```


Смарт-терминал распространяет следующие события:

* Намерение изменить позицию чека: [`BeforePositionsEditedEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.html). О том как обрабатывать событие, [читайте в разделе "Работа с позициями чека"](./doc_java_receipt_interactions.html).
* Разделение платежей в чеке продажи: [`PaymentSelectedEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/PaymentSelectedEvent.html). О том как обрабатывать событие, [читайте в разделе "Разделение чека"](./doc_java_receipt_division.html).
* Начисление скидки на чек: [`ReceiptDiscountEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/discount/ReceiptDiscountEvent.html). О том как обрабатывать событие, [читайте в разделе "Начисление скидок"](./doc_java_discounts.html).
* Разделение чека на печатные группы: [`PrintGroupRequiredEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/print_group/PrintGroupRequiredEvent.html). О том как обрабатывать событие, [читайте в разделе "Разделение чека"](./doc_java_receipt_division.html).
* Объединение позиций чека: [`PositionsMergeEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/merges/PositionsMergeEvent.html).
* Передача оплаты чека продажи другому приложению (например, при выборе приложения "Комбооплата"): [`PaymentDelegatorEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/combined/event/PaymentDelegatorEvent.html). О том как обрабатывать событие, [читайте в разделе "Комбинированная оплата"](./doc_java_combined_payment.html).
* Печать в чеке произвольных данных: [`PrintExtraRequiredEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/print_extra/PrintExtraRequiredEvent.html). О том как обрабатывать событие, [читайте в разделе "Печать внутри кассового чека"](./doc_java_receipt_print.html).
* Оплата различных чеков сторонними платёжными системами (в intent-фильтре указывайте значение константы родительского события [`PaymentSystemEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/system/event/PaymentSystemEvent.html)):

   * Оплата чека продажи: [`PaymentSystemSellEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/system/event/PaymentSystemSellEvent.html).
   * Отмена оплаты чека продажи: [`PaymentSystemSellCancelEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/system/event/PaymentSystemSellCancelEvent.html).
   * Оплата чека возврата: [`PaymentSystemPaybackEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/system/event/PaymentSystemPaybackEvent.html).
   * Отмена оплаты чека возврата: [`PaymentSystemPaybackCancelEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/system/event/PaymentSystemPaybackCancelEvent.html).

   О том как обрабатывать события, [читайте в разделе "Использование различных способов оплаты"](./doc_java_payment_systems.html).

## Команды {#commands}

Ваше приложение может отдавать смарт-терминалу команды, например, открыть чек или напечатать Z-отчёт. После обработки команды устройство возвращает соответствующий результат.

{% include note.html content="Для использования некоторых команд, в манифесте приложения, в элементе `<uses-permission />` необходимо указать соответствующее [разрешение](./doc_java_app_manifest.html#permissions)." %}

Команды вызываются в коде операции или службы, например, так:

```java
//Команда открытия чека продажи и вызов метода process.
new OpenSellReceiptCommand(positionAddList, extra).process(context, callback);
```

Ваше приложение может отдавать смарт-терминалу следующие команды:

* Открыть чек:

   * Продажи: [`OpenSellReceiptCommand`](./integration-library/ru/evotor/framework/core/action/command/open_receipt_command/OpenSellReceiptCommand.html)
   * Возврата: [`OpenPaybackReceiptCommand`](./integration-library/ru/evotor/framework/core/action/command/open_receipt_command/OpenPaybackReceiptCommand.html)
   * Покупки: [`OpenBuyReceiptCommand`](./integration-library/ru/evotor/framework/core/action/command/open_receipt_command/OpenBuyReceiptCommand.html)
   * Возврата покупки: [`OpenBuybackReceiptCommand`](./integration-library/ru/evotor/framework/core/action/command/open_receipt_command/OpenBuybackReceiptCommand.html)

* Напечатать чек:

   * Продажи: [`PrintSellReceiptCommand`](./integration-library/ru/evotor/framework/core/action/command/print_receipt_command/PrintSellReceiptCommand.html)
   * Возврата: [`PrintPaybackReceiptCommand`](./integration-library/ru/evotor/framework/core/action/command/print_receipt_command/PrintPaybackReceiptCommand.html)

   {% include note.html content="Команды печати чеков продажи и возврата также используются для [отправки чеков по СМС и электронной почте](./doc_java_online_store_receipt.html)." %}

   * Покупки: [`PrintBuyReceiptCommand`](./integration-library/ru/evotor/framework/core/action/command/print_receipt_command/PrintBuyReceiptCommand.html)
   * Возврата покупки: [`PrintBuybackReceiptCommand`](./integration-library/ru/evotor/framework/core/action/command/print_receipt_command/PrintBuybackReceiptCommand.html)


* Снять и напечатать Z-отчёт: [`PrintZReportCommand`](./integration-library/ru/evotor/framework/core/action/command/print_z_report_command/PrintZReportCommand.html). Подробнее о снятии и печати Z-отчёта [читайте в разделе "Печать Z-отчёта."](./doc_java_z_report.html)

## Широковещательные сообщения {#broadcasts}

Смарт-терминал автоматически рассылает *широковещательные сообщения* при возникновении различных событий: открытии чека продажи, сканировании штрихкода, открытии карточки товара и других.

В отличие от [событий](./draft_doc_app_integration_points.html#events) смарт-терминал не ожидает обработки широковещательных сообщений.

Чтобы ваше приложение реагировало на такие события, подпишите его на получение соответствующих сообщений. Для этого используйте *приёмники широковещательных сообщений* (`BroadcastReceiver`).

О том, как подписывать приёмники на сообщения [читайте в разделе "Использование приёмников широковещательных сообщений"](./doc_java_broadcastreceiver.html).

В `integration-library` все широковещательные сообщения поделены на группы. Для каждой из групп есть свой приёмник, который содержит методы обработки соответствующих сообщений. Всего таких приёмников восемь:

* [**SellReceiptBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/SellReceiptBroadcastReceiver.html) – приёмник событий, связанных с чеком продажи.
* [**PaybackReceiptBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/PaybackReceiptBroadcastReceiver.html) – приёмник событий, связанных с чеком возврата.
* [**BuyReceiptBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/BuyReceiptBroadcastReceiver.html) – приёмник событий, связанных с чеком покупки.
* [**BuybackReceiptBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/BuybackReceiptBroadcastReceiver.html) – приёмник событий, связанных с чеком возврата покупки.
* [**InventoryBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/InventoryBroadcastReceiver.html) – приёмник событий, связанных с товароучётом.
* [**CashDrawerBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/CashDrawerBroadcastReceiver.html) – приёмник событий, связанных с денежным ящиком.
* [**KktBroadcastReceiver**](./integration-library/ru/evotor/framework/kkt/event/handler/receiver/KktBroadcastReceiver.html) – приёмник событий, связанных с денежными операциями.
* [**ScannerBroadcastReceiver**](./integration-library/ru/evotor/framework/core/action/broadcast/ScannerBroadcastReceiver.html) – приёмник событий, связанных со сканером штрихкодов.

  Подробнее о работе со сканером штрихкодов [читайте в разделе "Работа со сканером штрихкодов"](./doc_java_barcode_scanner.html).


## См. также

<!-- TODO * [Интеграционные компоненты](./); -->
* [Использование приёмников широковещательных сообщений](./doc_java_broadcastreceiver.html).
