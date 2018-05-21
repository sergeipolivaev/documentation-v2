---
title: Получение параметров пользователя из УТМ
permalink: doc_egais_clientsettingsquery.html
sidebar: evojava
tags: []
product: Java SDK
---

Для получения параметров пользователя из УТМ в `egais-api` реализован класс [`ClientSettingsQuery`](./egais-api/ru/evotor/egais/api/query/ClientSettingsQuery.html#getFsRarId-context-). С помощью метода класса вы можете получить FSRAR ID.

## Получение FSRAR ID

FSRAR ID – уникальный идентификатор организации в **ФСРАР**. FSRAR ID хранится в УТМ и необходим для всех документов, которые УТМ передаёт в ЕГАИС.

Ваше приложение может получить идентификатор с помощью метода [`getFsRarId`](./egais-api/ru/evotor/egais/api/query/ClientSettingsQuery.html#getFsRarId-context-).

Для этого вы можете создать операцию, которая реализует метод.
Ниже приводится пример операции, которая выводит FSRAR ID на экран смарт-терминала.

{% include tabs.html %}

```kotlin
    private fun getFsRarId() {
        val fsRarId = ClientSettingsQuery().getFsRarId(this)

        //Выведите FSRAR ID на экран смарт-терминала.
        Toast.makeText(this, "fsrarid = \"$fsRarId\"", Toast.LENGTH_SHORT).show()
    }
```

```java
    private void getFsRarId(){
        String fsRarId = new ClientSettingsQuery().getFsRarId(this);

        //Выведите FSRAR ID на экран смарт-терминала.
        Toast.makeText(this, "FSRAR ID = " + fsRarId, Toast.LENGTH_SHORT).show();
    }
```

### Пример в демонстрационном приложении

Пример реализации метода `getFsRarId` в [демонстрационном приложении](https://github.com/evotor/egais-api-example/blob/master/app/src/main/java/ru/evotor/egais/api/example/client_settings/ClientSettingsActivity.kt).
