---
title: События приложения
permalink: rest_events_streaming.html
sidebar: evorestreference
tags: []
product: Publisher API
---

{% include note.html content="Общую информацию о запросах к API Облака вы найдёте в разделе [**Введение**](./rest_overview.html)." %} 

# События приложения

## Получить события приложения за определённый период

    GET /apps/{app_id}/events?since={since}&until={until}&types={types}

### Параметры

Имя  |  Тип | Описание
-----|------|--------------
`appId`|`строка` | **Обязательный параметр**. Идентификатор приложения в Облаке Эвотор.
`since`|`строка` | **Обязательный параметр**.
`until`|`строка` | **Обязательный параметр**.
`types`|`строка` | **Обязательный параметр**.

### Ответ

```
200 OK
```
```json
{
    "items": [
        {
            "action": "created",
            "id": "66e01735-ad96-4ec2-908f-3132f9b1e154",
            "payload": {
                "active": true,
                "app_id": "da1ccf38-6c18-4988-96df-bb2365b71735",
                "config": {
                    "content_type": "V2",
                    "insecure_ssl": false,
                    "secret": "woowoo"
                },
                "created_at": "2018-07-16T12:59:03.187+0000",
                "events": [
                    "product-image",                    
                    "document",
                    "employee",
                    "store",
                    "device",
                    "product"
                ],
                "id": "65981184-5a67-47a4-92c8-74bd0866d133",
                "updated_at": "2018-07-16T12:59:03.187+0000",
                "version_id": "19522718-34a8-423c-9bcd-c4b00b04f963"
            },
            "timestamp": 1531745943262,
            "type": "hook"
        },
        {
            "action": "updated",
            "id": "51e7d06b-7543-48a1-bec9-30d8db0d40d7",
            "payload": {
                "address": "Новый адрес 1531748852191",
                "created_at": "2018-04-17T10:11:49.670+0000",
                "id": "20180417-2396-4075-808C-50046017B78F",
                "name": "Новое имя 1531748852191",
                "updated_at": "2018-07-16T13:47:32.722+0000",
                "user_id": "02-200000000000108"
            },
            "timestamp": 1531748853010,
            "type": "store"
        },
        {
            "action": "updated",
            "id": "e22a2bec-ac4b-423f-82db-46242cfcb8f1",
            "payload": {
                "address": "Новый адрес 1531748933799",
                "created_at": "2018-04-17T10:11:49.670+0000",
                "id": "20180417-2396-4075-808C-50046017B78F",
                "name": "Новое имя 1531748933799",
                "updated_at": "2018-07-16T13:48:54.208+0000",
                "user_id": "02-200000000000108"
            },
            "timestamp": 1531748934494,
            "type": "store"
        }
    ],
    "paging": {
        "next_cursor": "AcCvBTmg5ZuWgbx3+7naxNzdKT4Xl2G8khsH9lqnpBWKJrC2tzr1aRC1YRBz/XT/MIZsHqV4vtgRYQKVET2x2bQpPPl2BSuw"
    }
}
```


## Получить события приложения по курсору

    GET /apps/{app_id}/events?cursor={cursor}

### Параметры

Имя  |  Тип | Описание
-----|------|--------------
`appId`|`строка` | **Обязательный параметр**. Идентификатор приложения в Облаке Эвотор.
`cursor`|`строка` | **Обязательный параметр**.


### Ответ

```
200 OK
```
```json

```

## Получить ленту активности приложения

    Content-Type: application/stream+json
    GET /apps/{app_id}/events?since={since}&until={until}&types={types}

### Параметры

Имя  |  Тип | Описание
-----|------|--------------
`appId`|`строка` | **Обязательный параметр**. Идентификатор приложения в Облаке Эвотор.
`since`|`строка` | **Обязательный параметр**.
`until`|`строка` | **Обязательный параметр**.
`types`|`строка` | **Обязательный параметр**.


### Ответ

```
200 OK
```
```json

```
