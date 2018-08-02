---
title: Списание товара
permalink: rest_write_off.html
sidebar: evorest
product: REST API
---

### `WRITE_OFF`

```json
{
  "body": {
    "positions": [
      {
        "position": {
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "NORMAL",
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "price": 12.12,
          "cost_price": 12.12,
          "sum": 12.12
        }
      }
    ],
    "sum": 2123.12
  }
}
```
