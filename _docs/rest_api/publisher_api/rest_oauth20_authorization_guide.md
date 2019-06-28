---
title: Авторизация запросов по протоколу OAuth
permalink: rest_oauth20_authorization_guide.html
sidebar: evorestpublisherguides
product: Publisher API
---

Чтобы авторизовать приложение и получить ключ доступа (`access_token`):

1. Создайте клиент приложения с помощью [соответствующего запроса](./rest_oauth20_authorization_guide.html#postclient).

   В ответ на запрос вы получите идентификатор клиента (`client_id`) и секрет клиента (`client_secret`). Сохраните эти данные, они понадобятся для авторизации приложения и подтверждения прав доступа к ресурсам пользователя.

   {% include tip.html content="Вы можете [получить информацию](./rest_oauth20_authorization_guide.html#getclient) обо всех клиентах приложения в любой момент." %}

2. Получите разрешение пользователя на доступ к ресурсам.

   Для этого, после установки приложения в личном кабинете, требуется открыть страницу на сервере авторизации:

   ```
   https://oauth.evotor.ru/oauth/authorize?client_id=<client_id>&response_type=code&redirect_uri=<redirect_url>
   ```

   где:
   * `client_id` и `client_secret` данные клиента приложения, полученные при создании клиента.
   * `response_type=code` – указывает, что авторизация выполняется с [кодом подтверждения](https://oauth.net/2/grant-types/authorization-code/).
   * `redirect_uri` – адрес страницы на вашем сервере, куда будет перенаправлен пользователь после подтверждения доступа к ресурсам. Адрес задаётся при создании клиента приложения.

   При перенаправлении на `<redirect_url>`, в адресную строку добавляется код авторизации (`code`):

   ```
   <redirect_url>/?code=<code>
   ```

3. Передайте код на сервер авторизации:

   ```shell
   curl -X POST \
   https://oauth.evotor.ru/oauth/token \
   -H 'Authorization: Basic <base64 clientId:clientSecret>' \
   -H 'Content-Type: application/x-www-form-urlencoded' \
   -d 'code=<code>&grant_type=authorization_code&redirect_uri=<redirect_url>'
   ```

   В ответ на запрос, сервер авторизации вернёт токен доступа (`access_token`).

4. Используйте токен доступа для работы с ресурсами пользователя.

## Ресурсы и права доступа {#resources}

Права доступа к ресурсам задаются в массиве `scope`, при [создании клиента приложения](./rest_oauth20_authorization_guide.html#postclient), в формате:

```json
"scope": [
    "device:read",
    "product:read",
    "product.quantity:read",
    "product.quantity:write"
]
```

Таблица содержит ресурсы пользователя и права, которые может получить ваше приложение:

<table>
   <thead>
      <tr>
         <th markdown="span">Имя ресурса</th>
         <th markdown="span">Описание</th>
         <th markdown="span">Права доступа</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td markdown="span">store</td>
         <td markdown="span">Получение информации о магазинах пользователя.</td>
         <td markdown="span">read</td>
      </tr>
      <tr>
         <td markdown="span">employee</td>
         <td markdown="span">Получение информации о сотрудниках пользователя.</td>
         <td markdown="span">read</td>
      </tr>
      <tr>
         <td markdown="span">device</td>
         <td markdown="span">Получение информации о смарт-терминалах пользователя.</td>
         <td markdown="span">read</td>
      </tr>
      <tr>
         <td markdown="span">device.imei</td>
         <td markdown="span">Получение информации об IMEI смарт-терминала.</td>
         <td markdown="span">read</td>
      </tr>
      <tr>
         <td markdown="span">device.location</td>
         <td markdown="span">Получение информации о местоположении смарт-терминала.</td>
         <td markdown="span">read</td>
      </tr>
      <tr>
         <td markdown="span">device.firmware</td>
         <td markdown="span">Получение информации о версии прошивки смарт-терминала.</td>
         <td markdown="span">read</td>
      </tr>
      <tr>
         <td markdown="span">product</td>
         <td markdown="span">Предоставляет доступ к номенклатуре. Вы можете как получать номенклатуру (read), так и изменять её (write).</td>
         <td markdown="span">read<br>write</td>
      </tr>
      <tr>
         <td markdown="span">product.quantity</td>
         <td markdown="span">Предоставляет доступ к остаткам товаров. Вы можете как получать остатки (read), так и изменять их (write).</td>
         <td markdown="span">read<br>write</td>
      </tr>
      <tr>
         <td markdown="span">document</td>
         <td markdown="span">Получение списка документов.</td>
         <td markdown="span">read</td>
      </tr>
      <tr>
         <td markdown="span">product-group</td>
         <td markdown="span">Предоставляет доступ к группам товаров. Вы можете как получать группы товаров (read), так и изменять их (write).</td>
         <td markdown="span">read<br>write</td>
      </tr>
      <tr>
         <td markdown="span">product-image</td>
         <td markdown="span">Предоставляет доступ к изображениям товаров. Вы можете как получать изборажения товаров (read), так и изменять их (write).</td>
         <td markdown="span">read<br>write</td>
      </tr>
   </tbody>
</table>

## Работа с клиентами приложения

### Создать клиент приложения {#postclient}

    POST https://dev.evotor.ru/api/v1/publisher/app/oauth/public/apps/{app-id}/versions/{version-id}/oauth-apps

Создаёт клиента приложения с определённым набором прав доступа к ресурсам пользователя. Параметр `version-id` содержит идентификатор версии приложения.

{% include tip.html content="Идентификатор версии приложения отображается в адресной строке браузера при выборе версии приложения на портале разработчиков." %}

Пример запроса:

```shell
curl -X POST \
  'https://dev.evotor.ru/api/v1/publisher/app/oauth/public/apps/537f5c5d-a173-466b-863a-dac5eb9d5bd0/versions/537f5c5d-a173-466b-863a-dac5eb9d5bd1/oauth-apps?type=web' \
  -H 'Authorization: 9179d710-56a4-49ea-b042-435e3257eaf6' \
  -H 'Content-Type: application/json' \
  -H 'Origin: https://dev.evotor.ru' \
  -H 'User-Agent: ' \
  -d '{
  "registered_redirect_uri": ["https://example.html/"],
  "scope": ["device:read"]
}'
```

Где:

* Заголовок `Authorization` содержит токен полученный одним из способов описанных в разделе ["Авторизация запросов к Облаку Эвотор"](./doc_authorization.html).
* Query-параметр `type` указывает тип клиента. Типы клиентов различаются доступными сценариями авторизации. Возможные значения:

   * `web` – выбирайте этот тип, если у вашего приложения есть серверная часть, которая будет участвовать в обмене кода авторизации на токен доступа. В этом случае идентификатор и секрет клиента может храниться на сервере приложения. Доступные сценарии авторизации: `authorization_code`, `refresh_token`, `implicit`.
   * `standalone` – выбирайте этот тип, если у вашего приложения нет серверной части. В этом случае идентификатор и секрет клиента может быть указан в исходном коде приложения, которое пользователь устанавливает на своё устройство. Доступные сценарии авторизации: `authorization_code`, `implicit`.

   {% include note.html content="Рекомендуемым сценарием авторизации является использование `authorization_code`." %}

* `registered_redirect_uri` – адрес страницы на вашем сервере, куда будет перенаправлен пользователь после подтверждения доступа к ресурсам.
* `scope` – массив строк, указывающих права доступа к ресурсам, которые клиент будет запрашивать у пользователя.



Пример ответа:

```json
{
    "client_id": "89856c66-c9d1-4fad-996e-71fa368179ee",
    "client_secret": "44c8fa46-af2d-47c3-b440-e2b82963ea0e",
    "scope": [
        "device:read"
    ],
    "authorized_grant_types": [
        "authorization_code",
        "implicit",
        "refresh_token"
    ],
    "registered_redirect_uri": [
        "https://example.html/"
    ],
    "access_token_validity": 604800,
    "publisher_id": "2d0c2b00-b843-45f1-97d2-2276e52fe469",
    "app_id": "537f5c5d-a173-466b-863a-dac5eb9d5bd0",
    "version_id": "0.1"
}
```

### Получить информацию о клиентах приложения {#getclient}

    GET https://dev.evotor.ru/api/v1/publisher/app/oauth/public/apps/{app-id}/versions/{version-id}/oauth-apps

Возвращает список с данными всех клиентов приложения. Параметр `version-id` содержит версию приложения, заданную на сайте разработчиков.

Пример запроса:

```shell
curl -X GET \
  https://dev.evotor.ru/api/v1/publisher/app/oauth/public/apps/fabd6e93-9dcd-46d7-a4ca-3f9d8fc0a441/versions/0.1/oauth-app \
  -H 'Authorization: e0704952-b8de-467f-bfc4-8a6b919f8757' \
  -H 'Accept: Application/vnd.evotor.v2+json' \
  -H 'Origin: https://dev.evotor.ru' \
```

Где:

* Заголовок `Authorization` содержит токен полученный одним из способов описанных в разделе ["Авторизация запросов к Облаку Эвотор"](./doc_authorization.html).
* Заголовок `Accept` содержит тип данных. Указывайте `Application/vnd.evotor.v2+json`.

Пример ответа:

```json
{
    "items": [
        {
            "client_id": "89856c66-c9d1-4fad-996e-71fa368179ee",
            "client_secret": "44c8fa46-af2d-47c3-b440-e2b82963ea0e",
            "scope": [
                "device:read"
            ],
            "authorized_grant_types": [
                "implicit",
                "authorization_code"
            ],
            "registered_redirect_uri": [
                "<redirect_url>"
],
            "access_token_validity": 604800,
            "publisher_id": "2d0c2b00-b843-45f1-97d2-2276e52fe469",
            "app_id": "fabd6e93-9dcd-46d7-a4ca-3f9d8fc0a441",
            "version_id": "0.1"
        }
    ],
    "paging": {}
}
```
