---
title: Переоценка товара
permalink: rest_revaluation.html
sidebar: evorestreference
product: Customer API
---


### `REVALUATION`

```json
{
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

Имя  | Тип  | Описание
-----|------|--------------
`base_document_id`| `string`|Соответствует атрибуту id документа продажи, на основании которого оформляется возврат (если производится возврат на основе чека). Не имеет значения если возврат производится без чека. Формат – uuid4, в соответствии с RFC.
`base_document_number`| `number `|*Необязательный*. Соответствует атрибуту number документа продажи, на основании которого оформляется возврат (если производится возврат на основе чека). Не имеет значения если возврат производится без чека.
`positions`|`Array of object`|Массив товарных позиций (объектов position).
`positions.position`|`object`|Товарная позиция.
`positions.position.uuid`|`string`|*Необязательный*. Уникальный идентификатор товарной позиции в чеке. Полезен в случаях, когда нужно программно (средствами SDK) сослаться на конкретную позицию.
`positions.position.product_id`|`string`|*Необязательный*. Идентификатор товара, уникальный в рамках магазина. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене". Формат `uuid4`, в соответствии с RFC.
`positions.position.code`|`string`|*Необязательный*. Код товара или модификации товара. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене".
`positions.position.price`|`object`|Объект (price), содержащий данные о ценах товара.
`positions.position.price.before`|`number`|Отпускная цена до переоценки.
`positions.position.price.after`|`number`|Отпускная цена после переоценки.
`positions.position.price`|`number`|Цена приёмки.
`positions.position.extra_keys`|`Array of object`|*Необязательный*. Массив объектов `extra_key`, соответствующих extra товара, на момент добавления товара в документ.
`positions.position.extra_keys.extra_key`|`object`|*Необязательный*. Массив объектов `extra_key`, соответствующих extra товара, на момент добавления товара в документ.
`positions.position.extra_keys.extra_key.identity`|`string`|*Необязательный*. Уникальный идентификатор дополнительного атрибута товара. Формат – uuid4, в соответствии с RFC.
`positions.position.extra_keys.extra_key.app_id`|`string`|*Необязательный*. Идентификатор приложения, в рамках которого к товарной позиции привязан дополнительный атрибут.
`positions.position.extra_keys.extra_key.description`|`string`|*Необязательный*. Описание дополнительного атрибута для визуализации на смарт-терминале.
