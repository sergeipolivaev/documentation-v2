---
title: Изображения товаров
permalink: rest_images.html
sidebar: evorestreference
product: REST API
---

В разделе описаны методы, с помощью которых вы можете управлять изображениями товаров в Облаке Эвотор.

Изображение товара представляет собой двоичный файл, который удовлетворяет следующим условиям:

* Формат – png.
* Разрешение – 300х300 пикселей.
* Объём не более 5242800 байт.

Представленные методы поддерживают специальный MIME-тип данных:

```
multipart/form-data
```

[Подробнее о MIME-типах наших API](./rest_mime_types.html).

## Передать изображение

    POST /stores/{store-id}/products/{product-id}/images

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`datafile`| `string` | **Обязательный**. Двоичный файл изображения товара.

#### Пример тела запроса

```json
{
  "datafile": "string"
}
```

### Ответ

```
200 Success
```
```json
{
  "createdAt": "2018-07-25T11:45:50.235Z",
  "id": "string",
  "meta": {
    "extension": "string",
    "fileSize": 0,
    "height": 0,
    "width": 0
  },
  "updatedAt": "2018-07-25T11:45:50.235Z",
  "url": "string"
}
```

`meta` – объект с параметрами изображения товара.



## Получить изображение

    GET /stores/{storeUuid}/products/{productUuid}/images/{image-id}

### Ответ

```
200 Success
```
```json
{
  "createdAt": "2018-07-25T12:37:06.999Z",
  "id": "string",
  "meta": {
    "extension": "string",
    "fileSize": 0,
    "height": 0,
    "width": 0
  },
  "updatedAt": "2018-07-25T12:37:06.999Z",
  "url": "string"
}
```

## Удалить изображение товара

    DELETE /stores/{storeUuid}/products/{productUuid}/images/{image-id}

### Ответ

```
204 No Content
```
