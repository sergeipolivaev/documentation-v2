---
title: Работа со сканером штрихкодов
sidebar: evojava
permalink: doc_java_barcode_scanner.html
tags:
product: Java SDK
---

*Чтобы приложение получало данные от сканера штрихкодов:*

1. В манифесте приложения добавьте разрешение на использование сканера штрихкодов:

    `<uses-permission android:name="ru.evotor.devices.SCANNER_RECEIVER" />`

2. Создайте приёмник `MyReceiver`:

   ```java
   public class MyReceiver extends ScannerBroadcastReceiver {

     @Override
     void handleBarcodeReceivedEvent(Context context, BarcodeReceivedEvent barcodeReceivedEvent) {
        //Тело метода
     }
   };
   ```

3. Подпишите приёмник на сообщение о сканировании штрихкода:

   ```xml
   <receiver
       android:name=".MyReceiver"
       android:enabled="true"
       android:exported="true">
       <intent-filter>
           <action android:name="ru.evotor.devices.ScannedCode" />
       </intent-filter>
   </receiver>
   ```

4. В операции (`Activity`) или фрагменте (`Fragment`) запускайте и останавливайте подписку `ScannerBroadcastReceiver` :

   ```java
       @Override
       protected void onPause() {
           super.onPause();
           unregisterReceiver(MyReceiver);
       }
       @Override
       protected void onResume() {
           super.onResume();
           registerReceiver(MyReceiver, ScannerBroadcastReceiver.ACTION_BARCODE_RECEIVED, ScannerBroadcastReceiver.SENDER_PERMISSION, null);
       }
   }
   ```

## Пример

Пример получения штрихкода в [демонстрационном приложении](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/InventoryApiActivity.java).
