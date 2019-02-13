---
title: Поддержка ФФД 1.05
sidebar: evomain
permalink: new_ffd_support.html
published: true
github_button: false
---

Чтобы поддержать новый формат фискальных документов (ФФД 1.05), были сделаны следующие изменения:

* Обновлены способы оплаты:

  * Класс [PaymentType](./integration-library/ru/evotor/framework/payment/PaymentType.html) в Java SDK.
  * Значения поля `payments.payment.type` в документах:
    - [Продажи товара](./rest_sell.html);
    - [Возврата товара продавцу](./rest_payback.html);
    - [Выкупа (товара у клиента)](./rest_buy.html);
    - [Обратного выкупа (товара клиентом)](./rest_buyback.html).

* В позициях чека реализована детализация способов расчётов.

  * Класс [SettlementMethod](./integration-library/ru/evotor/framework/receipt/position/SettlementMethod.html) в Java SDK.
  * Значения поля `positions.position.payment_feature` в документах:
    - [Продажи товара](./rest_sell.html);
    - [Возврата товара продавцу](./rest_payback.html);
    - [Выкупа (товара у клиента)](./rest_buy.html);
    - [Обратного выкупа (товара клиентом)](./rest_buyback.html).

Используйте метод `getRegisteredFfdVersion` класса [`KktApi.kt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html), чтобы узнать на какую версию фискальных документов зарегистрирована касса пользователя вашего приложения.
