---
title: Работа с модификациями товаров
permalink: rest_product_modifications_guide.html
sidebar: evorestguides
product: Customer API
---

{% include note.html content="Для работы с модификациями товаров необходимо использовать версию V2 API Облака Эвтор." %}

Один товар может обладать различными атрибутами. Например, туфли могут отличаться размером, цветом, могут быть мужскими или женскими, а также обладать другими атрибутами. Товар, в схеме которого указан набор отличительных атрибутов, является *модификацией товара*.

Набор атрибутов товара указывается в объекте `attributes_choices`, который содержит пары `"<Идентификатор атрибута, например, цвет туфель>": "<Идентификатор значения атрибута, например, чёрный>"`.

Пример схемы модификации товара:

```json
{
  "name": "Товар 1",
  "type": "NORMAL",
  "measure_name": "шт",
  "tax": "VAT_18",
  "allow_to_sell": true,
  "price": 111.0,
  "cost_price": 9352.5,
  "parent_id": "5cd54680-5152-11e9-91c7-4b1dd1e1bcf8",
  "attributes_choices": {
    "be30db90-514f-11e9-91c7-4b1dd1e1bcf8": "be30db91-514f-11e9-91c7-4b1dd1e1bcf8",
    "be30db94-514f-11e9-91c7-4b1dd1e1bcf8": "be3102a0-514f-11e9-91c7-4b1dd1e1bcf8"
  }
}
```

Модификация товара может принадлежать только *группе модификаций*, идентификатор которой указывается в поле `parent_id`, в схеме товара.

Группа модификаций отличается от обычной группы товаров наличием массива `attributes`, который содержит объекты с описанием атрибутов и их значений.

Пример схемы группы модификаций:

```json
{
  "parent_id": "1ddea16b-971b-dee5-3798-1b29a7aa2e27",
  "name": "Группа модификаций туфель",
  "barcodes": [
    "2000000000060"
  ],
  "attributes":[
     {
        "id":"be30db90-514f-11e9-91c7-4b1dd1e1bcf8",
        "name":"Цвет",
        "choices":[
           {
              "id":"be30db91-514f-11e9-91c7-4b1dd1e1bcf8",
              "name":"Красный"
           },
           {
              "id":"be30db92-514f-11e9-91c7-4b1dd1e1bcf8",
              "name":"Зеленый"
           },
           {
              "id":"be30db93-514f-11e9-91c7-4b1dd1e1bcf8",
              "name":"Синий"
           }
        ]
     },
     {
        "id":"be30db94-514f-11e9-91c7-4b1dd1e1bcf8",
        "name":"Размер",
        "choices":[
           {
              "id":"be3102a0-514f-11e9-91c7-4b1dd1e1bcf8",
              "name":"S"
           },
           {
              "id":"be3102a1-514f-11e9-91c7-4b1dd1e1bcf8",
              "name":"M"
           },
           {
              "id":"be3102a2-514f-11e9-91c7-4b1dd1e1bcf8",
              "name":"L"
           }
        ]
     }
  ]
}
```

Группа модификаций может принадлежать обычной группе товаров, идентификатор которой указывается в поле `parent_id`, или храниться в корневом каталоге, в этом случае, поле `parent_id` указывать не надо.

{% include important.html content="Группа модификаций может содержать только модификации товаров." %}

## Создание модификации товара

*Чтобы создать модификацию товара:*

1. Создайте группу модификаций в корневом каталоге помощью запроса:

   ```shell
   curl --request POST \
     --url https://api.evotor.ru/stores/{идентификатор_магазина_пользователя}/product-groups \
     --header 'accept: application/vnd.evotor.v2+json;charset=UTF-8' \
     --header 'content-type: application/vnd.evotor.v2+json;charset=UTF-8' \
     --header 'x-authorization: {токен_пользователя}' \
     --data '{
       "name": "Группа модификаций Джинсы",
       "attributes":[
          {
             "id":"be30db90-514f-11e9-91c7-4b1dd1e1bcf8",
             "name":"Цвет",
             "choices":[
                {
                   "id":"be30db91-514f-11e9-91c7-4b1dd1e1bcf8",
                   "name":"Красный"
                },
                {
                   "id":"be30db92-514f-11e9-91c7-4b1dd1e1bcf8",
                   "name":"Зеленый"
                },
                {
                   "id":"be30db93-514f-11e9-91c7-4b1dd1e1bcf8",
                   "name":"Синий"
                }
             ]
          },
          {
             "id":"be30db94-514f-11e9-91c7-4b1dd1e1bcf8",
             "name":"Размер",
             "choices":[
                {
                   "id":"be3102a0-514f-11e9-91c7-4b1dd1e1bcf8",
                   "name":"S"
                },
                {
                   "id":"be3102a1-514f-11e9-91c7-4b1dd1e1bcf8",
                   "name":"M"
                },
                {
                   "id":"be3102a2-514f-11e9-91c7-4b1dd1e1bcf8",
                   "name":"L"
                }
             ]
          }
       ]
     }'
   ```

   При создании группы в корневом каталоге передавать поле `parent_id` не надо. Группа модификаций содержит атрибуты товаров и их возможные значения, каждые из которых обладают собственными идентификаторами.

   Ответ Облака Эвотор будет содержать идентификатор созданной группы модификаций в поле `id`:

   ```json
   {
     "id":"5cd54680-5152-11e9-91c7-4b1dd1e1bcf8",
     "store_id":"<идентификатор_магазина_пользователя>",
     "user_id":"<идентификатор_пользователя>",
     "created_at":"2019-04-25T10:26:35.748+0000",
     "updated_at":"2019-04-25T10:26:35.748+0000",
     "name":"Группа модификаций Джинсы",
     "attributes":[
        {
           "id":"be30db90-514f-11e9-91c7-4b1dd1e1bcf8",
           "name":"Цвет",
           "choices":[
              {
                 "id":"be30db91-514f-11e9-91c7-4b1dd1e1bcf8",
                 "name":"Красный"
              },
              {
                 "id":"be30db92-514f-11e9-91c7-4b1dd1e1bcf8",
                 "name":"Зеленый"
              },
              {
                 "id":"be30db93-514f-11e9-91c7-4b1dd1e1bcf8",
                 "name":"Синий"
              }
           ]
        },
        {
           "id":"be30db94-514f-11e9-91c7-4b1dd1e1bcf8",
           "name":"Размер",
           "choices":[
              {
                 "id":"be3102a0-514f-11e9-91c7-4b1dd1e1bcf8",
                 "name":"S"
              },
              {
                 "id":"be3102a1-514f-11e9-91c7-4b1dd1e1bcf8",
                 "name":"M"
              },
              {
                 "id":"be3102a2-514f-11e9-91c7-4b1dd1e1bcf8",
                 "name":"L"
              }
           ]
        }
     ]
   }
   ```

2. Создайте модификацию товара с помощью запроса:

   ```shell
   curl --request POST \
     --url https://test-api.evotor.ru/stores/{идентификатор_магазина_пользователя}/products \
     --header 'accept: application/vnd.evotor.v2+json;charset=UTF-8' \
     --header 'content-type: application/vnd.evotor.v2+json' \
     --header 'x-authorization: {токен_пользователя}' \
     --data '{
     "name":"Товар 1",
     "type":"NORMAL",
     "measure_name":"шт",
     "tax":"VAT_18",
     "allow_to_sell":true,
     "price":111.0,
     "cost_price":9352.5,
     "parent_id":"5cd54680-5152-11e9-91c7-4b1dd1e1bcf8",
     "attributes_choices":{
       "be30db90-514f-11e9-91c7-4b1dd1e1bcf8":"be30db91-514f-11e9-91c7-4b1dd1e1bcf8",
       "be30db94-514f-11e9-91c7-4b1dd1e1bcf8":"be3102a0-514f-11e9-91c7-4b1dd1e1bcf8"
     }
   }'
   ```

   Модификация товара принадлежит созданной группе модификаций, идентификатор которой указан в поле `parent_id` товара. Набор атрибутов модификации указан в виде пар идентификаторов в объекте `attributes_choices`. В данном примере модификация товара имеет красный цвет и размер S.

   Ответ Облака Эвотор будет содержать идентификатор созданной модификации товара в поле `id`:

   ```json
   {
     "id": "97f46a78-6bc4-4995-9cbc-60914b031c23",
     "store_id": "<идентификатор_магазина_пользователя>",
     "user_id": "<идентификатор_пользователя>",
     "created_at": "2019-04-25T10:26:45.085+0000",
     "updated_at": "2019-04-25T10:26:45.085+0000",
     "name": "Товар 1",
     "type": "NORMAL",
     "measure_name": "шт",
     "tax": "VAT_18",
     "allow_to_sell": true,
     "price": 111.0,
     "cost_price": 9352.5,
     "parent_id": "5cd54680-5152-11e9-91c7-4b1dd1e1bcf8",
     "attributes_choices": {
       "be30db90-514f-11e9-91c7-4b1dd1e1bcf8": "be30db91-514f-11e9-91c7-4b1dd1e1bcf8",
       "be30db94-514f-11e9-91c7-4b1dd1e1bcf8": "be3102a0-514f-11e9-91c7-4b1dd1e1bcf8"
     }
   }
   ```


## Модификации товара в интерфейсе смарт-терминала

Созданная группа модификаций в интерфейсе смарт-терминала выглядит так:

{% include image.html file="product_modifications_group.jpg" max-width="200" border="" url="images/product_modifications_group.jpg" caption="" alt="" %}

При переходе в группу отображаются хранящиеся в ней модификации товара:

{% include image.html file="list_of_product_modifications.jpg" max-width="200" border="" url="images/list_of_product_modifications.jpg" caption="" alt="" %}

При добавлении в чек, модификация товара будет выглядеть следующим образом:

{% include image.html file="selling_product_modification.jpg" max-width="200" border="" url="images/selling_product_modification.jpg" caption="" alt="" %}
