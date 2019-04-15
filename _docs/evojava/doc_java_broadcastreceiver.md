---
title: Использование приёмников широковещательных сообщений
permalink: doc_java_broadcastreceiver.html
sidebar: evojava
product: Java SDK
---

Смарт-терминал автоматически рассылает *широковещательные сообщения* при возникновении различных событий: открытии чека продажи, сканировании штрихкода, открытии карточки товара и др.

Чтобы ваше приложение реагировало на такие события, подпишите его на получение соответствующих широковещательных сообщений. Для этого используйте *приёмники широковещательных сообщений* (`BroadcastReceiver`).

В `integration-library` все широковещательные сообщения поделены на группы. Для каждой из групп есть свой приёмник, который содержит методы обработки соответствующих сообщений. Полный список приёмников вы [найдёте в разделе "Способы взаимодействия со смарт-терминалом"](./doc_app_integration_points.html#broadcasts).

## Подписка приложения на сообщения

*Чтобы подписать приложение на получение сообщений:*

1. Создайте приёмник, унаследованный от соответствующего класса.

   Приёмник должен переопределять методы класса.

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

2. В манифесте приложения, в intent-фильтре приёмника, укажите какие события требуется получать.

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

## См. также

* [Интеграционные компоненты](./);
* [Способы взаимодействия со смарт-терминалом](./).
