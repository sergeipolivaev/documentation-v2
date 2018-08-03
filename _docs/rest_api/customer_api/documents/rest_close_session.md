---
title: Закрытие смены
permalink: rest_close_session.html
sidebar: evorestreference
product: REST API
---

### `CLOSE_SESSION`

```json
{
  "body": {
    "revenue": 0,
    "total": 0
  }
}
```

Имя  | Тип  | Описание
-----|------|--------------
`revenue`| `number`  |  Выручка за смену. До двух знаков в дробной части.
`total`| `number`  |  Сумма наличных средств в кассе на момент закрытия смены. До двух знаков в дробной части.
