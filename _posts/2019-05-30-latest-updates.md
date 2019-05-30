---
title: Май
sidebar: evomain
permalink: april_updates.html
summary: "Добавлена возможность оплачивать чеки из интерфейса приложения. Добавлены команды печати чеков покупки и возврата покупки. Полный список изменений в новости."
published: true
github_button: false
---

## Добавлено {#added}

* Добавлен новый интерфейс [SellApi.kt](./integration-library/ru/evotor/framework/receipt/formation/api/SellApi.html), с помощью которого приложения могут запускать оплату текущего открытого чека продажи. Подробнее читайте в разделе ["Оплата чеков из интерфейса приложения"](./doc_java_in_app_receipt_payment.html).
* Добавлены команды печати чеков [покупки](./integration-library/ru/evotor/framework/core/action/command/print_receipt_command/PrintBuyReceiptCommand.html) и [возврата покупки](./integration-library/ru/evotor/framework/core/action/command/print_receipt_command/PrintBuybackReceiptCommand.html). С помощью этих команд вы также можете [передавать чеки по электронной почте и смс](./doc_java_online_store_receipt.html).
* Добавлено [широковещательное событие применения скидки к чеку](./integration-library/ru/evotor/framework/receipt/event/ApplyDiscountToReceiptEvent.html). Обрабатывайте событие с помощью метода `handleApplyDiscountToReceiptEvent()` классов [`SellReceiptBroadcastReceiver`](./integration-library/ru/evotor/framework/core/action/broadcast/SellReceiptBroadcastReceiver.html), [`PaybackReceiptBroadcastReceiver`](./integration-library/ru/evotor/framework/core/action/broadcast/PaybackReceiptBroadcastReceiver.html), [`BuyReceiptBroadcastReceiver`](./integration-library/ru/evotor/framework/core/action/broadcast/BuyReceiptBroadcastReceiver.html) и [`BuybackReceiptBroadcastReceiver`](./integration-library/ru/evotor/framework/core/action/broadcast/BuybackReceiptBroadcastReceiver.html).

## Изменено {#changed}

* В перечисление [доступных типов штрихкодов](./integration-library/ru/evotor/devices/commons/printer/printable/PrintableBarcode.BarcodeType.html) добавлен QR-код.
* Переписаны разделы посвящённые [работе с принтером чеков](./doc_java_bill_printer.html) и [печати внутри кассового чека](./doc_java_receipt_print.html). В частности, добавлен [список классов данных](doc_java_bill_printer.html#supporteddatatypes), которые можно напечатать.
