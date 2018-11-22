---
title: Смарт-терминалы
permalink: rest_smart_terminals.html
sidebar: evorestreference
product: Customer API
---

{% include note.html content="Общую информацию о запросах к API Облака вы найдёте в разделе [**Введение**](./rest_overview.html)." %}

## Получить список смарт-терминалов

    GET /devices

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
      "id": "20170222-D58C-40E0-8051-B53ADFF38860",
      "name": "Моя касса №1",
      "store_id": "20170228-F4F1-401B-80FA-9ECCA8451FFB",
      "timezone_offset": 10800000,
      "imei": "123456789012345",
      "firmware_version": "1.2.3",
      "location": {
        "lng": 12.34,
        "lat": 12.34
      },
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

Имя  | Тип  | Описание
-----|------|--------------
`location`| `object` | GPS-координаты смарт-терминала.
`location.lng`| `float` | Долгота.
`location.lat`| `float` | Широта.
