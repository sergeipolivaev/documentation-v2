---
title: Оповещение пользователей с помощью push-уведомлений
permalink: doc_java_pushnotifications.html
sidebar: evojava
tags:
product: Java SDK
---

Приложения могут принимать и отображать push-уведомления.

В качестве примера, рассмотрим класс, который отображет простое всплывающее сообщение.

*Чтобы реализовать поддержку push-уведомлений в приложении:*

1. Создайте класс-приёмник push-уведомлений `PushReceiver`, который наследует класс `PushNotificationReceiver`.

   ```java
   public class PushReceiver extends PushNotificationReceiver {

    @Override
    public void onReceivePushNotification(Context context, Bundle data, long messageId) {
        //...получение push-уведомления.
        Toast.makeText(context, data.getString("header") + " " + data.getString("description")
                + " " + messageId, Toast.LENGTH_SHORT).show();
       }
   }
   ```
2. Добавьте необходимые права.

   Для приложения:

   ```xml
   <uses-permission android:name="ru.evotor.pushnotifications.PUSH_RECEIVE" />
   ```

   {% include tip.html content="Обратите внимание, как указаны права у [демонстрационного приложения](https://github.com/evotor/evotor-api-example/blob/push_sample/app/src/main/AndroidManifest.xml)." %}

   И для класса `PushReceiver`:

   ```xml
   <receiver
      android:name=".PushReceiver"
      android:permission="ru.evotor.pushnotifications.PUSH_SENDER">
      <intent-filter>
          <action android:name="ru.evotor.pushnotifications.PUSH_RECEIVED_EVENT" />
      </intent-filter>
   </receiver>
   ```

   Укажите в классе intent-фильтр `<action android:name="ru.evotor.pushnotifications.PUSH_RECEIVED_EVENT" />`.

## Пример

Пример реализованной службы вы найдёте в нашем демонстрационном приложении, в [ветке push_sample](https://github.com/evotor/evotor-api-example/tree/push_sample).

## См. также

* [Сборка и установка демонстрационного приложения](https://developer.evotor.ru/docs/doc_java_app_tutorial.html);
* [Обмен сообщениями приложения и стороннего сервиса](doc_java_third_party_service_communication.html).
