---
title: Получение данных из ЕГАИС
permalink: doc_egais_data_reading_access.html
sidebar: evojava
tags:
product:
---

С помощью `egais-api` ваше приложение может получать данные из ЕГАИС.


| Класс запроса | Модель данных | Описание |
|---------------|---------------|----------|
| ActChargeOnShopPositionQuery.kt | ActChargeOnShopPosition ||
| ActChargeOnShopQuery.kt | ActChargeOnShop ||
| ActWriteOffPositionQuery.kt | ActWriteOffPosition ||
| ActWriteOffQuery.kt | ActWriteOff ||
| ActWriteOffShopPositionQuery.kt | ActWriteOffShopPosition ||
| ActWriteOffShopQuery.kt | ActWriteOffShop ||
| OrgInfoQuery.kt | OrgInfo | Информация о магазине |
| ProductInfoQuery.kt | ProductInfo | Информация о товаре |
| ShopCommodityQuery.kt | ShopCommodity | Остатки товара в магазине |
| StockCommodityQuery.kt | StockCommodity | Остатки товара на складе |
| WayBillActPositionQuery.kt | WayBillActPosition ||
| WayBillActQuery.kt | WayBillAct ||
| WayBillPositionQuery.kt | WayBillPosition | Позиция в товарно-транспортной накладной (ТТН) |
| WayBillQuery.kt | WayBill | Товарно-транспортные накладные |

* Информация о товаре;
* Информация о магазине;
* Остатки товара на складе;
* Остатки товара в магазине;
* Акты приёмки товара в магазин;
* Акты списания товара из магазина;
* Товарно-транспортные накладные;
* waybill act (?).

Поля, по которым можно выполнять фильтрацию, описаны в [справочнике](./egais-api/index.html).
