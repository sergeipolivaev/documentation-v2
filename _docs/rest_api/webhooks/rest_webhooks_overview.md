---
title: Введение
permalink: rest_webhooks_overview.html
sidebar: evowebhooks
product: Webhook
---

// TODO: взять все разделы из https://developer.github.com/webhooks/creating/ и перевести в том же виде

Облако Эвотор может оповещать ваш сервис об изменении ресурсов клиентов с помощью механизма Webhook.
Для этого в настройках интеграции, вам требуется указать какие события вы хотите получать.

# Webhooks

Разработчкики могут указать в настройках интеграции, изменения ресурсов какого типа их интересуют. При изменении состояния этих ресурсов, облако создает прикладные события, которые могут быть доступны, например, через [Events Api]. Если разработчик указал в настройках конфиг доставки, то дополнительно облака выполнит HTTP POST запрос на указанный адрес.

## События

В настройках интеграции разработчик указывает, какие события он хочет получать.
Каждое событие сопровождается списком действий, которые могут происходить с ресурсом.
Например, при подписке на изменения ресурса _device_, разработчик будет получать уведомления каждый раз, когда устройство было создано, изменено или удалено.

| Событие | Описание |
| ------------- |-------------|
| [`StoreEvent`](./rest_events.html#StoreEvent) | Событие изменения магазина. |
| [`DeviceEvent`](./rest_events.html#DeviceEvent) | Событие изменения смарт-терминала. |
| [`EmployeeEvent`](./rest_events.html#EmployeeEvent) | Событие изменения сотрудника. |
| [`DocumentEvent`](./rest_events.html#DocumentEvent)	| Событие создания документа. |
| [`ProductEvent`](./rest_events.html#ProductEvent)	| Событие изменения товара. |
| [`ProductGroupEvent`](./rest_events.html#ProductGroupEvent)	| Событие изменения группы товаров. |
| [`ProductImageEvent`](./rest_events.html#ProductImageEvent)	| Событие изменения изображения товара. |
| [`SystemEvent`](./rest_events.html#SystemEvent)	| Системное событие. |

## Заголовки доставки

| Заголовок | Описание |
|-------------|-------------|
| `User-Agent` | Отправитель запроса: `Evotor-Hookshot` |
| `X-Evotor-Delivery` | Идентификатор доставки. |
| `X-Hub-Signature` | Подпись запроса. |
| `Content-Type`	| `application/vnd.evotor.v2+json;charset=UTF-8` |

## Подпись запроса

Если в конфиге доставки был указан ключ подписи, то будет сгеренирован HMAC hex digest с использанием функции _sha1_ и ключа подписи в качестве HMAC key.

Пример генерации подписи:
```java
@SneakyThrows
private String signSha1(byte[] payload, String secret) {
    Mac hmac = Mac.getInstance("HmacSHA1");
    hmac.init(new SecretKeySpec(secret.getBytes(), "HmacSHA1"));
    return Hex.encodeHexString(hmac.doFinal(payload));
}
```

## Замечание

Обратите внимание, что заголовок _Authorization_ более не используются при доставке сообщений.
При получении запроса принимающая сторона, как правило, решает две разные задачи:
* Аутентификация отправляющей стороны - убедится, что запрос был отправлен облаком Эвотор
* Идентификация данных в событии - определить пользователя, которому соответствует полученное событие

Задача аутентификации решается проверкой подписи _X-Hub-Signature_.
Задача идентификации отпадает сама, так все события содержат в своей модели поле _user_id_, а также опциональные поля _store_id_, _device_id_ и т.д.

## Пример доставки

```shell
POST /payload HTTP/1.1
Host: localhost:4567
X-Evotor-Delivery: ed9eb563-f27e-8ed4-4d82-b801f57033c4
X-Hub-Signature: sha1=64b13d7d3a9298436bdfc98f385c0f5c063ddc38
User-Agent: Evotor-Hookshot
Content-Type: application/vnd.evotor.v2+json;charset=UTF-8
Content-Length: 420
{
  "id":"0d274a9f-2903-4d44-9209-93ad69a8fd3a",
  "timestamp":1534435744919,
  "type":"DeviceEvent",
  "action":"removed",
  "payload":{
    "id":"20180417-2396-4075-808C-50046017B700",
    "name":"Созданное имя",
    "store_id":"20180417-2396-4075-808C-50046017B78F",
    "user_id":"02-200000000000108",
    "created_at":"2018-08-16T16:09:04.408+0000",
    "updated_at":"2018-08-16T16:09:04.408+0000"
  }
}
```
