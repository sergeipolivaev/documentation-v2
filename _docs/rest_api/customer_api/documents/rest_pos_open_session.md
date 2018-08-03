---
title: Открытие смены в ККТ
permalink: rest_pos_open_session.html
sidebar: evorestreference
product: REST API
---

### `POS_OPEN_SESSION`

```json
{
  "body": {
    "receipt_number": 0,
    "document_number": 0,
    "session_number": 0
  }
}
```

Имя  | Тип  | Описание
-----|------|--------------
`receipt_number`| `number`  |  Номер чека в ККТ.
`document_number`| `number`  |  Номер документа в ККТ.
`session_number`| `number`  |  Номер смены в ККТ.
