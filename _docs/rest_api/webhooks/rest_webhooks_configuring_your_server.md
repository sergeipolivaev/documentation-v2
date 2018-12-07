---
title: Подготовка сервера
permalink: rest_webhooks_configuring_your_server.html
sidebar: evowebhooks
product: Webhook
---


## Использование ngrock

В первую очередь, вам потребуется открыть доступ к вашему `localhost` из Интернета. Для этого используйте [ngrock](https://ngrok.com/) – бесплатную программу, доступную для всех основных ОС.

После установки ngrock, в командной строке выполните команду `./ngrok http 4567`, чтобы открыть доступ к `localhost`. Ответ на команду должен быть примерно таким:

```shell
Forwarding    http://7e9ea9dc.ngrok.io -> 127.0.0.1:4567
```

Скопируйте полученный адрес `*.ngrok.io`. А теперь, мы пойдём на шаг назад, туда, где мы задавали URL полезной нагрузки и вставим адрес этого сервера в это поле. Должно получиться что-то вроде `http://7e9ea9dc.ngrok.io/payload`.

Это действие позволит нам предоставить доступ к нашему localhost с конечной точкой `/payload` из Интернета.

## Создание сервера

А теперь перейдём к интересной части! Мы хотим слушать POST-запросы к адресу `/payload`, так как мы настроили этот путь раньше. Так как ngrock предоставляет доступ к нашему localhost из Интернета, нам не нужен другой сервер в сети, и мы, таким образом, можем с радостью тестировать наш сервер локально.

Давайте подготовим небольшое приложение Sinatra для обработки полученной информации. Наш простой стенд будет выглядеть как-то так:

```ruby
require 'sinatra'
require 'json'

post '/payload' do
  push = JSON.parse(request.body.read)
  puts "I got some JSON: #{push.inspect}"
end
```

(Если вы не очень знакомы с тем, как работает Sinatra, советуем вам ознакомиться с [соответствующим руководством](http://sinatrarb.com/).)

Запустите полученный сервер.

После изменения ресурса, на который вы подписались, сервер получит сообщение, которое будет выглядеть как-то так:

```shell
~/Developer/platform-samples/hooks/ruby/configuring-your-server $ ruby server.rb
== Sinatra/1.4.4 has taken the stage on 4567 for development with backup from Thin
>> Thin web server (v1.5.1 codename Straight Razor)
>> Maximum connections set to 1024
>> Listening on localhost:4567, CTRL+C to stop
I got some JSON: {"action"=>"opened", "issue"=>{"url"=>"..."
```

Успех! Вы успешно подготовили свой сервер для получения webhook. Теперь ваш сервер может обрабатывать полученную информацию так, как вам будет удобно. Например, если вы создаёте "настоящее" web-приложение, вы можете захотеть записывать некоторые JSON-сообщения в базу данных.

Дополнительную информацию о том, как использовать webhook для удовольствия и успеха вы найдёте в разделе [Тестирование webhook](./rest_webhooks_testing_webhooks.html).
