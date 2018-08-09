---
title: Вскрытие тары
permalink: rest_open_tare.html
sidebar: evorestreference
product: REST API
---

### `OPEN_TARE`

```json
{
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



Имя  | Тип  | Описание
-----|------|--------------
`positions`|`Array of object`|Массив товарных позиций (объектов position) к приёмке.
`positions.position`|`object`|Позиция к продаже.
`positions.position.quantity`|`number`|Количество товара, над которыми выполняется операция. Всегда положительное и содержит до трёх знаков в дробной части.
`positions.position.initial_quantity`|`integer`|Остаток товара до выполнения операции. До трёх знаков в дробной части.
`positions.position.product_type`|`string`|Тип товара: `NORMAL` - неалкогольный товар; `ALCOHOL_MARKED` - маркированный алкоголь; `ALCOHOL_NOT_MARKED` - немаркированный алкоголь; `SERVICE` - услуга. В список могут быть добавлены новые типы товаров.
`positions.position.product_name`|`string`|Наименование товара.
`positions.position.measure_name`|`string`|Единица измерения из карточки товара.
`positions.position.price`|`number`|Отпускная стоимость единицы товара. До двух знаков в дробной части.
`positions.position.sum`|`number `|Отпускная стоимость товарной позиции (price*quantity). До двух знаков в дробной части.
`positions.position.code`|`string`|*Необязательный*. Код товара или модификации товара. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене".
`positions.position.bar_code`|`string`|*Необязательный*. Штрихкод, по которому товар добавили в документ приемки.
`positions.position.product_id`|`string`|*Необязательный*. Идентификатор товара, уникальный в рамках магазина. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене". Формат `uuid4`, в соответствии с RFC.
`positions.position.uuid`|`string`|*Необязательный*. Уникальный идентификатор товарной позиции в чеке. Полезен в случаях, когда нужно программно (средствами SDK) сослаться на конкретную позицию.
`positions.position.mark`|`string`|*Необязательный*. Марка алкогольного товара.
`positions.position.alcohol_product_kind_code`| `integer` |*Необязательный*. Код вида алкогольной продукции ФСРАР.
`positions.position.tare_volume`| `number` |*Необязательный*. Ёмкость тары алкогольной продукции в литрах. До трёх знаков в дробной части.
`positions.position.extra_keys`|`Array of object`|*Необязательный*. Массив объектов `extra_key`, соответствующих extra товара, на момент добавления товара в документ.
`positions.position.extra_keys.extra_key`|`object`|*Необязательный*. Массив объектов `extra_key`, соответствующих extra товара, на момент добавления товара в документ.
`positions.position.extra_keys.extra_key.identity`|`string`|*Необязательный*. Уникальный идентификатор дополнительного атрибута товара. Формат – uuid4, в соответствии с RFC.
`positions.position.extra_keys.extra_key.app_id`|`string`|*Необязательный*. Идентификатор приложения, в рамках которого к товарной позиции привязан дополнительный атрибут.
`positions.position.extra_keys.extra_key.description`|`string`|*Необязательный*. Описание дополнительного атрибута для визуализации на смарт-терминале.
`positions.position.alcohol_by_volume` | `number` | Крепость алкогольной продукции. До трёх знаков в дробной части.
