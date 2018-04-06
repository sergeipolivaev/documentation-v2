---
title: Подготовка проекта для работы с egais-api
permalink: doc_egais_project_creation.html
sidebar: evojava
tags:
product:
---

*Чтобы подготовить проект для работы с egais-api:*

1. Создайте проект в Android Studio.

   Минимальная версия SDK проекта должна быть 22. При создании проекта выберите **No Activitty**.

   {% include tip.html content="Подробную информацию о том, как создать новый проект в Android Studio смотрите на сайте [developer.android.com](https://developer.android.com/training/basics/firstapp/creating-project.html)" %}

2. В файле `build.gradle` проекта:

   ```
   allprojects {
    repositories {
        google()
        jcenter()
        maven { url 'https://jitpack.io' }
       }
   }
   ```

3. В файле `build.gradle` приложения (папка `app`), в зависимости подключите библиотеку egais-api:

   ```
   implementation 'com.github.evotor:egais-api:ebe58e1a79'
   ```

4. В файле AndroidManifest.xml, в секции `application` укажите элемент `meta-data`, содержащий идентификатор приложения:

   ```xml
   <meta-data
            android:name="app_uuid"
            android:value="<Идентификатор приложения>" />
   ```

   {% include note.html content="Идентификатор приложения вы можете [скопировать на странице приложения на сайте разработчиков](./doc_java_app_manifest.html)." %}

5. Убедитесь, что `PackageName` приложения совпадает с указанным на сайте разработчиков, это необходимо для [установки приложения на смарт-терминал](./doc_app_installation.html#adb-shell).
