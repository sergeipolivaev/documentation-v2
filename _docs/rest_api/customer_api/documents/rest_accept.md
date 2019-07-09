---
title: Приемка товара
permalink: rest_accept.html
sidebar: evorestreference
product: Customer API
---


### `ACCEPT`

```json
{
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

Имя  | Тип  | Описание
-----|------|--------------
`description`|`string`|*Необязательный*. Основание для приёмки товара.
`supplier_id`|`string`|*Необязательный*. Идентификатор поставщика.
`sum`|`number`|Общая стоимость принятых товарных позиций. До двух знаков в дробной части.
`positions`|`Array of object`|Массив товарных позиций (объектов position).
`positions.position`|`object`|Товарная позиция.
`positions.position.product_id`|`string`|Идентификатор товара, уникальный в рамках магазина. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене". Формат `uuid4`, в соответствии с RFC.
`positions.position.quantity`|`number`|Количество товара, над которыми выполняется операция. Всегда положительное и содержит до трёх знаков в дробной части.
`positions.position.initial_quantity`|`integer`|Остаток товара до выполнения операции. До трёх знаков в дробной части.
`positions.position.product_type`|`string`|Тип товара: `NORMAL` - неалкогольный товар; `ALCOHOL_MARKED` - маркированный алкоголь; `ALCOHOL_NOT_MARKED` - немаркированный алкоголь; `SERVICE` - услуга. В список могут быть добавлены новые типы товаров.
`positions.position.alcohol_by_volume` | `number` |*Необязательный*. Крепость алкогольной продукции. До трёх знаков в дробной части.
`positions.position.alcohol_product_kind_code`| `integer` |*Необязательный*. Код вида алкогольной продукции ФСРАР.
`positions.position.tare_volume`| `number` |*Необязательный*. Ёмкость тары алкогольной продукции в литрах. До трёх знаков в дробной части.
`positions.position.code`|`string`|Код товара или модификации товара. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене".
`positions.position.product_name`|`string`|Наименование товара.
`positions.position.measure_name`|`string`|Единица измерения из карточки товара.
`positions.position.id`|`integer`|Порядковый номер транзакции регистрации позиции в документе. Счет ведется на уровне терминала, начиная с единицы. Номер можно сбросить программно.
`positions.position.price`|`number`|Отпускная стоимость единицы товара. До двух знаков в дробной части.
`positions.position.cost_price`|`number`|Закупочная стоимость единицы товара. До двух знаков в дробной части.
`positions.position.sum`|`integer`|Отпускная стоимость товарной позиции (price*quantity). До двух знаков в дробной части.
`positions.position.mark`|`string`|*Необязательный*. Марка алкогольного товара.
`positions.position.bar_code`|`string`|*Необязательный*. Штрихкод, по которому товар добавили в документ приемки.
`positions.position.uuid`|`string`|*Необязательный*. Уникальный идентификатор товарной позиции в чеке. Полезен в случаях, когда нужно программно (средствами SDK) сослаться на конкретную позицию.
`positions.position.extra_keys`|`Array of object`|*Необязательный*. Массив объектов `extra_key`, соответствующих extra товара, на момент добавления товара в документ.
`positions.position.extra_keys.extra_key`|`object`|*Необязательный*. Массив объектов `extra_key`, соответствующих extra товара, на момент добавления товара в документ.
`positions.position.extra_keys.extra_key.identity`|`string`|*Необязательный*. Уникальный идентификатор дополнительного атрибута товара. Формат – uuid4, в соответствии с RFC.
`positions.position.extra_keys.extra_key.app_id`|`string`|*Необязательный*. Идентификатор приложения, в рамках которого к товарной позиции привязан дополнительный атрибут.
`positions.position.extra_keys.extra_key.description`|`string`|*Необязательный*. Описание дополнительного атрибута для визуализации на смарт-терминале.
