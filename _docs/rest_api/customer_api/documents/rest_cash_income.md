---
title: Внесение наличных в кассу
permalink: rest_cash_income.html
sidebar: evorest
product: REST API
---


### `CASH_INCOME`

```json
{
  "body": {
    "session_number": 1,
    "document_number": 1,
    "receipt_number": 1,
    "receipt_date": 12122017,
    "fn_serial_number": null,
    "kkt_serial_number": "string",
    "kkt_reg_number": "string",
    "fiscal_sign_doc_number": null,
    "fiscal_document_number": null,
    "sum": null,
    "description": null,
    "contributor": null
  }
}
```

Имя  | Тип  | Описание
-----|------|--------------
`receipt_number`| `number`  |  Номер чека в ККТ.
`document_number`| `number`  |  Номер документа в ККТ.
`session_number`| `number`  |  Номер смены в ККТ.
`receipt_date`| `string`  |  Дата в ККТ на момент печати документа. Формат `DDMMYYYY`.
`sum`| `number`  |  Сумма для внесения. До двух знаков в дробной части.
`description`| `string`  |  Основание для внесения.
`contributor`| `string`  |  Имя вносителя средств ("От кого").
`fn_serial_number`| `string`  |  Заводской номер фискального накопителя.
`kkt_serial_number`| `string`  |  Серийный номер ККТ.
`kkt_reg_number`| `string`  |  Регистрационный номер ККТ.
`fiscal_sign_doc_number`| `string`  |  Номер фискального признака документа.
`fiscal_document_number`| `string`  |  Фискальный номер документа в ККТ из ФН.
