---
title: Основы создания приложений для смарт-терминала
permalink: java_st_app_basics.html
sidebar: evojava
product: Java SDK
---

**TODO**: Ознакомиться с архитектурой приложений в React Native https://www.raywenderlich.com/247-react-native-tutorial-building-android-apps-with-javascript

Смарт-терминал работает под управлением видоизменённой ОС Android X.X. Благодаря этому, архитектура *интеграционных приложений* для смарт-терминала, во многом повторяет архитектуру обычного android-приложения.

Так, основными компонентами интеграционного приложения, так же как и обычного android-приложения, являются:

* Операции (activity);
* Службы (service);
* Поставщики контента (content provider);
* Приёмники широковещательных сообщений (broadcast receiver).

{% include tip.html content="Подробнее об этих компонентах [читайте в документации Android](https://developer.android.com/guide/components/fundamentals#Components)." %}

Приложения взаимодействуют со смарт-терминалом с помощью различных [точек интеграции](./) (команд, событий, широковещательных сообщений) и API, например, интерфейс для работы со встроенной кассой или данными пользователей.
