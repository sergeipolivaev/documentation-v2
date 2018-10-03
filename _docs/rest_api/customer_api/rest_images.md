---
title: Изображения товаров
permalink: rest_images.html
sidebar: evorestreference
product: Customer API
---

{% include note.html content="Общую информацию о запросах к API Облака вы найдёте в разделе [**Введение**](./rest_overview.html)." %} 

В разделе описаны методы, с помощью которых вы можете управлять изображениями товаров в Облаке Эвотор.

<!-- * TOC
{:toc} -->

Изображение товара это двоичный файл, который удовлетворяет следующим условиям:

* Формат – png.
* Разрешение – 300х300 пикселей.
* Объём не более 5242800 байт.
* Товар может иметь не более одного изображения.

   {% include tip.html content="Если вы хотите заменить изображение, сначала [удалите](#delete) текущее изображение товара." %}

Представленные методы поддерживают специальный MIME-тип данных:

```
multipart/form-data
```

<!-- [Подробнее о MIME-типах наших API](./rest_mime_types.html). -->

## Передать изображение

    POST /stores/{store-id}/products/{product-id}/images

### Параметры запроса

Имя  | Тип  | Описание
-----|------|--------------
`datafile`| `string` | **Обязательный**. Путь к изображению товара.

#### Пример запроса

```shell
curl -i -X POST "https://api.evotor.ru/stores/20180413-2595-40E8-80CB-4646C05D81B6/products/5e46f8de-ec4f-4f87-85de-337b88fa2bdd/images" \
-H "X-Authorization:c14fc51c-d6ea-4992-85c0-786b8351d270" \
-H "Content-Type:multipart/form-data" \
-F datafile=@000.png  
```

### Ответ

```
200 Success
```

```json
{
  "id":"2392e522-bda2-4b52-ac98-78a5a1711af0",
  "user_id":"02-200000000000033",
  "store_id":"20170918-A3BF-4000-807E-091AD8B5BFB3",
  "product_id":"gd68f8d5-d29f-48ad-9e32-5f47ef340008",
  "url":"https://example.com/images/IBcJGKO/QACAfgka2LW/tA/Wj41dKfSK2eMl9H7zQACAE5LlIr2iS1KsmHiloXEa8A",
  "meta":{
    "extension":"png",
    "file_size":429,
    "width":300,
    "height":300
  },
  "created_at":"2018-09-04T13:31:01.104+0000",
  "updated_at":"2018-09-04T13:31:01.104+0000"
}
```

`meta` – объект с параметрами изображения товара.

## Получить изображения

    GET /stores/{store-id}/products/{product-id}/images

### Ответ

```
200 Success
```

```json
{
  "items":[
    {
      "id":"1392e522-bda2-4b52-ac98-78a5a1711af1",
      "user_id":"02-200000000000034",
      "store_id":"30170918-A3BF-4000-807E-091AD8B5BFB4",
      "product_id":"gd68f8d5-d29f-48ad-9e32-5f47ef340008",
      "url":"https://example.com/images/IBcJGKO/QACAfgka2LW/tA/Wj41dKfSK2eMl9H7zQACAE5LlIr2iS1KsmHiloXEa8A",
      "meta":{
        "extension":"png",
        "file_size":429,
        "width":300,
        "height":300
      },
      "created_at":"2018-09-04T13:31:01.104+0000",
      "updated_at":"2018-09-04T13:31:01.104+0000"
    }
  ],
  "paging":{

  }
}
```

## Получить изображение

    GET /stores/{store-id}/products/{product-id}/images/{image-id}

### Ответ

```
200 Success
```
```json
{
  "id":"8993009f-bebc-4458-ad5c-77838ca51903",
  "user_id":"02-200000000000033",
  "store_id":"20170918-A3BF-4000-807E-091AD8B5BFB3",
  "product_id":"g9b2a11c-3d74-4f63-9b52-2814005c69f4",
  "url":"https://example.com/images/IBcJGKO/QACAfgka2LW/tA+bKhHD10T2ObUigUAFxp9AiZMAn768RFitXHeDjKUZAg",
  "meta":{
    "extension":"png",
    "file_size":429,
    "width":300,
    "height":300
  },
  "created_at":"2018-09-04T13:31:10.357+0000",
  "updated_at":"2018-09-04T13:31:10.357+0000"
}
```

## Удалить изображение {#delete}

    DELETE /stores/{store-id}/products/{product-id}/images/{image-id}

### Ответ

```
204 No Content
```
