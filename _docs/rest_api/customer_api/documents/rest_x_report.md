---
title: X-отчет (с гашением)
permalink: rest_x_report.html
sidebar: evorestreference
product: Customer API
---

### `X_REPORT`

```json
{
  "body": {
    "receipt_number": 0,
    "document_number": 0,
    "session_number": 0,
    "total": 0,
    "proceeds": 0,
    "cash": 0
  }
}
```

Имя  | Тип  | Описание
-----|------|--------------
`session_number`|`number`|Номер смены в ККТ.
`document_number`|`number`|Номер документа в ККТ.
`receipt_number`|`number`|Номер чека в ККТ.
`total`|`number`|Общая сумма продаж за смену на момент формирования отчета. До двух знаков в дробной части.
`proceeds`|`number`|Выручка за смену на момент формирования отчета. До двух знаков в дробной части.
`cash`|`number`|Наличные средства в кассе на момент формирования отчета. До двух знаков в дробной части.
