---
title: Переоценка товара
permalink: rest_revaluation.html
sidebar: evorest
product: REST API
---


### `REVALUATION`

```json
{
  "body": {
    "base_document_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
    "base_document_number": 212,
    "positions": [
      {
        "position": {
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "code": "42",
          "price": {
            "before": 12.12,
            "after": 12.12,
            "accept": 12.12
          },
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ]
        }
      }
    ]
  }
}
```
