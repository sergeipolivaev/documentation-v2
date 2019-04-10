---
title: Апрель
sidebar: evomain
permalink: april_updates.html
summary: "Добавлена возможность оплачивать чеки из интерфейса приложения. Так же, к списку типов штрихкодов добавлен QR-код."
published: true
github_button: false
---

## Добавлено {#added}

* Добавлен новый интерфейс [SellApi.kt](./integration-library/ru/evotor/framework/receipt/formation/api/SellApi.html), с помощью которого приложения могут запускать оплату текущего открытого чека продажи. Подробнее читайте в разделе ["Оплата чеков из интерфейса приложения"](./doc_java_in_app_receipt_payment.html).

## Изменено {#changed}

* В перечисление [доступных типов штрихкодов](./integration-library/ru/evotor/devices/commons/printer/printable/PrintableBarcode.BarcodeType.html) добавлен QR-код.
* Переписаны разделы посвящённые [работе с принтером чеков](./doc_java_bill_printer.html) и [печати внутри кассового чека](./doc_java_receipt_print.html). В частности, добавлен [список классов данных](doc_java_bill_printer.html#supporteddatatypes), которые можно напечатать.
