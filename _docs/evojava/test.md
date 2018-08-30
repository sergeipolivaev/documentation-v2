---
title: Комбинированная оплата
sidebar: evojava
permalink: doc_java_combined_payment.html
product: Java SDK
---

*Чтобы реализовать комбинированную оплату в своём приложении:*

1. В манифесте приложения, добавьте разрешение:

   ```xml
   <uses-permission android:name="ru.evotor.permission.COMBINED"/>
   ```

2. Создайте службу, которая будет обрабатывать комбинированные платежи. Например, `.CombinedPaymentService`.

   Служба `.CombinedPaymentService` наследуется от класса [`IntegrationService.java`](./integration-library/ru/evotor/framework/core/IntegrationService.html).

3. В манифесте приложения, в `intent-filter` службы укажите событие, которое будет её запускать:

   ```xml
   <intent-filter>
       <action android:name="evo.v2.receipt.sell.payment.COMBINED" />
   </intent-filter>
   ```

   Для обработки события используйте класс `PaymentDelegatorEventProcessor.kt`.

4. Чтобы получить данные всех приложений, которые позволяют оплачивать чек, используйте метод `getAllPaymentPerformers`, класса [`PaymentPerformerApi.kt`](./integration-library/ru/evotor/framework/component/PaymentPerformerApi.html). Метод возвращает список объектов [`PaymentPerformer.kt`](./integration-library/ru/evotor/framework/component/PaymentPerformer.html).

## Результаты

После обработки событий, служба `.CombinedPaymentService` должна возвращать соответствующий результат:

* [`PaymentDelegatorSelectedEventResult.kt`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/combined/result/PaymentDelegatorSelectedEventResult.html) – выбрана платёжная система, с помощью которой будет совершён платёж. Результат содержит объект [`PaymentPurpose`](./integration-library/ru/evotor/framework/PaymentPurpose.html)
* [`PaymentDelegatorCanceledEventResult.kt`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/combined/result/PaymentDelegatorCanceledEventResult.html) – пользователь отменил выбранный способ оплаты.
* [`PaymentDelegatorCanceledAllEventResult.kt`](./integration-library/ru/evotor/framework/core/action/event/receipt/payment/combined/result/PaymentDelegatorCanceledAllEventResult.html) – пользователь отменил все способы оплаты. В этом случае смарт-терминал последовательно отменяет все выбранные способы оплаты.
