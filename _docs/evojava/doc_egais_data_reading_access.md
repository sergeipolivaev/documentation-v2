---
title: Получение данных из ЕГАИС
permalink: doc_egais_data_reading_access.html
sidebar: evojava
tags:
product: Java SDK
---

С помощью `egais-api` ваше приложение может получать данные из ЕГАИС.

Получение необходимых данных осуществляется с помощью [запросов к базе данных смарт-терминала](./java_query_api.html).

В таблице ниже представленны классы запросов к `egais-api`, а также соответствующие им классы данных, поля которых вы можете использовать для [фильтрации выдачи запросов](./java_query_api.html#comparisonOperators).

| **Класс запроса** | **Класс данных**  | **Описание** |
|-------------------|-------------------|--------------|
| [ActChargeOnShopPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/ActChargeOnShopPositionQuery.html) | [ActChargeOnShopPosition](./egais-api/ru/evotor/egais/api/model/document/actchargeonshop/ActChargeOnShopPosition.html) | Позиция в акте постановки на баланс |
| [ActChargeOnShopQuery.kt](./egais-api/ru/evotor/egais/api/query/ActChargeOnShopQuery.html) | [ActChargeOnShop](./egais-api/ru/evotor/egais/api/model/document/actchargeonshop/ActChargeOnShop.html) | Акт постановки на баланс в торговый зал|
| [ActWriteOffPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/ActWriteOffPositionQuery.html) | [ActWriteOffPosition](./egais-api/ru/evotor/egais/api/model/document/actwriteoff/ActWriteOffPosition.html) | Позиция в акте списания со склада |
| [ActWriteOffQuery.kt](./egais-api/ru/evotor/egais/api/query/ActWriteOffQuery.html) | [ActWriteOff](./egais-api/ru/evotor/egais/api/model/document/actwriteoff/ActWriteOff.html) | Акт списания со склада |
| [ActWriteOffShopPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/ActWriteOffShopPositionQuery.html) | [ActWriteOffShopPosition](./egais-api/ru/evotor/egais/api/model/document/actwriteoff/ActWriteOffShopPosition.html) | Позиция в акте списания из магазина |
| [ActWriteOffShopQuery.kt](./egais-api/ru/evotor/egais/api/query/ActWriteOffShopQuery.html) | [ActWriteOffShop](./egais-api/ru/evotor/egais/api/model/document/actwriteoff/ActWriteOffShop.html) | Акт списания из магазина |
| [ClientSettingsQuery.kt](./egais-api/ru/evotor/egais/api/query/ClientSettingsQuery.html) | | Параметры клиента в УТМ |
| [ConfirmTicketQuery.kt](./egais-api/ru/evotor/egais/api/query/ConfirmTicketQuery.html) | [ConfirmTicket](./egais-api/ru/evotor/egais/api/model/document/ticket/ConfirmTicket.html) | Квитанция подтверждения на акт разногласия к товарно-транспортной накладной |
| [CursorExt.kt](./egais-api/ru/evotor/egais/api/query/CursorExtKt.html) | [](./) |  |
| [FieldNameExt.kt](./egais-api/ru/evotor/egais/api/query/FieldNameExtKt.html) | [](./) |  |
| [OrgInfoQuery.kt](./egais-api/ru/evotor/egais/api/query/OrgInfoQuery.html) | [OrgInfo](./egais-api/ru/evotor/egais/api/model/dictionary/OrgInfo.html) | Информация о контрагенте |
| [ProductInfoFilter.kt](./egais-api/ru/evotor/egais/api/query/ProductInfoFilter.html) | [](./) |  |
| [ProductInfoQuery.kt](./egais-api/ru/evotor/egais/api/query/ProductInfoQuery.html) | [ProductInfo](./egais-api/ru/evotor/egais/api/model/dictionary/ProductInfo.html) | Информация о продукции ЕГАИС |
| [ProductRestQuery.kt](./egais-api/ru/evotor/egais/api/query/ProductRestQuery.html) | [ProductRest](./egais-api/ru/evotor/egais/api/model/dictionary/ProductRest.html) | Общая загрегированная информация об остатках продукции (включая количество) на складе и в магазине |
| [ShopCommodityQuery.kt](./egais-api/ru/evotor/egais/api/query/ShopCommodityQuery.html) | [ShopCommodity](./egais-api/ru/evotor/egais/api/model/document/shop_commodity/ShopCommodity.html) | Остатки продукции в магазине |
| [StockCommodityQuery.kt](./egais-api/ru/evotor/egais/api/query/StockCommodityQuery.html) | [StockCommodity](./egais-api/ru/evotor/egais/api/model/document/stock_commodity/StockCommodity.html) | Остатки продукции на складе |
| [TicketQuery.kt](./egais-api/ru/evotor/egais/api/query/TicketQuery.html) | [Ticket](./egais-api/ru/evotor/egais/api/model/document/ticket/Ticket.html) | Квитанция |
| [TransferFromShopPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/TransferFromShopPositionQuery.html) | [TransferFromShopPosition](./egais-api/ru/evotor/egais/api/model/document/transfer/TransferFromShopPosition.html) |  |
| [TransferFromShopQuery.kt](./egais-api/ru/evotor/egais/api/query/TransferFromShopQuery.html) | [TransferFromShop](./egais-api/ru/evotor/egais/api/model/document/transfer/TransferFromShop.html) | Акт передачи продукции из торгового зала на склад |
| [TransferToShopPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/TransferToShopPositionQuery.html) | [TransferToShopPosition](./egais-api/ru/evotor/egais/api/model/document/transfer/TransferToShopPosition.html) |  |
| [TransferToShopQuery.kt](./egais-api/ru/evotor/egais/api/query/TransferToShopQuery.html) | [TransferToShop](./egais-api/ru/evotor/egais/api/model/document/transfer/TransferToShop.html) | Акт передачи продукции со склада в торговый зал |
| [TtnInformF2RegPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/TtnInformF2RegPositionQuery.html) | [TtnInformF2RegPosition](./egais-api/ru/evotor/egais/api/model/document/waybill/TtnInformF2RegPosition.html) | Позиция в справке 2 |
| [TtnInformF2RegQuery.kt](./egais-api/ru/evotor/egais/api/query/TtnInformF2RegQuery.html) | [TtnInformF2Reg](./egais-api/ru/evotor/egais/api/model/document/waybill/TtnInformF2Reg.html) | Справка 2 к ТТН |
| [WayBillActPositionMarkQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillActPositionMarkQuery.html) | [WayBillActPositionMark](./egais-api/ru/evotor/egais/api/model/document/waybillact/WayBillActPositionMark.html) | Марка позиций акта ТТН |
| [WayBillActPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillActPositionQuery.html) | [WayBillActPosition](./egais-api/ru/evotor/egais/api/model/document/waybillact/WayBillActPosition.html) | Позиция акта расхождения с товарно-транспортной накладной |
| [WayBillActQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillActQuery.html) | [WayBillAct](./egais-api/ru/evotor/egais/api/model/document/waybillact/WayBillAct.html) | Акт расхождения с товарно-транспортной накладной |
| [WayBillPositionMarkQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillPositionMarkQuery.html) | [WayBillPositionMark](./egais-api/ru/evotor/egais/api/model/document/waybill/WayBillPositionMark.html) | Марка позиций ТТН |
| [WayBillPositionQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillPositionQuery.html) | [WayBillPosition](./egais-api/ru/evotor/egais/api/model/document/waybill/WayBillPosition.html) | Позиция в товарно-транспортной накладной (ТТН) |
| [WayBillQuery.kt](./egais-api/ru/evotor/egais/api/query/WayBillQuery.html) | [WayBill](./egais-api/ru/evotor/egais/api/model/document/waybill/WayBill.html) | Товарно-транспортная накладная |

## Пример

Пример приложения, которое получает данные ЕГАИС с помощью запросов к базе данных смарт-терминала.
