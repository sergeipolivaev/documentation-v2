---
title: Работа с товарно-транспортными накладными
permalink: doc_egais_waybill.html
sidebar: evojava
tags:
product:
---

В разделе приводится инструкция по добавлению кнопки. По нажатию кнопки, на экране приложения отображается список товарно-транспортных накладных. По нажатию на ТТН в списке, открывается окно с деталями выбранной ТТН.

Для работы с ТТН используйте методы класса `ru.evotor.egais.api`→`WayBillApi`.

*Чтобы получать информацию о ТТН:*

1. В Android Studio создайте новый проект.

   При создании проекта выберите **Basic Activity**.

   {% include tip.html content="Подробную информацию о том, как создать новый проект Android Studio смотрите на сайте [developer.android.com](https://developer.android.com/training/basics/firstapp/creating-project.html)" %}

2. Откройте файл `<Название проекта>`→`build.gradle` и укажите следующее:

   ```
   buildscript {
    ext.kotlin_version = '1.2.31'
    repositories {
        google()
        jcenter()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.0.1'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"

        // NOTE: Do not place your application dependencies here; they belong
        // in the individual module build.gradle files
        }
    }

   allprojects {
       repositories {
           google()
           jcenter()
           maven { url 'https://jitpack.io' }
       }
   }
   ```

3. Откройте файл `<Название проекта>`→`app`→`build.gradle` и укажите следующее:

   ```
   apply plugin: 'kotlin-android'

   apply plugin: 'kotlin-android-extensions'
   ```

   ```
   dependencies {
    implementation fileTree(dir: 'libs', include: ['*.jar'])
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jre7:$kotlin_version"
    implementation 'com.android.support:appcompat-v7:26.1.0'
    implementation 'com.android.support.constraint:constraint-layout:1.0.2'
    implementation 'com.android.support:support-v4:26.1.0'
    implementation 'com.android.support:recyclerview-v7:26.1.0'
    implementation 'com.android.support:design:26.1.0'

    implementation 'com.android.support:design:26.1.0'
    implementation 'com.github.evotor:egais-api:ebe58e1a79'

    testImplementation 'junit:junit:4.12'
    androidTestImplementation 'com.android.support.test:runner:1.0.1'
    androidTestImplementation 'com.android.support.test.espresso:espresso-core:3.0.1'

   }
   ```

4. В файле `AndroidManifest.xml`, в секции `<Application>` создайте элемент `<meta-data>` в котором требуется указать [идентификатор приложения](https://developer.evotor.ru/docs/doc_java_app_manifest.html).

5. В основном пакете создайте новый пакет `waybill`.

   **New**→**Package**

6. В пакете `waybill` создайте операцию **Master/Detail Flow**.

   **New**→**Activity**→**Master/Detail Flow**

7. Удалите пакет `Dummy`.

8. Измените файлы `MainActivity.java` и файлы пакета `waybill` в соответствии с [примером](./doc_egais_waybill.html#example).

{% include note.html content="Перед установкой приложения на терминал, убедитесь, что PackageName приложения совпадает с указанным на сайте разработчиков."%}


## Справка

Справочник по методам [класса `WayBillApi`](./egais-api/ru/evotor/egais/api/WayBillApi.html).

## Пример {#example}

Пример приложения, которое реализует методы класса `WayBillApi` вы найдёте в нашем [репозитории](https://github.com/Lytkini/EgaisAPIWaybillExample).
