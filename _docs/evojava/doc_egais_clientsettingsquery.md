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
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.AppCompatButton
import android.widget.Toast
import ru.evotor.egais.api.example.R

//импортируйте класс ClientSettingsQuery.
import ru.evotor.egais.api.query.ClientSettingsQuery

//Создайте операцию, которая реализует метод getFsRarId() по нажатию на кнопку.
class ClientSettingsActivity : AppCompatActivity() {

    val getFsRarIdButton by lazy { findViewById<AppCompatButton>(R.id.get_fsrarid_button) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_client_settings)

        //Вызовите метод getFsRarId().
        getFsRarIdButton.setOnClickListener {
            getFsRarId()
        }
    }

    private fun getFsRarId() {
        val fsRarId = ClientSettingsQuery().getFsRarId(this)

        println("fsrarid = $fsRarId")
        //Выведите FSRAR ID на экран смарт-терминала.
        Toast.makeText(this, "fsrarid = \"$fsRarId\"", Toast.LENGTH_SHORT).show()
    }
}
```

```java
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.*;
import android.widget.Toast;
import ru.evotor.egais.api.example.R;
//импортируйте класс ClientSettingsQuery.
import ru.evotor.egais.api.query.ClientSettingsQuery;

//Создайте операцию, которая реализует метод getFsRarId() по нажатию на кнопку.
public class ClientSettingsActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_client_settings);

        findViewById(R.id.get_fsrarid_button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                getFsRarId();
            }
        });
    }

    private void getFsRarId(){
        String fsRarId = new ClientSettingsQuery().getFsRarId(this);

        //Выведите FSRAR ID на экран смарт-терминала.
        Toast.makeText(this, "FSRAR ID = " + fsRarId, Toast.LENGTH_SHORT).show();
    }

}
```

### Приложение

Пример реализации класса `ClientSettingsQuery` вы можете посмотреть установив [демонстрационное приложение](https://github.com/evotor/egais-api-example).
