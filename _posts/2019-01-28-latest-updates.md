---
title: Январь
sidebar: evomain
permalink: january_updates.html
published: false
github_button: false
---


Добавлено:

* В класс [`KktApi.kt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html) добавлен новый метод – `isVatRate20Available`. С помощью метода вы можете узнать установлено ли на смарт-терминале приложение ["Пакет обновлений"](https://market.evotor.ru/store/apps/9ddd7629-3397-47eb-a83a-1d987aa71610). Так вы сможете понять пробивает смарт-терминал фискальные документы по ставке НДС 20% или нет.

Изменено:

* В команду печати чека возврата [`PrintPaybackReceiptCommand.kt`](./integration-library/ru/evotor/framework/core/action/command/print_receipt_command/PrintPaybackReceiptCommand.html) добавлен новый параметр `sellReceiptUuid`, с помощью которого вы сможете формировать чеки возврата на основании чеков продажи. Параметр поможет правильно определять ставку НДС, возвращаемого товара.
