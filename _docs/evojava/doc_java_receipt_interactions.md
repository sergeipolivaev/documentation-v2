---
title: Работа с позициями чека
sidebar: evojava
permalink: doc_java_receipt_interactions.html
tags:
product: Java SDK
---

## Использование службы и получение событий о намерении изменения чека

1. Создайте службу, например `MyIntegrationService`, которая наследует класс `IntegrationService`. В колбэке `onCreate` службы, зарегистрируйте процессор `BeforePositionsEditedEventProcessor` (процессор наследует класс `ActionProcessor`).

   ```java
   public class MyIntegrationService extends IntegrationService {
    @Nullable
    @Override
    protected Map<String, ActionProcessor> createProcessors() {
        Map<String, ActionProcessor> map = new HashMap<>();
        map.put(BeforePositionsEditedEvent.NAME_SELL_RECEIPT, new BeforePositionsEditedEventProcessor() {
            @Override
            public void call(@NonNull String action, @NonNull BeforePositionsEditedEvent event, @NonNull Callback callback){

            }
        });
        return map;
       }
   }
   ```

2. Объявите службу в манифесте приложения:

   ```xml
   <service
           android:name=".MyIntegrationService"
           android:enabled="true"
           android:exported="true">
           <intent-filter>
               <category android:name="android.intent.category.DEFAULT" />
               <action android:name="evo.v2.receipt.sell.beforePositionsEdited" />
           </intent-filter>
   </service>
   ```

В метод `call` процессора приходит событие [`beforePositionsEditedEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.html). и объект для возврата результата `callback`.



В ответ приложение возвращает результат со списком возможных изменений:

```java
public BeforePositionsEditedEventResult(
        @Nullable List<IPositionChange> changes,
        @Nullable SetExtra extra
)
```

Чтобы вернуть результат, используйте метод:

```java
callback.onResult(beforePositionsEditedEventResult)
```

Если приложению для возврата результата необходимо взаимодействие с пользователем, запустите операцию (`Activity`), которая наследует класс `IntegrationActivity`:

```java
callback.startActivity(new Intent(context, MainActivity.class));
```

Ваша операция должна вызвать метод `setIntegrationResult`.

Например:

```java
setIntegrationResult(new BeforePositionsEditedEventResult(changes, null));
```

Где вместо null вы можете передать `new SetExtra(extra)`, команду для [создания дополнительных полей в чеке](./doc_java_receipt_extras.html).

## Описание позиции {#Position}

Вы можете добавить в чек позицию соответствующую товару в базе смарт-терминала (у позиции есть `uuid` товара) или задать свободную позицию.

Конструкторы позиций описаны в классе [`Position`](./integration-library/ru/evotor/framework/receipt/Position.html).

Если при создании позиции вы не укажете ставку НДС (класс [`TaxNumber`](./integration-library/ru/evotor/framework/receipt/TaxNumber.html)), смарт-терминал обратится за налоговой ставкой в Облако. Если в Облаке нет информации о налоговой ставке для позиции, смарт-терминал использует значение, заданное в настройках (**Настройки** → **Правила торговли** → **Налоги**).

{% include important.html content="В связи с изменением законодательства, с первого января 2019 года значения `VAT_18` и `VAT_18_118` (класс [`TaxNumber`](./integration-library/ru/evotor/framework/receipt/TaxNumber.html)) могут указывать как на 18%, так и на 20% ставку НДС. Наименования значений (`VAT_18` и `VAT_18_118`), при этом не меняются.<br> Реальное значение ставки НДС зависит от того, имеет пользователь доступ к новому значению НДС или нет. Например, пользователь установил приложение [\"Пакет обновлений\"](https://market.evotor.ru/store/apps/9ddd7629-3397-47eb-a83a-1d987aa71610)." %}

Поле `extraKeys` задаёт дополнительные ключи (идентификаторы) позиции. Дополнительные ключи обладают следующими параметрами:
* Описание (`description`), вместо которого можно передавать `null`. Описание отображается в интерфейсе и печатается на чеке.
* Идентификатор (`identity`) – хранит данные о приложении, создавшем ключ (`appId`).

  {% include note.html content="Приложение записывает дополнительные ключи в чек только под своим идентификатором." %}

### Позиция с подпозицией

Пример позиции чека с подпозицией (у позиции и подпозиции есть `uuid` товара):

```java
val positionFromProduct = Position.Builder.newInstance(
                UUID.randomUUID().toString(),
                product.uuid,
                product.name,
                product.measureName,
                product.measurePrecision,
                product.price,
                BigDecimal.ONE
        ).build()

        positionFromProduct.subPosition.add(
                Position.Builder.newInstance(
                                UUID.randomUUID().toString(),
                                product.uuid,
                                product.name,
                                product.measureName,
                                product.measurePrecision,
                                product.price,
                                BigDecimal.ONE
                        ).build()
                )
```

Вы можете использовать подпозиции `subPosition` для добавления опций к товару.
Например, к товару "Кофе" можно добавить подпозицию "Молоко". Подпозиция удаляется вместе с основной позицией товара.

### Свободно заданная позиция

Пример свободно заданной позиции (`uuid` товара – `null`):

```java
val freeProductPosition = Position.Builder.newInstance(
                UUID.randomUUID().toString(),
                null,
                "Товар",
                "шт",
                0,
                BigDecimal(100),
                BigDecimal(100)
        ).build()
```

## Добавление, изменение и удаление позиций {#PositionAltering}

Чтобы добавить позицию:

* В Java-приложении используйте метод:

  ```java
  data class PositionAdd(val position: Position) : IPositionChange {

      override fun toBundle(): Bundle {
          return Bundle().apply {
              putBundle(
                      PositionMapper.KEY_POSITION,
                      PositionMapper.toBundle(position)
              )
          }
      }

      override fun getPositionUuid(): String? {
          return position.uuid
      }

      override fun getType(): IChange.Type {
          return IChange.Type.POSITION_ADD
      }

      companion object {
          @JvmStatic
          fun from(bundle: Bundle?): PositionAdd? {
              bundle ?: return null

              return PositionAdd(
                      PositionMapper.from(
                              bundle.getBundle(PositionMapper.KEY_POSITION)
                      ) ?: return null
              )
          }
      }
  }
  ```

* В JS-приложении используйте метод:

  ```javascript
  function processBeforePositionsEdited(actionData) {
  var position = {
      "uuid" : "8e0ffg-lk3e-e93bnk-v0p41",
      "productUuid" : "trb44-i32lev-9833jf",
      "productCode" : "1024",
      "productType" : "NORMAL",
      "name" : "myLittlePosition",
      "measureName" : "kg",
      "measurePrecision" : 0,
      "price" : "100",
      "quantity" : "1"
  }
      receipt.addPosition(JSON.stringify(position));
  }
  ```

Чтобы изменить позицию, используйте следующий метод:

```java
data class PositionEdit(val position: Position) : IPositionChange {

    override fun toBundle(): Bundle {
        return Bundle().apply {
            putBundle(
                    PositionMapper.KEY_POSITION,
                    PositionMapper.toBundle(position)
            )
        }
    }

    override fun getPositionUuid(): String? {
        return position.uuid
    }

    override fun getType(): IChange.Type {
        return IChange.Type.POSITION_EDIT
    }

    companion object {
        @JvmStatic
        fun from(bundle: Bundle?): PositionEdit? {
            bundle ?: return null

            return PositionEdit(
                    PositionMapper.from(bundle.getBundle(PositionMapper.KEY_POSITION)) ?: return null
            )
        }
    }
}
```

Чтобы удалить позицию, используйте следующий метод:

```java
data class PositionRemove(
        private val positionUuid: String
) : IPositionChange {

    override fun toBundle(): Bundle {
        return Bundle().apply {
            putString(
                    KEY_POSITION_UUID,
                    positionUuid
            )
        }
    }

    override fun getPositionUuid(): String? {
        return positionUuid
    }

    override fun getType(): IChange.Type {
        return IChange.Type.POSITION_REMOVE
    }

    companion object {
        const val KEY_POSITION_UUID = "positionUuid"

        @JvmStatic
        fun from(bundle: Bundle?): PositionRemove? {
            bundle ?: return null

            return PositionRemove(
                    bundle.getString(KEY_POSITION_UUID) ?: return null
            )
        }
    }
}
```
