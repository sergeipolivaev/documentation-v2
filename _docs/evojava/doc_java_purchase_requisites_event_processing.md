---
title: Добавление реквизитов покупателя в чек
permalink: doc_java_purchase_requisites_event_processing.html
sidebar: evojava
product: Java SDK
published: false
---

Согласно ФФД версии 1.05 и выше, при расчёте между организациями и (или) индивидуальными предпринимателями, в чеке необходимо указывать *реквизиты покупателя*: название организации (или ФИО индивидуального предпринимателя) и ИНН (или номер паспорта). Эти данные могут понадобиться, например, при продаже страховых договоров.

Реквизиты покупателя хранятся в поле [`Purchaser`](./integration-library/ru/evotor/framework/receipt/Purchaser.html), печатной группы чека и могут быть добавлены в чеки продажи, возврата, покупки и возврата покупки.

Чтобы добавить реквизиты покупателя в чек, приложение должно обработать событие [`ReturnPurchaserRequisitesForPrintGroupRequestedEvent`](./integration-library/ru/evotor/framework/receipt/formation/event/ReturnPurchaserRequisitesForPrintGroupRequestedEvent.html), с помощью которого смарт-терминал запрашивает реквизиты покупателя.

{% include important.html content="Пользователь cможет указывать реквизиты покупателя только после покупки и установки приложения [\"Пакет обновлений \"](https://market.evotor.ru/store/apps/9ddd7629-3397-47eb-a83a-1d987aa71610). Используйте метод [`isPurchaserActive()`](./integration-library/ru/evotor/framework/features/FeaturesApi.html#isPurchaserActive-context-) чтобы убедиться, что у пользователя активна функция добавления реквизитов покупателя." %}

## Разрешение на обработку события добавления реквизитов покупателя

Событие `ReturnPurchaserRequisitesForPrintGroupRequestedEvent` может обрабатываться различными службами, в зависимости от того, в какой чек ваше приложение будет добавлять реквизиты покупателя:

* [`SellIntegrationService`](./integration-library/ru/evotor/framework/receipt/formation/event/handler/service/SellIntegrationService.html) позволяет добавить реквизиты покупателя в чек продажи;
* [`PaybackIntegrationService`](./integration-library/ru/evotor/framework/receipt/formation/event/handler/service/PaybackIntegrationService.html) позволяет добавить реквизиты покупателя в чек возврата;
* [`BuyIntegrationService`](./integration-library/ru/evotor/framework/receipt/formation/event/handler/service/BuyIntegrationService.html) позволяет добавить реквизиты покупателя в чек покупки;
* [`BuybackIntegrationService`](./integration-library/ru/evotor/framework/receipt/formation/event/handler/service/BuybackIntegrationService.html) позволяет добавить реквизиты покупателя в чек возврата покупки.

Для использования любой из этих служб, в манифесте приложения необходимо указать соответствующее разрешение:

```xml
<!-- Разрешение на использование службы для работы с чеком продажи  -->
<uses-permission android:name="ru.evotor.permission.SELL_INTEGRATION_SERVICE" />
<!-- Разрешение на использование службы для работы с чеком возврата  -->
<uses-permission android:name="ru.evotor.permission.PAYBACK_INTEGRATION_SERVICE" />
<!-- Разрешение на использование службы для работы с чеком покупки  -->
<uses-permission android:name="ru.evotor.permission.BUY_INTEGRATION_SERVICE" />
<!-- Разрешение на использование службы для работы с чеком возврата покупки  -->
<uses-permission android:name="ru.evotor.permission.BUYBACK_INTEGRATION_SERVICE" />
```

## Получение события

Создайте службу, которая будет обрабатывать событие, например, `PurchaserSellService`.

{% include note.html content="В примере рассматривается добавление реквизитов в чек продажи. Для добавления реквизитов в чеки других типов, используйте соответствующие службы." %}

В манифесте приложения, в разделе службы, укажите соответствующее разрешение, а в intent-фильтре службы, укажите событие:

```xml
<service
    android:name=".PurchaserSellService"
    android:enabled="true"
    android:exported="true"
    android:permission="ru.evotor.permission.SELL_INTEGRATION_SERVICE">
    <!-- служба использует необходимое разрешение -->
    <intent-filter>
        <!-- событие добавления реквизитов -->
        <action android:name="ru.evotor.event.sell.PURCHASER_REQUISITES"/>
        <category android:name="android.intent.category.DEFAULT"/>
    </intent-filter>
</service>
```

## Обработка события

{% include tip.html content="Перед обработкой события, убедитесь, что у пользователя [активна функция добавления реквизитов покупателя](./integration-library/ru/evotor/framework/features/FeaturesApi.html#isPurchaserActive-context-)." %} 

Смарт-терминал рассылает запрашивает реквизиты покупателя перед формированием чека (при завершении оплаты).

Чтобы добавить реквизиты покупателя в чек:

1. Унаследуйте службу `PurchaserSellService` от класса [`SellIntegrationService`](./integration-library/ru/evotor/framework/receipt/formation/event/handler/service/SellIntegrationService.html).
2. Переопределите метод [`handleEvent()`](./integration-library/ru/evotor/framework/receipt/formation/event/handler/service/SellIntegrationService.html#handleEvent-event-) и передайте в него запрос на добавление реквизитов, полученный от смарт-терминала [`ReturnPurchaserRequisitesForPrintGroupRequestedEvent`](./integration-library/ru/evotor/framework/receipt/framework/receipt/formation/event/handler/service/SellIntegrationService.html#handleEvent-event-).

   Ваше приложение должно предоставить пользователю возможность указать реквизиты покупателя. Для этого вам может понадобиться вызвать соответствующее окно приложения, например, [по нажатию кнопки на экране оплаты](./doc_java_app_icon.html#SalesScreen). В открывшемся окне, пользователь укажет необходимые данные, которые надо будет вернуть в результате.

3. Верните результат [`ReturnPurchaserRequisitesForPrintGroupRequestedEvent.Result()`](./integration-library/ru/evotor/framework/receipt/formation/event/ReturnPurchaserRequisitesForPrintGroupRequestedEvent.Result.html).

## Пример

```java
class PurchaserSellService : SellIntegrationService() {

    override fun handleEvent(event: ReturnPurchaserRequisitesForPrintGroupRequestedEvent)
            : ReturnPurchaserRequisitesForPrintGroupRequestedEvent.Result? {
        return handleEvent(event, this)
    }

    /**
     * Обрабатвыаем событие и получаем реквизиты покупателя из контекста приложения.
     */
    fun handleEvent(event: ReturnPurchaserRequisitesForPrintGroupRequestedEvent, context: Context)
            : ReturnPurchaserRequisitesForPrintGroupRequestedEvent.Result? {
        //Массив печатных групп и соответствующих им объектов с реквизитами покупателя.
        val map = mutableMapOf<PrintGroup?, Purchaser?>()
        //Реквизиты покупателя, которые пользователь указал в MainActivity.
        val currentPurchaser = getCurrentPurchaser(event.receiptUuid, context)

        //Наполняем массив.
        event.printGroups.forEach { printGroup -> currentPurchaser?.let { map[printGroup] = it } }

        return ReturnPurchaserRequisitesForPrintGroupRequestedEvent.Result(map)
    }

    private fun getCurrentPurchaser(receiptUuid: String, context: Context): Purchaser? {
        val purchaserName: String?
        val purchaserDocumentNumber: String?
        val oldReceiptUuid: String?

        /**
         * Из SharedPreferences, получаем реквизиты покупателя, которые пользователь указал в MainActivity.
         */
        PreferenceManager.getDefaultSharedPreferences(context).run {
            purchaserName = getString(MainActivity.TAG_1227_NAME, null)
            purchaserDocumentNumber = getString(MainActivity.TAG_1228_INN, null)
            oldReceiptUuid = getString(MainActivity.PURCHASER_UUID, null)
        }

        return if (purchaserName != null && purchaserDocumentNumber != null && oldReceiptUuid == receiptUuid) {
            Purchaser(purchaserName, purchaserDocumentNumber, PurchaserType.NATURAL_PERSON)
        } else null
    }

}
```