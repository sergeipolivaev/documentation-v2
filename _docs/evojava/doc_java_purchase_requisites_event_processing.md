---
title: Обработка события добавления данных клиента в чек
permalink: doc_java_purchase_requisites_event_processing.html
sidebar: evojava
product: Java SDK
published: false
---

Цель: дать возможность определённым бизнесам (страховым агенствам, букмекерским конторам и т.п.) добавлять в чек (весь чек, а не только позицию) наименование клиента (тег 1227, может быть выражено в виде ФИО) и ИНН клиента (тег 1228)

Данные покупателя могут быть добавлены в чеки следующих типов:

* Продажи
* Возврата
* Покупки
* Возврата покупки

## Разрешение на обработку события добавления в чек печатных групп с данными клиента

Для обработки события добавления в чек печатных групп с данными клиента, в манифесте приложения необходимо указать следующее разрешение:

```xml
<uses-permission android:name="ru.evotor.permission.SELL_INTEGRATION_SERVICE" />
```

## Получение события

Создайте службу, которая будет обрабатывать событие, например, `BarcodeEventHandlerService`.

В манифесте приложения, в разделе службы, укажите разрешение, а в intent-фильтре службы, укажите событие сканирования чека:

```xml
<service
    android:name=".BarcodeEventHandlerService"
    android:enabled="true"
    android:exported="true"
    android:permission="ru.evotor.permission.SELL_INTEGRATION_SERVICE">
    <!-- служба использует объявленное разрешение -->
    <intent-filter>
        <!-- событие сканирования штрихкода -->
        <action android:name="ru.evotor.event.sell.BARCODE_RECEIVED" />
        <category android:name="android.intent.category.EVOTOR" />
    </intent-filter>
</service>
```

## Обработка события
