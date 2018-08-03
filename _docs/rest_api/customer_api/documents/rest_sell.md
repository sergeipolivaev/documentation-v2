---
title: Продажа товара
permalink: rest_sell.html
sidebar: evorestreference
product: REST API
---

### `SELL`

```json
{
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "parent_id": "1c4ba9e5-27f1-40a6-87a7-dfb08aa0cca8",
          "attributes_choices": {
            "attribute_id": "5f4c26b9-3a19-4f6e-bb67-5c71efa712ad",
            "attribute_name": "Цвет",
            "choice_id": "ec990252-4de7-4a00-9782-f65a8e847d2a",
            "choice_value": "Бесцветный"
          },
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "NORMAL",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "bar_сode": null,
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "price": 12.12,
          "cost_price": 12.12,
          "result_price": 12.12,
          "sum": 12.12,
          "result_sum": 12.12,
          "tax": {
            "type": "NO_VAT",
            "sum": 0,
            "result_sum": 0
          },
          "doc_distributed_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345
          },
          "position_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345,
            "discount_price": 12.12
          },
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "print_group_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "splitted_positions": [
            {
              "splitted_position": {
                "quantity": 123.123,
                "result_price": 12.12,
                "result_sum": 12.12,
                "position_discount": 12.12,
                "doc_distributed_discount": 12.12,
                "tax_type": "NO_VAT",
                "result_tax_sum": 12.12
              }
            }
          ],
          "sub_positions": [
            {
              "id": 12,
              "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
              "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
              "product_name": null,
              "product_type": "NORMAL",
              "measure_name": null,
              "initial_quantity": 123.123,
              "quantity": 123.123,
              "price": 12.12,
              "cost_price": 12.12,
              "result_price": 12.12,
              "sum": 12.12,
              "result_sum": 12.12,
              "alcohol_by_volume": 123.123,
              "alcohol_product_kind_code": 123.123
            }
          ]
        }
      }
    ],
    "doc_discounts": [
      {
        "doc_discount": {
          "discount_type": "SUM",
          "discount_sum": 12.12,
          "discount_percent": 12.12345,
          "coupon": "string"
        }
      }
    ],
    "payments": [
      {
        "payment": {
          "id": "string",
          "type": "CASH",
          "sum": 12.12,
          "app_payment": {
            "app_id": "string",
            "name": "string"
          },
          "parts": [
            {
              "print_group_id": "string",
              "part_sum": 12.12,
              "change": 12.12
            }
          ]
        }
      }
    ],
    "print_groups": [
      {
        "print_group": {
          "id": "string",
          "type": "CASH_RECEIPT",
          "org_name": "string",
          "org_inn": "string",
          "org_address": "string",
          "taxation_system": "COMMON"
        }
      }
    ],
    "pos_print_results": [
      {
        "pos_print_result": {
          "print_group_id": "string",
          "receipt_number": 0,
          "document_number": 0,
          "session_number": 0,
          "check_sum": 0,
          "receipt_date": "string",
          "fn_serial_number": "string",
          "kkt_serial_number": "string",
          "kkt_reg_number": "string",
          "fiscal_sign_doc_number": "string",
          "fiscal_document_number": 0
        }
      }
    ],
    "sum": 2123.12,
    "result_sum": 2123.12,
    "customer_email": "ivanov@example.ru",
    "customer_phone": 79876543210
  }
}
```
