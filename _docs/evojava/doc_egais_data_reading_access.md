---
title: Получение данных из ЕГАИС
permalink: doc_egais_data_reading_access.html
sidebar: evojava
tags:
product:
---

С помощью `egais-api` ваше приложение может получать данные из ЕГАИС.

Получение необходимых данных осуществляется с помощью [запросов к базе данных смарт-терминала](./java_query_api.html).

В таблице ниже представленны классы запросов к `egais-api`, а также соответствующие им классы данных, поля которых вы можете использовать для [фильтрации выдачи запросов](./java_query_api.html#comparisonOperators).

| **Класс запроса** | **Модель данных** | **Описание** |
|-------------------|-------------------|--------------|
| [ActChargeOnShopPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/ActChargeOnShopPositionQuery.html) | [ActChargeOnShopPosition](./egais-api/ru/evotor/egais/api/model/document/actchargeonshop/ActChargeOnShopPosition.html) | Позиция в акте постановки на баланс |
| [ActChargeOnShopQuery.kt](./egais-api/ru/evotor/egais/api/query/ActChargeOnShopQuery.html) | [ActChargeOnShop](./egais-api/ru/evotor/egais/api/model/document/actchargeonshop/ActChargeOnShop.html) | Акт постановки на баланс |
| [ActWriteOffPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/ActWriteOffPositionQuery.html) | [ActWriteOffPosition](./egais-api/ru/evotor/egais/api/model/document/actwriteoff/ActWriteOffPosition.html) | Позиция в акте списания со склада |
| [ActWriteOffQuery.kt](./egais-api/ru/evotor/egais/api/query/ActWriteOffQuery.html) | [ActWriteOff](./egais-api/ru/evotor/egais/api/model/document/actwriteoff/ActWriteOff.html) | Акт списания со склада |
| [ActWriteOffShopPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/ActWriteOffShopPositionQuery.html) | [ActWriteOffShopPosition](./egais-api/ru/evotor/egais/api/model/document/actwriteoff/ActWriteOffShopPosition.html) | Позиция в акте списания из магазина |
| [ActWriteOffShopQuery.kt](./egais-api/ru/evotor/egais/api/query/ActWriteOffShopQuery.html) | [ActWriteOffShop](./egais-api/ru/evotor/egais/api/model/document/actwriteoff/ActWriteOffShop.html) | Акт списания из магазина |
| [OrgInfoQuery.kt](./egais-api/ru/evotor/egais/api/query/OrgInfoQuery.html) | [OrgInfo](./egais-api/ru/evotor/egais/api/model/dictionary/OrgInfo.html) | Информация о магазине |
| [ProductInfoQuery.kt](./egais-api/ru/evotor/egais/api/query/ProductInfoQuery.html) | [ProductInfo](./egais-api/ru/evotor/egais/api/model/dictionary/ProductInfo.html) | Информация о товаре |
| [ShopCommodityQuery.kt](./egais-api/ru/evotor/egais/api/query/ShopCommodityQuery.html) | [ShopCommodity](./egais-api/ru/evotor/egais/api/model/document/shop_commodity/ShopCommodity.html) | Остатки товара в магазине |
| [StockCommodityQuery.kt](./egais-api/ru/evotor/egais/api/query/StockCommodityQuery.html) | [StockCommodity](./egais-api/ru/evotor/egais/api/model/document/stock_commodity/StockCommodity.html) | Остатки товара на складе |
| [WayBillActPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillActPositionQuery.html) | [WayBillActPosition](./egais-api/ru/evotor/egais/api/model/document/waybillact/WayBillActPosition.html) | Позиция акта расхождения с товарно-транспортной накладной |
| [WayBillActQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillActQuery.html) | [WayBillAct](./egais-api/ru/evotor/egais/api/model/document/waybillact/WayBillAct.html) | Акт расхождения с товарно-транспортной накладной |
| [WayBillPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillPositionQuery.html) | [WayBillPosition](./egais-api/ru/evotor/egais/api/model/document/waybill/WayBillPosition.html) | Позиция в товарно-транспортной накладной (ТТН) |
| [WayBillQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillQuery.html) | [WayBill](./egais-api/ru/evotor/egais/api/model/document/waybill/WayBill.html) | Товарно-транспортные накладные |

## Пример

Пример приложения, которое получает данные ЕГАИС с помощью запросов к базе данных смарт-терминала.
