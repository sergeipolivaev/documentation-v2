---
title: Push-уведомления
permalink: rest_push_notifications.html
sidebar: evorest
tags: []
product: REST API
---

# Push-уведомления

## Передать push-уведомление

    POST /api/apps/{appId}/push-notifications

### Параметры

Имя  |  Тип | Описание
-----|------|--------------
`appId`|`строка` | **Обязательный параметр**. Идентификатор приложения в Облаке Эвотор.

### Тело запроса

Имя  | Тип  | Описание
-----|------|--------------
`devices`|`массив` | **Обязательный параметр**. Массив идентификаторов смарт-терминалов.
`activeUntil`|`строка` | **Обязательный параметр**.
`payload`|`объект` | **Обязательный параметр**.

#### Пример запроса.

```json
{
  "devices": [
    "string"
  ],
  "activeUntil": "2018-05-29T14:17:32.376Z",
  "payload": {}
}
```

### Ответ

```
200 OK
```
```json
{
  "details": [
    {
      "activeTill": "2018-05-29T15:44:16.111Z",
      "createdAt": "2018-05-29T15:44:16.111Z",
      "deviceId": "string",
      "rejectedAt": "2018-05-29T15:44:16.111Z",
      "reply": {},
      "sentAt": "2018-05-29T15:44:16.111Z",
      "status": "ACCEPTED"
    }
  ],
  "id": "string",
  "modifiedAt": "2018-05-29T15:44:16.111Z",
  "status": "ACCEPTED"
}
```


## Получить push-уведомление

    GET /api/apps/{appId}/push-notifications/{pushId}

### Параметры

Имя  |  Тип | Описание
-----|------|--------------
`appId`|`строка` | **Обязательный параметр**. Идентификатор приложения в Облаке Эвотор.
`pushId`|`строка` | **Обязательный параметр**. Идентификатор push-уведомления.


### Ответ

```
200 OK
```
```json
{
  "details": [
    {
      "activeTill": "2018-05-29T16:11:31.079Z",
      "createdAt": "2018-05-29T16:11:31.079Z",
      "deviceId": "string",
      "rejectedAt": "2018-05-29T16:11:31.079Z",
      "reply": {},
      "sentAt": "2018-05-29T16:11:31.079Z",
      "status": "ACCEPTED"
    }
  ],
  "id": "string",
  "modifiedAt": "2018-05-29T16:11:31.079Z",
  "status": "ACCEPTED"
}
```
