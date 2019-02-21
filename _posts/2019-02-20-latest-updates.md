---
title: Библиотека Integration library версии 0.4.32
sidebar: evomain
permalink: st_api_0_4_32.html
summary: "Новая версия библиотеки Integration library позволит вам формировать чеки возврата на основании чеков продажи, а также получать больше кассовых данных. Пройдите по ссылке, чтобы узнать обо всех изменениях."
published: true
github_button: false
---

Основные изменения в новой версии Integration library затронули работу [чеками возврата](./st_api_0_4_32.html#changed) и с [кассовой информацией](./st_api_0_4_32.html#added). Теперь, с помощью класса [KktApi.kt](./integration-library/ru/evotor/framework/kkt/api/KktApi.html) вы можете узнавать с какой ставкой НДС и каким форматом фискальных данных работает пользователь вашего приложения. Также вы можете узнать какие типы агентов и субагентов были указаны при регистрации кассы.

{% include important.html content="Для корректной работы Integration library версии 0.4.32 необходимо, чтобы на смарт-терминале были установлены компоненты EvotorPos версии 6.24.5 и Device Service версии 2.19.15. Так как в настоящий момент нет возможности определить версии установленных компонентов, при вызове методов, будьте готовы к обработке null-значений и возникающих ошибок (используйте конструкцию `try..catch`)." %}

## Добавлено {#added}

* В класс [`KktApi.kt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html) добавлен метод [`isVatRate20Available`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#isVatRate20Available-context-). С помощью метода вы можете узнать установлено ли на смарт-терминале приложение ["Пакет обновлений"](https://market.evotor.ru/store/apps/9ddd7629-3397-47eb-a83a-1d987aa71610). Так вы сможете понять пробивает смарт-терминал фискальные документы по ставке НДС 20% или нет.
* В класс [`KktApi.kt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html) добавлен метод [`getRegisteredFfdVersion`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#getRegisteredFfdVersion-context-). Используйте метод, чтобы узнать на какую версию фискальных документов зарегистрирована касса пользователя вашего приложения.
* Добавлена поддержка [агентской схемы договорных отношений](./doc_agency_agreement.html). Теперь вы можете определить типы агентов и субагентов, указанные при регистрации кассы и [записать эти данные в чек](./doc_java_counterparties.html).

## Изменено {#changed}

* В команду печати чека возврата [`PrintPaybackReceiptCommand.kt`](./integration-library/ru/evotor/framework/core/action/command/print_receipt_command/PrintPaybackReceiptCommand.html) добавлен новый параметр `sellReceiptUuid`, с помощью которого вы сможете формировать чеки возврата на основании чеков продажи. Параметр поможет правильно определять ставку НДС, возвращаемого товара.

  {% include note.html content="Эта функциональность доступна если на смарт-терминале установлен компонент EvotorPos версии 6.24.6." %}

## Исправлено

* Исправлена ошибка, возникавшая при вызове `PrintSellReceiptCommand().process()`, в рамках смены, открытой более 24 часов назад. Теперь возвращается ошибка с корректным кодом `-2` и сообщением "Session time expired".
