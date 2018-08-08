---
title: Z-отчет (с гашением)
permalink: rest_z_report.html
sidebar: evorestreference
product: REST API
---

### `Z_REPORT`

```json
{
  "body": {
    "receipt_number": 0,
    "document_number": 0,
    "session_number": 0,
    "receipt_date": 12122017,
    "fn_serial_number": null,
    "kkt_serial_number": "string",
    "kkt_reg_number": "string",
    "fiscal_sign_doc_number": null,
    "fiscal_document_number": null,
    "total": 0,
    "proceeds": 0,
    "cash": 0,
    "cash_in_sum": 12.12,
    "cash_out_sum": 12.12,
    "cash_in_quantity": 0,
    "cash_out_quantity": 0,
    "collection": 12.12,
    "revenue": 12.12,
    "session_sales_results": 12.12,
    "session_purchases_results": 12.12,
    "nonzero_sum_sales": 12.12,
    "nonzero_sum_purchases": 12.12,
    "quantity_sales": {
      "quantity": 0,
      "reversal": 0,
      "back": 0,
      "reversal_back": 0
    },
    "quantity_purchases": {
      "quantity": 0,
      "reversal": 0,
      "back": 0,
      "reversal_back": 0
    },
    "sales": {
      "summ": 0,
      "reversal": 0,
      "sections": [
        {
          "number": 0,
          "name": "ТАРОЙ",
          "value": 0
        }
      ]
    },
    "sales_back": {
      "summ": 0,
      "reversal": 0,
      "sections": [
        {
          "number": 0,
          "name": "ТАРОЙ",
          "value": 0
        }
      ]
    },
    "purchases": {
      "summ": 0,
      "reversal": 0,
      "sections": [
        {
          "number": 0,
          "name": "ТАРОЙ",
          "value": 0
        }
      ]
    },
    "purchases_back": {
      "summ": 0,
      "reversal": 0,
      "sections": [
        {
          "number": 0,
          "name": "ТАРОЙ",
          "value": 0
        }
      ]
    }
  }
}
```

Имя  | Тип  | Описание
-----|------|--------------
`session_number`|`number`|Номер смены в ККТ.
`document_number`|`number`|Номер документа в ККТ.
`receipt_number`|`number`|Номер чека в ККТ.
`receipt_date`| `string`  |  Дата в ККТ на момент печати документа. Формат `DDMMYYYY`.
`fn_serial_number`| `string`  |Заводской номер фискального накопителя.
`kkt_serial_number`| `string`  |  *Необязательный.* Серийный номер ККТ.
`kkt_reg_number`| `string`  |  *Необязательный.* Регистрационный номер ККТ.
`fiscal_sign_doc_number`| `string`  |Номер фискального признака документа.
`fiscal_document_number`| `string`  |Фискальный номер документа в ККТ из ФН.
`total`|`number`|Общая сумма продаж за смену. До двух знаков в дробной части.
`proceeds`|`number`|Выручка за смену. До двух знаков в дробной части.
`cash`|`number`|Наличные средства в кассе. До двух знаков в дробной части.
`cash_in_sum`  |  `number` |  Сумма внесений за смену. До двух знаков в дробной части.
`cash_out_sum`  | `number`  |  Сумма выплат за смену. До двух знаков в дробной части.
`cash_in_quantity`  | `number`  |  Количество операций внесения.
`cash_out_quantity`  | `number`  |  Количество операций выплаты.
`collection`  | `number`  |  Сумма к инкассации. До двух знаков в дробной части.
`revenue`  | `number`  |  Доход за смену. До двух знаков в дробной части.
`session_sales_results`  | `number`  |  Сменный итог продаж. До двух знаков в дробной части.
`session_purchases_results`  | `number`  |  Сменный итог покупок. До двух знаков в дробной части.
`nonzero_sum_sales`  | `number`  |  Необнуляемая сумма продаж. До двух знаков в дробной части.
`nonzero_sum_purchases`  | `number`  |  Необнуляемая сумма покупок. До двух знаков в дробной части.
`quantity_sales`  | `object`  |  Число операций продаж. Соответствует блоку **Продажи** на чеке Z-отчета.
`quantity_sales.quantity`  | `number`  |  Количество операций.
`quantity_sales.reversal`  | `number`  |  Количество прямых операций.
`quantity_sales.back`  | `number`  |  Количество обратных операций.
`quantity_sales.reversal_back`  | `number`  |  Количество отмен обратных операций.
`quantity_purchases`  | `object`  |  Число операций продаж. Соответствует блоку **Покупки** на чеке Z-отчета.
`quantity_purchases.quantity`  | `number`  |  Количество операций.
`quantity_purchases.reversal`  | `number`  |  Количество прямых операций.
`quantity_purchases.back`  | `number`  |  Количество обратных операций.
`quantity_purchases.reversal_back`  | `number`  |  Количество отмен обратных операций.
`sales`  | `object`  |  Информация о продажах в разрезе способов оплаты доступных на ККТ.
`sales.summ`  | `number`  |  Сумма операции. До двух знаков в дробной части.
`sales.reversal`  | `number`  |  Сумма обратной операции. До двух знаков в дробной части.
`sales.sections`  | `Array of object`  |  Секции оплаты.
`sales.sections.number`  | `number`  |  Номер секции ККТ.
`sales.sections.name`  | `string`  |  Наименование секции ККТ. Возможные значения: `ТАРОЙ`, `ПЛАТ.КАРТОЙ`, `КРЕДИТОМ`, `НАЛИЧНЫМИ`, `ТИП 5`, `ТИП 6`, `ТИП 7`, `ТИП 8`, `ТИП 9`, `ТИП 10`.
`sales.sections.value`  | `number`  |  Сумма оплаты по данной секции. До двух знаков в дробной части.
`sales_back`  | `object`  |  Информация о возвратах продаж в разрезе способов оплаты достуных на ККТ.
`sales_back.summ`  | `number`  |  Сумма операции. До двух знаков в дробной части.
`sales_back.reversal`  | `number`  |  Сумма обратной операции. До двух знаков в дробной части.
`sales_back.sections`  | `Array of object`  |  Секции оплаты.
`sales_back.sections.number`  | `number`  |  Номер секции ККТ.
`sales_back.sections.name`  | `string`  |  Наименование секции ККТ. Возможные значения: `ТАРОЙ`, `ПЛАТ.КАРТОЙ`, `КРЕДИТОМ`, `НАЛИЧНЫМИ`, `ТИП 5`, `ТИП 6`, `ТИП 7`, `ТИП 8`, `ТИП 9`, `ТИП 10`.
`sales_back.sections.value`  | `number`  |  Сумма оплаты по данной секции. До двух знаков в дробной части.
`purchases`  | `object`  | Информация о покупках в разрезе способов оплаты достуных на ККТ.
`purchases.summ`  | `number`  |  Сумма операции. До двух знаков в дробной части.
`purchases.reversal`  | `number`  |  Сумма обратной операции. До двух знаков в дробной части.
`purchases.sections`  | `Array of object`  |  Секции оплаты.
`purchases.sections.number`  | `number`  |  Номер секции ККТ.
`purchases.sections.name`  | `string`  |  Наименование секции ККТ. Возможные значения: `ТАРОЙ`, `ПЛАТ.КАРТОЙ`, `КРЕДИТОМ`, `НАЛИЧНЫМИ`, `ТИП 5`, `ТИП 6`, `ТИП 7`, `ТИП 8`, `ТИП 9`, `ТИП 10`.
`purchases.sections.value`  | `number`  |  Сумма оплаты по данной секции. До двух знаков в дробной части.
`purchases_back`  | `object`  |  Информация о возвратах покупок в разрезе способов оплаты достуных на ККТ.
`purchases_back.summ`  | `number`  |  Сумма операции. До двух знаков в дробной части.
`purchases_back.reversal`  | `number`  |  Сумма обратной операции. До двух знаков в дробной части.
`purchases_back.sections`  | `Array of object`  |  Секции оплаты.
`purchases_back.sections.number`  | `number`  |  Номер секции ККТ.
`purchases_back.sections.name`  | `string`  |  Наименование секции ККТ. Возможные значения: `ТАРОЙ`, `ПЛАТ.КАРТОЙ`, `КРЕДИТОМ`, `НАЛИЧНЫМИ`, `ТИП 5`, `ТИП 6`, `ТИП 7`, ,`ТИП 8`,`ТИП 9`, `ТИП 10`.
`purchases_back.sections.value`  | `number`  |  Сумма оплаты по данной секции. До двух знаков в дробной части.
