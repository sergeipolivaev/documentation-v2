---
title: Товары и модификации товаров
permalink: rest_products.html
sidebar: evorestreference
product: Customer API
---

{% include note.html content="Общую информацию о запросах к API Облака вы найдёте [здесь](./rest_overview.html)." %} 

## Создать товар

    POST /stores/{store-id}/products

Создаёт новый товар или модификацию товара в магазине. За раз вы можете создать до 1000 объектов. Идентификаторы объектов формирует Облако Эвотор.

Для выполнения множественных операций – указывайте `Content-Type` с модификатором `+bulk.`

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`cursor`| `string` | Идентификатор курсора для постраничного чтения данных.
``| `` |  
``| `` |  

### Пример тела запроса

```json
[
  {
    "parent_id": "1ddea16b-971b-dee5-3798-1b29a7aa2e27",
    "name": "Сидр",
    "measure_name": "шт",
    "tax": "VAT_18",
    "allow_to_sell": true,
    "price": 123.12,
    "description": "Вкусный яблочный сидр",
    "article_number": "СДР-ЯБЛЧ",
    "code": "42",
    "barcodes": [
      "2000000000060"
    ],
    "type": "ALCOHOL_NOT_MARKED"
  }
]
```

### Ответ

```
200 Успешно
```

```json
{
  "parent_id": "1ddea16b-971b-dee5-3798-1b29a7aa2e27",
  "name": "Сидр",
  "measure_name": "шт",
  "tax": "VAT_18",
  "allow_to_sell": true,
  "price": 123.12,
  "description": "Вкусный яблочный сидр",
  "article_number": "СДР-ЯБЛЧ",
  "code": "42",
  "barcodes": [
    "2000000000060"
  ],
  "type": "ALCOHOL_NOT_MARKED",
  "id": "01ba18b6-8707-5f47-3d9c-4db058054cb2",
  "quantity": 12,
  "cost_price": 100.123,
  "attributes_choices": {}
}
```

```
202 Принято
```

```json
{
  "id": "ca187ddc-8d1b-4d0e-b20d-c509082da528",
  "modified_at": "2018-01-01T00:00:00.000Z",
  "status": "FAILED",
  "type": "product",
  "details": [
    {
      "message": "validation failed for specified payload",
      "code": "validation_failed",
      "product_id": "1009017d-5f3d-422a-964b-3ff11ee2d183",
      "violations": [
        {
          "reason": "must not be null",
          "subject": "name"
        }
      ]
    }
  ]
}
```

## Создать/заменить несколько товаров

    PUT /stores/{store-id}/products

Создаёт/заменяет товары или модификации товаров в магазине. За раз вы можете создать до 1000 объектов. Идентификаторы объектов формирует клиент API.

### Пример тела запроса

```json
[
  {
    "parent_id": "1ddea16b-971b-dee5-3798-1b29a7aa2e27",
    "name": "Сидр",
    "measure_name": "шт",
    "tax": "VAT_18",
    "allow_to_sell": true,
    "price": 123.12,
    "description": "Вкусный яблочный сидр",
    "article_number": "СДР-ЯБЛЧ",
    "code": "42",
    "barcodes": [
      "2000000000060"
    ],
    "type": "ALCOHOL_NOT_MARKED"
  }
]
```

### Ответ

```
202 Принято
```

```json
{
  "id": "ca187ddc-8d1b-4d0e-b20d-c509082da528",
  "modified_at": "2018-01-01T00:00:00.000Z",
  "status": "FAILED",
  "type": "product",
  "details": [
    {
      "message": "validation failed for specified payload",
      "code": "validation_failed",
      "product_id": "1009017d-5f3d-422a-964b-3ff11ee2d183",
      "violations": [
        {
          "reason": "must not be null",
          "subject": "name"
        }
      ]
    }
  ]
}
```

### Описание ответа

Имя  | Тип  | Описание
-----|------|--------------
`id`| `string` | Идентификатор задачи.
`modified_at`| `string` |  Дата последнего изменения состояния задачи.
`status`| `string` |  Текущее состояние задачи. Возможные значения: `ACCEPTED` - Данные приняты и помещены в очередь на обработку; `DECLINED` - Некорректные данные. Обработка прервана; `RUNNING` - Задача выполняется; `COMPLETED` - Задача выполнена без ошибок; `FAILED` - Задача выполнена с ошибками.
`type`| `string` |  Ресурс, с которым ведется работа в рамках задачи.
`details`| `Array of object` |  Массив с подробностями о результатах выполнения задачи. Присутствует только для статусов `COMPLETED` и `FAILED`. Каждый элемент данного массива является результом ответа на соответствующий единичный запрос.
`details.message`| `string` |  Сопроводительное сообщение.
`details.code`| `string` |  Код ошибки.
`details.product_id`| `string` |  Идентификатор элемента задачи, с которым произошла ошибка.
`details.violations`| `Array of object` |  Массив с расшифровкой проблем, которые возникли при обработке конкретного элемента задачи.
`details.violations.reason`| `string` |  Описание нарушения, приведшего к ошибке в обработке элемента задачи.
`details.violations.subject`| `string` |  Поле элемента, к которому относится расшифровка.


## Получить все товары

    GET /stores/{store-id}/products

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`since` | `long` | Фильтр по дате изменения товара (`updated_at`). Полезен, если полная синхронизация уже была произведена ранее и требуется получить только измененные с конкретного момента времени экземпляры товаров. Указывается только в первом запросе из серии постраничных запросов. Если требуется получить полный список товаров, - не указывайте данный параметр.
`cursor`| `string` | Идентификатор курсора для постраничного чтения данных.

### Ответ

```
200 Success
```

```json
{
  "items": [
    {
      "parent_id": "1ddea16b-971b-dee5-3798-1b29a7aa2e27",
      "name": "Сидр",
      "measure_name": "шт",
      "tax": "VAT_18",
      "allow_to_sell": true,
      "price": 123.12,
      "description": "Вкусный яблочный сидр",
      "article_number": "СДР-ЯБЛЧ",
      "code": "42",
      "barcodes": [
        "2000000000060"
      ],
      "type": "ALCOHOL_NOT_MARKED"
    }
  ],
  "paging": {
    "next_cursor": "string"
  }
}
```

## Удалить несколько товаров или модификаций товаров

    DELETE /stores/{store-id}/products

Удаляет товары и модификации товаров из магазина. Чтобы удалить несколько объектов, укажите через запятую их идентификаторы в   query-параметре `id`. За раз можно удалить до 100 объектов.

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`id`| `string` | Идентификатор товара в Облаке Эвотор.

### Ответ

```
204 Успешно
```


## Создать/заменить товар

    PUT /stores/{store-id}/products/{product-id}

Создаёт/заменяет в магазине один товар или модификацию товара с указанным идентификатором.

### Пример тела запроса

```json
{
"parent_id": "1ddea16b-971b-dee5-3798-1b29a7aa2e27",
"name": "Сидр",
"measure_name": "шт",
"tax": "VAT_18",
"allow_to_sell": true,
"price": 123.12,
"description": "Вкусный яблочный сидр",
"article_number": "СДР-ЯБЛЧ",
"code": "42",
"barcodes": [
"2000000000060"
],
"type": "ALCOHOL_MARKED",
"id": "01ba18b6-8707-5f47-3d9c-4db058054cb2",
"quantity": 12,
"cost_price": 100.123,
"alcocodes": [
"0015932000001190604"
],
"alcohol_by_volume": 5.45,
"alcohol_product_kind_code": 400,
"tare_volume": 0.57,
"attributes_choices": { }
}
```

### Ответ

```
200 Успешно
```

## Получить товар

    GET /stores/{store-id}/products/{product-id}

### Ответ

```
200 Успешно
```

```json
{
  "parent_id": "1ddea16b-971b-dee5-3798-1b29a7aa2e27",
  "name": "Сидр",
  "measure_name": "шт",
  "tax": "VAT_18",
  "allow_to_sell": true,
  "price": 123.12,
  "description": "Вкусный яблочный сидр",
  "article_number": "СДР-ЯБЛЧ",
  "code": "42",
  "barcodes": [
    "2000000000060"
  ],
  "type": "NORMAL",
  "id": "01ba18b6-8707-5f47-3d9c-4db058054cb2",
  "quantity": 12,
  "cost_price": 100.123,
  "attributes_choices": {}
}
```

## Обновить остатки товара

    PATCH /stores/{store-id}/products/{product-id}

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`quantity`| `number` |  Доступный к продаже остаток товара или модификации товара. До трёх знаков в дробной части. Присутствует в схеме только если приложение имеет права на работу с остатками.
`price`| `number` |  Отпускная цена товара или модификации товара.



### Пример тела запроса

```json
{
  "quantity": 12,
  "price": 123.12
}
```

### Ответ

```
200 Успешно
```

## Удалить товар

    DELETE /stores/{store-id}/products/{product-id}

### Ответ

```
204 Успешно
```
