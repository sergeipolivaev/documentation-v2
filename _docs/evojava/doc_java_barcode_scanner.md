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

2. Объявите класс `BarcodeBroadcastReceiver`:

   ```java
   BarcodeBroadcastReceiver mBarcodeBroadcastReceiver = new BarcodeBroadcastReceiver() {

       @Override
       public void onBarcodeReceived(String barcode, Context context) {
           // Переменная barcode содержит считанный штрихкод.
       }
   };
   ```

3. В операции (`Activity`) или фрагменте (`Fragment`) запускайте и останавливайте подписку `BarcodeBroadcastReceiver` :

   ```java
       @Override
       protected void onPause() {
           super.onPause();
           unregisterReceiver(mBarcodeBroadcastReceiver);
       }
       @Override
       protected void onResume() {
           super.onResume();
           registerReceiver(mBarcodeBroadcastReceiver, BarcodeBroadcastReceiver.BARCODE_INTENT_FILTER, BarcodeBroadcastReceiver.SENDER_PERMISSION, null);
       }
   }
   ```

## Пример

Пример получения штрихкода в [демонстрационном приложении](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/InventoryApiActivity.java).
