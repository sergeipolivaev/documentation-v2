---
title: Документы
permalink: rest_documents.html
sidebar: evorest
product: REST API
---

В разделе приведены методы для получения *документов*, которые смарт-терминал создаёт в процессе работы.

## Получить список документов

    GET /stores/{store-id}/documents

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`since`  | `long` | Дата начала выборки. Ответ содержит документы, созданные в указанную дату и после неё.  Не указывайте параметр, если требуется получить документы начиная с момента создания магазина.
`until`  | `long` | Дата окончания выборки. Ответ содержит документы, созданные до указанной даты. Если дата окончания выборки не указана, параметр приобретает значение даты выполнения запроса Облаком Эвотор.
`type`  | `string` | Фильтр, который определяет типы документов в ответе. Если фильтр не указан, поиск производится по всем типам документов. Разрешается указывать несколько типов через запятую. [Возможные значения параметра](./rest_documents.html#typeparameter).
`cursor`| `string` | Идентификатор курсора для постраничного чтения данных. Указывается для получения второй и последующих страниц данных. Для корректного работы постраничной навигации, параметр должен принимать значение переменной `next_cursor`, присутствующее в предыдущем ответе от Облака Эвотор.

{% include note.html content="Параметры `since`, `until` и `type` требуется указывать только в первом запросе в серии постраничных запросов." %}

### Ответ

```
200 Success
```

```json
{
  "items": [
    {
      "type": "OPEN_SESSION",
      "id": "20170222-D58C-40E0-8051-B53ADFF38860",
      "extras": {},
      "number": 1234,
      "close_date": "2017-01-10T09:33:19.757+0000",
      "time_zone_offset": 10800000,
      "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
      "session_number": 80,
      "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
      "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
      "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
      "user_id": "09-012345678901234",
      "version": "V2"
    }
  ],
  "paging": {
    "next_cursor": "string"
  }
}
```

## Получить документ по идентификатору

    GET /stores/{store-id}/documents/{document-id}

### Ответ

```
200 Success
```

```json
{
  "type": "OPEN_SESSION",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {}
}
```

## Получить список документов по идентификатору смарт-терминала

    GET /stores/{store-id}/devices/{device-id}/documents

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`since`  | `long` | Дата начала выборки. Ответ содержит документы, созданные в указанную дату и после неё.  Не указывайте параметр, если требуется получить документы начиная с момента создания магазина.
`until`  | `long` | Дата окончания выборки. Ответ содержит документы, созданные до указанной даты. Если дата окончания выборки не указана, параметр приобретает значение даты выполнения запроса Облаком Эвотор.
`type`  | `string` | Фильтр, который определяет типы документов в ответе. Если фильтр не указан, поиск производится по всем типам документов. Разрешается указывать несколько типов через запятую. [Возможные значения параметра](./rest_documents.html#typeparameter).
`cursor`| `string` | Идентификатор курсора для постраничного чтения данных. Указывается для получения второй и последующих страниц данных. Для корректного работы постраничной навигации, параметр должен принимать значение переменной `next_cursor`, присутствующее в предыдущем ответе от Облака Эвотор.

{% include note.html content="Параметры `since`, `until` и `type` требуется указывать только в первом запросе в серии постраничных запросов." %}

### Ответ

```
200 Success
```

```json
{
  "items": [
    {
      "type": "OPEN_SESSION",
      "id": "20170222-D58C-40E0-8051-B53ADFF38860",
      "extras": {},
      "number": 1234,
      "close_date": "2017-01-10T09:33:19.757+0000",
      "time_zone_offset": 10800000,
      "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
      "session_number": 80,
      "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
      "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
      "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
      "user_id": "09-012345678901234",
      "version": "V2"
    }
  ],
  "paging": {
    "next_cursor": "string"
  }
}
```

## Значения параметра `type` {#typeparameter}

Возможные значения параметра `type`:

* `OPEN_SESSION` – открытие смены на смарт-терминале;
* `POS_OPEN_SESSION` – открытие смены в ККТ;
* `CLOSE_SESSION` – закрытие смены;
* `CASH_INCOME` – внесение наличных в кассу;
* `CASH_OUTCOME` – изъятие наличных из кассы;
* `INVENTORY` – инвентаризация;
* `ACCEPT` – приемка товара;
* `REVALUATION` – переоценка товара;
* `WRITE_OFF` – списание товара;
* `RETURN` – возврат товара поставщику;
* `OPEN_TARE` – вскрытие тары;
* `SELL` – продажа товара;
* `PAYBACK` – возврат товара продавцу;
* `BUY` – выкуп (товара у клиента);
* `BUYBACK` – обратный выкуп (товара клиентом);
* `X_REPORT` – X-отчет (без гашения);
* `Z_REPORT` – Z-отчет (с гашением).

## Схемы документов

### `OPEN_SESSION`

```json
{
  "type": "OPEN_SESSION",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {}
}
```

### `POS_OPEN_SESSION`

```json
{
  "type": "POS_OPEN_SESSION",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "receipt_number": 0,
    "document_number": 0,
    "session_number": 0
  }
}
```

### `CLOSE_SESSION`

```json
{
  "type": "CLOSE_SESSION",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "revenue": 0,
    "total": 0
  }
}
```

### `CASH_INCOME`

```json
{
  "type": "CASH_INCOME",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "session_number": 1,
    "document_number": 1,
    "receipt_number": 1,
    "receipt_date": 12122017,
    "fn_serial_number": null,
    "kkt_serial_number": "string",
    "kkt_reg_number": "string",
    "fiscal_sign_doc_number": null,
    "fiscal_document_number": null,
    "sum": null,
    "description": null,
    "contributor": null
  }
}
```

### `CASH_OUTCOME`

```json
{
  "type": "CASH_OUTCOME",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "session_number": 1,
    "document_number": 1,
    "receipt_number": 1,
    "receipt_date": 12122017,
    "fn_serial_number": null,
    "kkt_serial_number": "string",
    "kkt_reg_number": "string",
    "fiscal_sign_doc_number": null,
    "fiscal_document_number": null,
    "description": null,
    "sum": null,
    "payment_category_name": "Инкассация",
    "payment_category_id": 1,
    "receiver": "string"
  }
}
```

### `INVENTORY`

```json
{
  "type": "INVENTORY",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "code": "42",
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ]
        }
      }
    ],
    "complete_inventory": true
  }
}
```

### `ACCEPT`

```json
{
  "type": "ACCEPT",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "bar_code": null,
          "product_type": "NORMAL",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "price": 12.12,
          "cost_price": 12.12,
          "sum": 12.12
        }
      }
    ],
    "supplier_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
    "sum": 2123.12
  }
}
```

### `REVALUATION`

```json
{
  "type": "REVALUATION",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "base_document_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
    "base_document_number": 212,
    "positions": [
      {
        "position": {
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "code": "42",
          "price": {
            "before": 12.12,
            "after": 12.12,
            "accept": 12.12
          },
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ]
        }
      }
    ]
  }
}
```

### `WRITE_OFF`

```json
{
  "type": "WRITE_OFF",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "NORMAL",
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "price": 12.12,
          "cost_price": 12.12,
          "sum": 12.12
        }
      }
    ],
    "sum": 2123.12
  }
}
```

### `RETURN`

```json
{
  "type": "RETURN",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "bar_code": null,
          "product_type": "NORMAL",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "price": 12.12,
          "cost_price": 12.12,
          "sum": 12.12
        }
      }
    ],
    "supplier_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
    "sum": 2123.12
  }
}
```

### `OPEN_TARE`

```json
{
  "type": "OPEN_TARE",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "ALCOHOL_MARKED",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "bar_code": null,
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "price": 12.12,
          "sum": 12.12
        }
      }
    ]
  }
}
```

### `SELL`

```json
{
  "type": "SELL",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "parent_id": "1c4ba9e5-27f1-40a6-87a7-dfb08aa0cca8",
          "attributes_choices": {
            "attribute_id": "5f4c26b9-3a19-4f6e-bb67-5c71efa712ad",
            "attribute_name": "Цвет",
            "choice_id": "ec990252-4de7-4a00-9782-f65a8e847d2a",
            "choice_value": "Бесцветный"
          },
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "NORMAL",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "bar_сode": null,
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "price": 12.12,
          "cost_price": 12.12,
          "result_price": 12.12,
          "sum": 12.12,
          "result_sum": 12.12,
          "tax": {
            "type": "NO_VAT",
            "sum": 0,
            "result_sum": 0
          },
          "doc_distributed_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345
          },
          "position_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345,
            "discount_price": 12.12
          },
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "print_group_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "splitted_positions": [
            {
              "splitted_position": {
                "quantity": 123.123,
                "result_price": 12.12,
                "result_sum": 12.12,
                "position_discount": 12.12,
                "doc_distributed_discount": 12.12,
                "tax_type": "NO_VAT",
                "result_tax_sum": 12.12
              }
            }
          ],
          "sub_positions": [
            {
              "id": 12,
              "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
              "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
              "product_name": null,
              "product_type": "NORMAL",
              "measure_name": null,
              "initial_quantity": 123.123,
              "quantity": 123.123,
              "price": 12.12,
              "cost_price": 12.12,
              "result_price": 12.12,
              "sum": 12.12,
              "result_sum": 12.12,
              "alcohol_by_volume": 123.123,
              "alcohol_product_kind_code": 123.123
            }
          ]
        }
      }
    ],
    "doc_discounts": [
      {
        "doc_discount": {
          "discount_type": "SUM",
          "discount_sum": 12.12,
          "discount_percent": 12.12345,
          "coupon": "string"
        }
      }
    ],
    "payments": [
      {
        "payment": {
          "id": "string",
          "type": "CASH",
          "sum": 12.12,
          "app_payment": {
            "app_id": "string",
            "name": "string"
          },
          "parts": [
            {
              "print_group_id": "string",
              "part_sum": 12.12,
              "change": 12.12
            }
          ]
        }
      }
    ],
    "print_groups": [
      {
        "print_group": {
          "id": "string",
          "type": "CASH_RECEIPT",
          "org_name": "string",
          "org_inn": "string",
          "org_address": "string",
          "taxation_system": "COMMON"
        }
      }
    ],
    "pos_print_results": [
      {
        "pos_print_result": {
          "print_group_id": "string",
          "receipt_number": 0,
          "document_number": 0,
          "session_number": 0,
          "check_sum": 0,
          "receipt_date": "string",
          "fn_serial_number": "string",
          "kkt_serial_number": "string",
          "kkt_reg_number": "string",
          "fiscal_sign_doc_number": "string",
          "fiscal_document_number": 0
        }
      }
    ],
    "sum": 2123.12,
    "result_sum": 2123.12,
    "customer_email": "ivanov@example.ru",
    "customer_phone": 79876543210
  }
}
```

### `PAYBACK`

```json
{
  "type": "PAYBACK",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "base_document_number": 212,
    "base_document_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
    "doc_discounts": [
      {
        "doc_discount": {
          "discount_type": "SUM",
          "discount_sum": 12.12,
          "discount_percent": 12.12345,
          "coupon": "string"
        }
      }
    ],
    "payments": [
      {
        "payment": {
          "id": "string",
          "type": "CASH",
          "sum": 12.12,
          "app_payment": {
            "app_id": "string",
            "name": "string"
          },
          "parts": [
            {
              "print_group_id": "string",
              "part_sum": 12.12,
              "change": 12.12
            }
          ]
        }
      }
    ],
    "print_groups": [
      {
        "print_group": {
          "id": "string",
          "type": "CASH_RECEIPT",
          "org_name": "string",
          "org_inn": "string",
          "org_address": "string",
          "taxation_system": "COMMON"
        }
      }
    ],
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "parent_id": "1c4ba9e5-27f1-40a6-87a7-dfb08aa0cca8",
          "attributes_choices": {
            "attribute_id": "5f4c26b9-3a19-4f6e-bb67-5c71efa712ad",
            "attribute_name": "Цвет",
            "choice_id": "ec990252-4de7-4a00-9782-f65a8e847d2a",
            "choice_value": "Бесцветный"
          },
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "NORMAL",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "bar_сode": null,
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "price": 12.12,
          "cost_price": 12.12,
          "result_price": 12.12,
          "sum": 12.12,
          "result_sum": 12.12,
          "tax": {
            "type": "NO_VAT",
            "sum": 0,
            "result_sum": 0
          },
          "doc_distributed_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345
          },
          "position_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345,
            "discount_price": 12.12
          },
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "print_group_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "splitted_positions": [
            {
              "splitted_position": {
                "quantity": 123.123,
                "result_price": 12.12,
                "result_sum": 12.12,
                "position_discount": 12.12,
                "doc_distributed_discount": 12.12,
                "tax_type": "NO_VAT",
                "result_tax_sum": 12.12
              }
            }
          ]
        }
      }
    ],
    "pos_print_results": [
      {
        "pos_print_result": {
          "print_group_id": "string",
          "receipt_number": 0,
          "document_number": 0,
          "session_number": 0,
          "check_sum": 0,
          "receipt_date": "string",
          "fn_serial_number": "string",
          "kkt_serial_number": "string",
          "kkt_reg_number": "string",
          "fiscal_sign_doc_number": "string",
          "fiscal_document_number": 0
        }
      }
    ],
    "sum": 2123.12,
    "result_sum": 2123.12,
    "customer_email": "ivanov@example.ru",
    "customer_phone": 79876543210
  }
}
```

### `BUY`

```json
{
  "type": "BUY",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "parent_id": "1c4ba9e5-27f1-40a6-87a7-dfb08aa0cca8",
          "attributes_choices": {
            "attribute_id": "5f4c26b9-3a19-4f6e-bb67-5c71efa712ad",
            "attribute_name": "Цвет",
            "choice_id": "ec990252-4de7-4a00-9782-f65a8e847d2a",
            "choice_value": "Бесцветный"
          },
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "NORMAL",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "bar_сode": null,
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "price": 12.12,
          "cost_price": 12.12,
          "result_price": 12.12,
          "sum": 12.12,
          "result_sum": 12.12,
          "tax": {
            "type": "NO_VAT",
            "sum": 0,
            "result_sum": 0
          },
          "doc_distributed_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345
          },
          "position_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345,
            "discount_price": 12.12
          },
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "print_group_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "splitted_positions": [
            {
              "splitted_position": {
                "quantity": 123.123,
                "result_price": 12.12,
                "result_sum": 12.12,
                "position_discount": 12.12,
                "doc_distributed_discount": 12.12,
                "tax_type": "NO_VAT",
                "result_tax_sum": 12.12
              }
            }
          ]
        }
      }
    ],
    "doc_discounts": [
      {
        "doc_discount": {
          "discount_type": "SUM",
          "discount_sum": 12.12,
          "discount_percent": 12.12345,
          "coupon": "string"
        }
      }
    ],
    "payments": [
      {
        "payment": {
          "id": "string",
          "type": "CASH",
          "sum": 12.12,
          "app_payment": {
            "app_id": "string",
            "name": "string"
          },
          "parts": [
            {
              "print_group_id": "string",
              "part_sum": 12.12,
              "change": 12.12
            }
          ]
        }
      }
    ],
    "print_groups": [
      {
        "print_group": {
          "id": "string",
          "type": "CASH_RECEIPT",
          "org_name": "string",
          "org_inn": "string",
          "org_address": "string",
          "taxation_system": "COMMON"
        }
      }
    ],
    "pos_print_results": [
      {
        "pos_print_result": {
          "print_group_id": "string",
          "receipt_number": 0,
          "document_number": 0,
          "session_number": 0,
          "check_sum": 0,
          "receipt_date": "string",
          "fn_serial_number": "string",
          "kkt_serial_number": "string",
          "kkt_reg_number": "string",
          "fiscal_sign_doc_number": "string",
          "fiscal_document_number": 0
        }
      }
    ],
    "sum": 2123.12,
    "result_sum": 2123.12,
    "customer_email": "ivanov@example.ru",
    "customer_phone": 79876543210
  }
}
```

### `BUYBACK`

```json
{
  "type": "BUYBACK",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "base_document_number": 212,
    "base_document_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
    "doc_discounts": [
      {
        "doc_discount": {
          "discount_type": "SUM",
          "discount_sum": 12.12,
          "discount_percent": 12.12345,
          "coupon": "string"
        }
      }
    ],
    "payments": [
      {
        "payment": {
          "id": "string",
          "type": "CASH",
          "sum": 12.12,
          "app_payment": {
            "app_id": "string",
            "name": "string"
          },
          "parts": [
            {
              "print_group_id": "string",
              "part_sum": 12.12,
              "change": 12.12
            }
          ]
        }
      }
    ],
    "print_groups": [
      {
        "print_group": {
          "id": "string",
          "type": "CASH_RECEIPT",
          "org_name": "string",
          "org_inn": "string",
          "org_address": "string",
          "taxation_system": "COMMON"
        }
      }
    ],
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "parent_id": "1c4ba9e5-27f1-40a6-87a7-dfb08aa0cca8",
          "attributes_choices": {
            "attribute_id": "5f4c26b9-3a19-4f6e-bb67-5c71efa712ad",
            "attribute_name": "Цвет",
            "choice_id": "ec990252-4de7-4a00-9782-f65a8e847d2a",
            "choice_value": "Бесцветный"
          },
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "NORMAL",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "bar_сode": null,
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "price": 12.12,
          "cost_price": 12.12,
          "result_price": 12.12,
          "sum": 12.12,
          "result_sum": 12.12,
          "tax": {
            "type": "NO_VAT",
            "sum": 0,
            "result_sum": 0
          },
          "doc_distributed_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345
          },
          "position_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345,
            "discount_price": 12.12
          },
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "print_group_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "splitted_positions": [
            {
              "splitted_position": {
                "quantity": 123.123,
                "result_price": 12.12,
                "result_sum": 12.12,
                "position_discount": 12.12,
                "doc_distributed_discount": 12.12,
                "tax_type": "NO_VAT",
                "result_tax_sum": 12.12
              }
            }
          ]
        }
      }
    ],
    "pos_print_results": [
      {
        "pos_print_result": {
          "print_group_id": "string",
          "receipt_number": 0,
          "document_number": 0,
          "session_number": 0,
          "check_sum": 0,
          "receipt_date": "string",
          "fn_serial_number": "string",
          "kkt_serial_number": "string",
          "kkt_reg_number": "string",
          "fiscal_sign_doc_number": "string",
          "fiscal_document_number": 0
        }
      }
    ],
    "sum": 2123.12,
    "result_sum": 2123.12,
    "customer_email": "ivanov@example.ru",
    "customer_phone": 79876543210
  }
}
```

### `X_REPORT`

```json
{
  "type": "X_REPORT",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "receipt_number": 0,
    "document_number": 0,
    "session_number": 0,
    "total": 0,
    "proceeds": 0,
    "cash": 0
  }
}
```

### `Z_REPORT`

```json
{
  "type": "Z_REPORT",
  "id": "20170222-D58C-40E0-8051-B53ADFF38860",
  "extras": {},
  "number": 1234,
  "close_date": "2017-01-10T09:33:19.757+0000",
  "time_zone_offset": 10800000,
  "session_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
  "session_number": 80,
  "close_user_id": "20170417-46B8-40B9-802E-4DEB67C07565",
  "device_id": "20170928-9441-4BEB-BEAE-C6BC5E7AF30D",
  "store_id": "20170928-3176-40EB-80E2-A11F032E282A",
  "user_id": "09-012345678901234",
  "version": "V2",
  "body": {
    "receipt_number": 0,
    "document_number": 0,
    "session_number": 0,
    "receipt_date": 12122017,
    "fn_serial_number": null,
    "kkt_serial_number": "string",
    "kkt_reg_number": "string",
    "fiscal_sign_doc_number": null,
    "fiscal_document_number": null,
    "total": 0,
    "proceeds": 0,
    "cash": 0,
    "cash_in_sum": 12.12,
    "cash_out_sum": 12.12,
    "cash_in_quantity": 0,
    "cash_out_quantity": 0,
    "collection": 12.12,
    "revenue": 12.12,
    "session_sales_results": 12.12,
    "session_purchases_results": 12.12,
    "nonzero_sum_sales": 12.12,
    "nonzero_sum_purchases": 12.12,
    "quantity_sales": {
      "quantity": 0,
      "reversal": 0,
      "back": 0,
      "reversal_back": 0
    },
    "quantity_purchases": {
      "quantity": 0,
      "reversal": 0,
      "back": 0,
      "reversal_back": 0
    },
    "sales": {
      "summ": 0,
      "reversal": 0,
      "sections": [
        {
          "number": 0,
          "name": "ТАРОЙ",
          "value": 0
        }
      ]
    },
    "sales_back": {
      "summ": 0,
      "reversal": 0,
      "sections": [
        {
          "number": 0,
          "name": "ТАРОЙ",
          "value": 0
        }
      ]
    },
    "purchases": {
      "summ": 0,
      "reversal": 0,
      "sections": [
        {
          "number": 0,
          "name": "ТАРОЙ",
          "value": 0
        }
      ]
    },
    "purchases_back": {
      "summ": 0,
      "reversal": 0,
      "sections": [
        {
          "number": 0,
          "name": "ТАРОЙ",
          "value": 0
        }
      ]
    }
  }
}
```
