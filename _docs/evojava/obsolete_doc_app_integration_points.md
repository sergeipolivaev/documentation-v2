---
published: false
title: Точки интеграции
keywords:
sidebar: evojava
permalink: doc_app_integration_points.html
product: Java SDK
---

*Точки интеграции* необходимы для взаимодействия приложения и смарт-терминала. Точки интеграции представляют собой события, которые распространяет смарт-терминал и [команды](./doc_app_integration_points.html#Commands), которые может передавать приложение. В ответ на события смарт-терминал [может ожидать](./doc_app_integration_points.html#Callbacks) (в этом случае на событие требуется подписать службу) или [не ожидать ответа](./doc_app_integration_points.html#Events) от приложения (на такие события требуется подписывать приёмники широковещательных сообщений). События, требующие ответа, похожи на команды, но передаёт их терминал.

{% include note.html content="О том, что представляют из себя службы и приёмники сообщений вы можете [узнать в документации для Android ОС](https://developer.android.com/guide/index.html)." %}

Схема ниже показывает процесс обмена событием, которое требует ответа. Первое приложение, которое получает событие, смарт-терминал выбирает случайным образом.

{% include image.html file="EventSequenceDiagram.png" url="images/EventSequenceDiagram.png" caption="Обмен событиями, которые требуют ответа" %}

## Подготовка манифеста приложения
В зависимости от типа точки интеграции, вам потребуется соответствующим образом изменить [манифест приложения](./doc_java_app_manifest.html). Так, если вы используете службы или приёмники сообщений, вам необходимо объявить их в манифесте приложения.

{% include note.html content="Если ваше приложение передаёт в смарт-терминал команды, манифест изменять не требуется." %}

### Объявление службы в манифесте приложения

```xml
<service
            android:name=".YourService"
            android:enabled="true"
            android:exported="true">
            <intent-filter>
                <category android:name="android.intent.category.DEFAULT" />
                <action android:name="<Событие, которое требуют ответа>" />
            </intent-filter>
        </service>
```

### Объявление приёмника широковещательных сообщений в манифесте приложения

```xml
<receiver
 android:name=".YourBroadcastReceiver"
 android:enabled="true"
 android:exported="true">
    <intent-filter>
        <action android:name="<Событие, которое не требует ответа>" />
        <category android:name="android.intent.category.DEFAULT" />
    </intent-filter>
</receiver>
```

## Список точек интеграции

Ниже приведены таблицы с описанием всех точек интеграции приложения и смарт-терминала.

### Команды приложения {#Commands}

Пример объявленной команды:

```java
new OpenSellReceiptCommand(positionAddList, extra).process(context, callback);
```

<table>
<tr>
<td>Команда открытия чека продажи</td>
<td>evo.v2.receipt.sell.openReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/command/open_receipt_command/OpenSellReceiptCommand.java">OpenSellReceiptCommand</a></td>
<td>new OpenSellReceiptCommand(positionAddList, extra).process(context, callback);</td>
</tr>

<tr>
<td>Команда открытия чека возврата проданного товара</td>
<td>evo.v2.receipt.payback.openReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/command/open_receipt_command/OpenPaybackReceiptCommand.java">OpenPaybackReceiptCommand </a></td>
<td>new OpenPaybackReceiptCommand(positionAddList, extra).process(context, callback);</td>
</tr>

<tr>
<td>Команда открытия чека покупки</td>
<td>evo.v2.receipt.buy.openReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/command/open_receipt_command/OpenBuyReceiptCommand.java">OpenBuyReceiptCommand</a></td>
<td>new OpenBuyReceiptCommand(positionAddList, extra).process(context, callback);</td>
</tr>

<tr>
<td>Команда открытия чека возврата купленного товара</td>
<td>evo.v2.receipt.buyback.openReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/command/open_receipt_command/OpenPaybackReceiptCommand.java">OpenBuybackReceiptCommand </a></td>
<td>new OpenBuybackReceiptCommand(positionAddList, extra).process(context, callback);</td>
</tr>

<tr>
<td>Команда печати чека продажи</td>
<td>evo.v2.receipt.sell.printReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/command/print_receipt_command/PrintSellReceiptCommand.kt">PrintSellReceiptCommand</a></td>
<td>PrintSellReceiptCommand command = new PrintSellReceiptCommand(positionsList, payments, clientPhone, clientEmail);</td>
</tr>

<tr>
<td>Команда печати чека возврата</td>
<td>evo.v2.receipt.payback.printReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/command/print_receipt_command/PrintPaybackReceiptCommand.kt">PrintPaybackReceiptCommand</a></td>
<td></td>
</tr>

<tr>
<td>Команда печати Z-отчёта</td>
<td>evo.v2.receipt.payback.printReceipt</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/command/print_z_report_command/PrintZReportCommand.kt">PrintZReportCommand</a></td>
<td>new PrintZReportCommand().process(context, callback);</td>
</tr>
</table>

### События, которые не требуют ответа {#Events}

На события, которые не требуют ответа, следует подписывать приёмники широковещательных сообщений.

Подробнее о приёмниках и событиях вы можете почитать [здесь](./doc_java_broadcastreceiver.html).

### События, которые требуют ответа {#Callbacks}

На события, которые требуют ответа, следует подписывать службы (плагины в JS-приложении).

<table>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_combined_payment.html">Выбор комбинированной оплаты</a></td>
<td>evo.v2.receipt.sell.payment.combined</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/payment/combined/event/PaymentDelegatorEvent.kt">PaymentDelegatorEvent.kt</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_interactions.html">Намерение изменить позицию в чеке продажи</a></td>
<td>evo.v2.receipt.sell.beforePositionsEdited</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.java">BeforePositionsEditedEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_interactions.html">Намерение изменить позицию в чеке возврата проданного товара</a></td>
<td>evo.v2.receipt.payback.beforePositionsEdited</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.java">BeforePositionsEditedEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_interactions.html">Намерение изменить позицию в чеке покупки</a></td>
<td>evo.v2.receipt.buy.beforePositionsEdited</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.java">BeforePositionsEditedEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_interactions.html">Намерение изменить позицию в чеке возврата купленного товара</a></td>
<td>evo.v2.receipt.buyback.beforePositionsEdited</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.java">BeforePositionsEditedEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_division.html">Разделение платежей в чеке продажи</a></td>
<td>evo.v2.receipt.sell.payment.SELECTED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/payment/PaymentSelectedEvent.java">PaymentSelectedEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_receipt_division.html">Разделение чека продажи на несколько печатных групп</a></td>
<td>evo.v2.receipt.sell.printGroup.REQUIRED</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/print_group/PrintGroupRequiredEvent.java">PrintGroupRequiredEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_discounts.html">Начисление скидки на чек продажи</a></td>
<td>evo.v2.receipt.sell.receiptDiscount</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/discount/ReceiptDiscountEvent.java">ReceiptDiscountEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_discounts.html">Начисление скидки на чек возврата</a></td>
<td>evo.v2.receipt.payback.receiptDiscount</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/discount/ReceiptDiscountEvent.java">ReceiptDiscountEvent.java</a></td>
</tr>
<tr>
<td><a href="https://developer.evotor.ru/docs/doc_java_payment_systems.html">Оплата в сторонней платёжной системе</a></td>
<td>evo.v2.receipt.paymentSystem</td>
<td><a href="https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/core/action/event/receipt/payment/system/event/PaymentSystemEvent.kt">PaymentSystemEvent.kt</a></td>
</tr>
</table>
