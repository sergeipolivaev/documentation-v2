---
title: Магазины
permalink: rest_stores.html
sidebar: evorestreference
product: Customer API
---

{% include note.html content="Общую информацию о запросах к API Облака вы найдёте [здесь](./rest_overview.html)." %} 

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
      "address": "Россия, г. Москва, ул. Тимура Фрунзе, 24"
    }
  ],
  "paging": {
    "next_cursor": "string"
  }
}
```
