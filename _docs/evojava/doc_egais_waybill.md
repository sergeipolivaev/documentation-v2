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

1. [Создайте проект в Android Studio и подготовьте его для рабоы с egais-api](./doc_egais_project_creation.html).

2. В файле `AndroidManifest.xml`, в секции `<Application>` создайте элемент `<meta-data>` в котором требуется указать [идентификатор приложения](https://developer.evotor.ru/docs/doc_java_app_manifest.html).

3. В основном пакете создайте новый пакет `waybill`.

   **New**→**Package**

4. В пакете `waybill` создайте операцию **Master/Detail Flow**.

   **New**→**Activity**→**Master/Detail Flow**

5. Удалите пакет `Dummy`.

6. Измените файлы `MainActivity.java` и файлы пакета `waybill` в соответствии с [примером](./doc_egais_waybill.html#example).

{% include note.html content="Перед установкой приложения на терминал, убедитесь, что PackageName приложения совпадает с указанным на сайте разработчиков."%}


## Справка

Справочник по методам [класса `WayBillApi`](./egais-api/ru/evotor/egais/api/WayBillApi.html).

## Пример {#example}

Пример приложения, которое реализует методы класса `WayBillApi` вы найдёте в нашем [репозитории](https://github.com/Lytkini/EgaisAPIWaybillExample).
