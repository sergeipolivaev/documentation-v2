---
title: Работа с принтером чеков
permalink: doc_java_bill_printer.html
sidebar: evojava
product: Java SDK
---

Все модели смарт-терминалов оборудованы встроенным принтером чеков, который используется для:

* печати различных типов документов: [Z-отчёта и чеков](./doc_java_bill_printer.html#seealso);
* печати произвольных данных (текста, изображений, штрихкодов или QR-кодов) на чековой ленте.

В зависимости от того как ваше приложение будет использовать встроенный принтер чеков, оно должно обладать необходимыми разрешениями.

## Поддерживаемы данные {#supporteddatatypes}

На встроенном принтере можно печатать следующие данные:

* [Штрихкоды (в том числе QR-коды)](./integration-library/ru/evotor/devices/commons/printer/printable/PrintableBarcode.BarcodeType.html);
* [Изображения](./integration-library/ru/evotor/devices/commons/printer/printable/PrintableImage.html);
* [Текст](./integration-library/ru/evotor/devices/commons/printer/printable/PrintableText.html).

{% include tip.html content="При печати текста или изображений вам помогут методы [`getAllowableSymbolsLineLength()`](./integration-library/ru/evotor/devices/commons/services/PrinterService.html#getAllowableSymbolsLineLength--) (возвращает количество символов, которые помещаются в одной строке чека) и [`getAllowablePixelLineLength()`](./integration-library/ru/evotor/devices/commons/services/PrinterService.html#getAllowablePixelLineLength--) (возвращает доступную для печати ширину бумаги в пикселях)." %}

## Разрешение

Для печати произвольных данных на чековой ленте, в [манифесте приложения](./doc_java_app_manifest.html) необходимо объявить разрешение:

```xml
<uses-permission android:name="ru.evotor.permission.receipt.printExtra.SET" />
```

{% include note.html content="Такое же разрешение необходимо для [печати произвольных данных внутри кассового чека](./doc_java_receipt_print.html). Для печати Z-отчётов [используется другое разрешение](./doc_java_z_report.html), а для [печати чеков коррекции](./doc_java_correction_receipt.html) указывать разрешение не надо." %}

## Печать произвольных данных на чековой ленте

*Чтобы печатать произвольные данные на чековой ленте:*

1. В методе обратного вызова `onCreate()` инициализируйте принтер чеков, с помощью метода [`startInitConnections(final Context appContext)`](./integration-library/ru/evotor/devices/commons/DeviceServiceConnector.html#startInitConnections--):

   ```java
   DeviceServiceConnector.startInitConnections(getApplicationContext());
   ```

   {% include note.html content="Чтобы не препятствовать вызывающему потоку, класс инициализируется асинхронно. Поэтому, если вам необходимо выполнить какой-либо код сразу после подключения принтера, вызовите метод [`addConnectionWrapper(ConnectionWrapper connectionWrapper)`](.//integration-library/ru/evotor/devices/commons/DeviceServiceConnector.html#addConnectionWrapper--), чтобы получить событие об успешном подключении." %}

2. Вызовите метод [`getPrinterService()`](./integration-library/ru/evotor/devices/commons/DeviceServiceConnector.html#getPrinterService--).
3. Напечатайте необходимые данные с помощью метода [`printDocument(int deviceId, PrinterDocument printerDocument)`](./integration-library/ru/evotor/devices/commons/services/PrinterService.html#printDocument--).

   {% include important.html content="Печать возможна только на встроенном принтере, поэтому вместо номера устройства всегда передавайте константу `ru.evotor.devices.commons.Constants.DEFAULT_DEVICE_INDEX`." %}

{% include important.html content="Вызов методов из главного потока приложения вернёт исключение `DeviceServiceOperationOnMainThreadException`, так как работа с удалённой службой может занимать длительное время." %}

[Посмотрите пример операции для печати произвольных данных](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/PrintActivity.java).

## См. также {#seealso}

* [Печать внутри кассового чека](./doc_java_receipt_print.html);
* [Печать Z-отчёта](./doc_java_z_report.html);
* [Печать чека коррекции](./doc_java_correction_receipt.html).
