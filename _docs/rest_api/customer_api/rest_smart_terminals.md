---
title: Смарт-терминалы
permalink: rest_smart_terminals.html
sidebar: evorestreference
product: Customer API
---

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
      }
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
