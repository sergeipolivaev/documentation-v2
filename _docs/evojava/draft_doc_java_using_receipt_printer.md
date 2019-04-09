---
title: Печать произвольных данных с помощью встроенного принтера
permalink: doc_java_using_receipt_printer.html
sidebar: evojava
product: Java SDK
published: false
---

Все модели смарт-терминалов оборудованы встроенным принтером чеков, который используется для:

* печати различных типов документов: Z-отчёта и чеков;
* печати произвольных данных (текста, изображений, штрихкодов или QR-кодов) на чековой ленте.

В зависимости от того как ваше приложение будет использовать встроенный принтер чеков, оно должно обладать необходимыми разрешениями.

## Поддерживаемы данные

На встроенном принтере можно печатать следующие данные:

* [Штрихкоды (в том числе QR-коды)](./integration-library/ru/evotor/devices/commons/printer/printable/PrintableBarcode.BarcodeType.html);
* [Изображения](./integration-library/ru/evotor/devices/commons/printer/printable/PrintableImage.html);
* [Текст](./integration-library/ru/evotor/devices/commons/printer/printable/PrintableText.html).

{% include tip.html content="При печати текста или изображений вам помогут методы [`getAllowableSymbolsLineLength()`](./integration-library/ru/evotor/devices/commons/services/PrinterService.html#getAllowableSymbolsLineLength--) (возвращает количество символов, которые помещаются в одной строке чека) и [`getAllowablePixelLineLength()`](./integration-library/ru/evotor/devices/commons/services/PrinterService.html#getAllowablePixelLineLength--) (возвращает доступную для печати ширину бумаги в пикселях)." %}

## Разрешение

Для печати произвольных данных на чековой ленте (как внутри кассового чека, так и без привязки к документу), в [манифесте приложения](./doc_java_app_manifest.html) необходимо объявить разрешение:

```xml
<uses-permission android:name="ru.evotor.permission.receipt.printExtra.SET" />
```

{% include note.html content="Для печати Z-отчётов [используется другое разрешение](./doc_java_z_report.html), а для [печати чеков коррекции](./doc_java_correction_receipt.html) указывать разрешение не надо." %}

## Печать произвольных данных на чековой ленте

Ваше приложение может печатать произвольные данные на чековой ленте без привязки к каким-либо документам.

*Чтобы печатать произвольные данные на чековой ленте:*

1. В методе обратного вызова `onCreate()` инициализируйте принтер чеков, с помощью метода [`startInitConnections(final Context appContext)`](./integration-library/ru/evotor/devices/commons/DeviceServiceConnector.html#startInitConnections--):

   ```java
   DeviceServiceConnector.startInitConnections(getApplicationContext());
   ```

   {% include note.html content="Чтобы не препятствовать вызывающему потоку, класс инициализируется асинхронно. Поэтому, если вам необходимо выполнить какой-либо код сразу после подключения принтера, вызовите метод [`addConnectionWrapper(ConnectionWrapper connectionWrapper)`](.//integration-library/ru/evotor/devices/commons/DeviceServiceConnector.html#addConnectionWrapper--), чтобы получить событие об успешном подключении." %}

2. Вызовите метод [`getPrinterService()`](./integration-library/ru/evotor/devices/commons/DeviceServiceConnector.html#getPrinterService--).
3. Напечатайте необходимые данные с помощью метода [`printDocument(int deviceId, PrinterDocument printerDocument)`](./integration-library/ru/evotor/devices/commons/services/PrinterService.html#printDocument--).

   {% include important.html content="Печать возможна только на встроенном принтере, поэтому вместо номера устройства всегда передавайте константу `ru.evotor.devices.commons.Constants.DEFAULT_DEVICE_INDEX`." %}

[Посмотрите пример операции для печати произвольных данных](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/PrintActivity.java).

## Печать произвольных данных внутри кассового чека

Ваше приложение может печатать произвольные данные внутри кассовых чеков, которые сопровождают продажу, возврат, а также покупку и возврат покупки. Вы также можете точно указать в какой части чека будут напечатаны данные.

*Чтобы печатать произвольные данные внутри кассовых чеков:*

1. Создайте службу, которая будет передавать данные для печати, например `MyPrintService`.

   Класс службы необходимо унаследовать от класса [`IntegrationService`](./)(**УТОЧНИТЬ**).

2. В манифесте приложения, в intent-фильтре службы `MyPrintService`, укажите действие, которое определяет в чеке какого типа требуется печатать переданные службой данные:

   ```xml
   <service
    android:name=".MyPrintService"
    android:enabled="false"
    android:exported="true">
    <intent-filter>
        <!-- Печать произвольных данных в чеке продажи -->
        <action android:name="evo.v2.receipt.sell.printExtra.REQUIRED" />
        <!-- Печать произвольных данных в чеке возврата -->
        <action android:name="evo.v2.receipt.payback.printExtra.REQUIRED" />
        <!-- Печать произвольных данных в чеке покупки -->
        <action android:name="evo.v2.receipt.buy.printExtra.REQUIRED" />
        <!-- Печать произвольных данных в чеке возврата покупки -->
        <action android:name="evo.v2.receipt.buyback.printExtra.REQUIRED" />
    </intent-filter>
   </service>
   ```
3. В службе, подпишите процессор [`PrintExtraRequiredEventProcessor`](./ДОБАВИТЬ JAVADOC) на событие [`PrintExtraRequiredEvent`](./ДОБАВИТЬ JAVADOC), которое указывает тип чека, где будут напечатаны данные:

   ```java
   Map<String, ActionProcessor> processorMap = new HashMap<>();
        processorMap.put(
                /**
                 * Возможные события:
                 * NAME_SELL_RECEIPT – данные будут напечатаны в чеке продажи.
                 * NAME_PAYBACK_RECEIPT – данные будут напечатаны в чеке возврата.
                 * NAME_BUY_RECEIPT – данные будут напечатаны в чеке покупки.
                 * NAME_BUYBACK_RECEIPT – данные будут напечатаны в чеке возврата покупки.
                 */
                PrintExtraRequiredEvent.NAME_SELL_RECEIPT,
                new PrintExtraRequiredEventProcessor() {
                  //Тело процессора.
                }
        );
   ```

4. Передайте в процессор массив данных для печати и реализуйте один из следующих классов пакета `ru.evotor.framework.receipt.print_extras`, которые определяют где в чеке будут напечатаны данные:

   * `PrintExtraPlacePrintGroupTop(val printGroupId: String?)` – данные печатаются после клише и до текста "Кассовый чек";
   * `PrintExtraPlacePrintGroupHeader(val printGroupId: String?)` – данные печатаются после текста "Кассовый чек", до имени пользователя;
   * `class PrintExtraPlacePrintGroupSummary(val printGroupId: String?)` – данные печатаются после итога и списка оплат, до текста "всего оплачено";
   * `class PrintExtraPlacePositionFooter(val positionUuid: String?)` – данные печатаются в позиции в чеке, до [подпозиций](./doc_java_receipt_interactions.html#Position);
   * `class PrintExtraPlacePositionAllSubpositionsFooter(val positionUuid: String?)` – данные печатаются в позиции в чеке, после всех подпозиций.

   ```java
   new PrintExtraRequiredEventProcessor() {
       @Override
       public void call(String s, PrintExtraRequiredEvent printExtraRequiredEvent, Callback callback) {
           List<SetPrintExtra> setPrintExtras = new ArrayList<SetPrintExtra>();
           setPrintExtras.add(new SetPrintExtra(
                   //Метод, который указывает место, где будут распечатаны данные.
                   new PrintExtraPlacePrintGroupTop(null),
                   //Массив данных, которые требуется распечатать.
                   new IPrintable[]{
                           new PrintableText("<Текст>"),
                           new PrintableBarcode("<Штрихкод>", PrintableBarcode.BarcodeType.CODE39),
                           new PrintableImage(BitmapFactory.decodeFile("<путь к файлу изображения>"))
                   }
           ));
         }
       };
   ```

   {% include important.html content="Наполняйте массив `IPrintable` только теми элементами, которые требуется распечатать. Например, если на чеке необходимо распечатать только штрихкод, в массив следует добавить только элемент `new PrintableBarcode(\"<Штрихкод>\", PrintableBarcode.BarcodeType.CODE39)`. Пустые элементы в массиве `IPrintable` приведут к исключению." %}

[Посмотрите пример службы для печати произвольных данных в чеке продажи](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/MyPrintService.java).

## См. также

* [Печать Z-отчёта](./doc_java_z_report.html)
* [Печать чека коррекции](./doc_java_correction_receipt.html)
