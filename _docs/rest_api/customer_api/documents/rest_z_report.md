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
