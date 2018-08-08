---
title: Изъятие наличных из кассы
permalink: rest_cash_outcome.html
sidebar: evorestreference
product: REST API
---

### `CASH_OUTCOME`

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
    "description": null,
    "sum": null,
    "payment_category_name": "Инкассация",
    "payment_category_id": 1,
    "receiver": "string"
  }
}
```

Имя  | Тип  | Описание
-----|------|--------------
`session_number`|`integer`|Номер смены в ККТ.
`document_number`|`integer`|Номер документа в ККТ.
`receipt_number`|`integer`|Номер чека в ККТ.
`receipt_date`|`string`| Дата печати в ККТ на момент печати документа. Формат DDMMYYYY.
`sum`|`number`|Сумма для внесения. До двух знаков в дробной части.
`payment_category_name`|`string`|Текстовый идентификатор категории платежа. Возможные значения: "Инкассация", "Оплата поставщику", "Оплата услуг", "Аренда", "Заработная плата", "Прочее".
`payment_category_id`|`integer`|Числовой идентификатор категории платежа. Возможные значения: "1 – Инкассация", "2 – Оплата поставщику", "3 – Оплата услуг", "4 – Аренда", "5 – Заработная плата", "6 – Прочее".
`receiver`|`string`|Имя получателя средств.
`description`|`string`|Основание для выплаты.
`fiscal_document_number`|`string`|*Необязательный.* Фискальный номер документа в ККТ из ФН.
`kkt_reg_number`|`string`|*Необязательный.* Регистрационный номер ККТ.
`kkt_serial_number`|`string`|*Необязательный.* Серийный номер ККТ.
`fn_serial_number`|`string`|*Необязательный.* Заводской номер фискального накопителя.
`fiscal_sign_doc_number`|`string`|*Необязательный.* Номер фискального признака документа.
