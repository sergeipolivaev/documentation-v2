---
title: Печать внутри кассового чека
permalink: doc_java_receipt_print.html
sidebar: evojava
product: Java SDK
---

Ваше приложение может печатать произвольные данные внутри кассовых чеков, которые сопровождают продажу, возврат, а также покупку и возврат покупки. Вы также можете точно указать в какой части чека будут напечатаны данные.

{% include note.html content="Список поддерживаемых данных представлен в разделе [\"Работа с принтером чеков\"](./doc_java_bill_printer.html#supporteddatatypes)." %}

## Разрешение

Для печати произвольных данных внутри кассового чека, в [манифесте приложения](./doc_java_app_manifest.html) необходимо объявить разрешение:

```xml
<uses-permission android:name="ru.evotor.permission.receipt.printExtra.SET" />
```

{% include note.html content="Такое же разрешение необходимо для [печати произвольных данных на чековой ленте](./doc_java_bill_printer.html). Для печати Z-отчётов [используется другое разрешение](./doc_java_z_report.html), а для [печати чеков коррекции](./doc_java_correction_receipt.html) указывать разрешение не надо." %}

## Печать произвольных данных внутри кассового чека

*Чтобы печатать произвольные данные внутри кассовых чеков:*

1. Создайте службу, производную от [`IntegrationService`](./integration-library/ru/evotor/framework/core/IntegrationService.html), которая будет передавать данные для печати, например `MyPrintService`.

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
3. В службе `MyPrintService`, подпишите процессор [`PrintExtraRequiredEventProcessor`](./integration-library/ru/evotor/framework/core/action/event/receipt/print_extra/PrintExtraRequiredEventProcessor.html) на событие [`PrintExtraRequiredEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/print_extra/PrintExtraRequiredEvent.html), которое указывает тип чека, в котором будут напечатаны данные:

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

4. Передайте в процессор массив данных для печати и реализуйте один из классов пакета [`ru.evotor.framework.receipt.print_extras`](./integration-library/ru/evotor/framework/receipt/print_extras/package-summary.html), которые определяют где в чеке будут напечатаны данные:

   ```java
   new PrintExtraRequiredEventProcessor() {
       @Override
       public void call(String s, PrintExtraRequiredEvent printExtraRequiredEvent, Callback callback) {
           List<SetPrintExtra> setPrintExtras = new ArrayList<SetPrintExtra>();
           setPrintExtras.add(new SetPrintExtra(
                   /**
                    * Класс, который указывает место, где будут распечатаны данные.
                    * В данном случае данные будут распечатаны сверху от чека: после клише, до текста "Кассовый чек".
                    */
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

## См. также {#seealso}

* [Печать внутри кассового чека](./doc_java_receipt_print.html);
* [Печать Z-отчёта](./doc_java_z_report.html);
* [Печать чека коррекции](./doc_java_correction_receipt.html).
