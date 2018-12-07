---
title: Магазины
permalink: rest_stores.html
sidebar: evorestreference
product: Customer API
---

{% include note.html content="Общую информацию о запросах к API Облака вы найдёте в разделе [**Введение**](./rest_overview.html)." %}

## Получить список магазинов

    GET /stores

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`cursor`| `string` | Идентификатор курсора для постраничного чтения данных.

### Ответ

```
200 Успешно
```

```json
{
  "items": [
    {
      "id": "20170228-F4F1-401B-80FA-9ECCA8451FFB",
      "name": "Мой магазин",
      "address": "Россия, г. Москва, ул. Тимура Фрунзе, 24",
      "user_id": "00-000000000000000",
      "created_at": "2018-04-17T10:11:49.393+0000",
      "updated_at": "2018-07-16T16:00:10.663+0000"
    }
  ],
  "paging": {
    "next_cursor": "string"
  }
}
```
