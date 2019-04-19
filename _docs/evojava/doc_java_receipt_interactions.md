---
title: Работа с позициями чека
sidebar: evojava
permalink: doc_java_receipt_interactions.html
product: Java SDK
---

Когда пользователь или установленные на смарт-терминале интеграционные приложения изменяют позиции чека, смарт-терминал распространяет событие изменения чека [`BeforePositionsEditedEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.html).

Обрабатывая это событие, ваше приложение может делать свои изменения: добавлять, изменять и удалять позиции чека.

## Получение события изменения чека

*Чтобы получать событие изменения чека:*

1. Создайте службу, например `MyIntegrationService`, которая наследует класс `IntegrationService`.

2. В манифесте приложения, в элементе `<action>` intent-фильтра службы, укажите событие изменения чека:

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

3. В методе обратного вызова `onCreate` службы, зарегистрируйте процессор [`BeforePositionsEditedEventProcessor`](./integration-library/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEventProcessor.html):

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

## Обработка события изменения чека

В метод `call` процессора приходит событие [`BeforePositionsEditedEvent`](./integration-library/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.html) и объект для возврата результата `callback`:

```java
callback.onResult(beforePositionsEditedEventResult)
```

Приложение возвращает результат [`BeforePositionsEditedEventResult`](./integration-library/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEventResult.html), который содержит список сделанных изменений и дополнительные поля.

Если приложению для возврата результата необходимо взаимодействие с пользователем, запустите интеграционную операцию (`Activity`), которая наследует класс `IntegrationActivity`:

```java
callback.startActivity(new Intent(context, MainActivity.class));
```

Чтобы вернуть результат из интеграционной операции, вызовите метод `setIntegrationResult()`:

```java
setIntegrationResult(new BeforePositionsEditedEventResult(changes, null));
```

Где вместо null вы можете передать `new SetExtra(extra)`, команду для [создания дополнительных полей в чеке](./doc_java_receipt_extras.html).

## Добавление, изменение и удаление позиций {#PositionAltering}

Для добавления позиции используйте метод [`PositionAdd(val position: Position)`](./integration-library/ru/evotor/framework/core/action/event/receipt/changes/position/PositionAdd.html).

Пример:

```java
//Создаём список изменений, который будет передан в результате.
List<IPositionChange> changes = new ArrayList<>();
//Создаём позицию, которая будет добавлена в чек.
Position PositionToBeAdded = Position.Builder.newInstance(
        UUID.randomUUID().toString(),
        null,
        "Зажигалка",
        "шт",
        0,
        new BigDecimal(30),
        new BigDecimal(qty.getText().toString())
).build();
//Добавляем позицию в список изменений.
changes.add(new PositionAdd(PositionToBeAdded));
//Возвращаем результат со списком изменений.
setIntegrationResult(new BeforePositionsEditedEventResult(changes, null));
```

Для изменения позиции используйте метод [`PositionEdit(val position: Position)`](./integration-library/ru/evotor/framework/core/action/event/receipt/changes/position/PositionEdit.html).

Пример:

```java
String ProdUuid = "6c1ca1d9-9f38-42ee-aa63-c4fb046d6a94";
String UuidOfPositionToBeEdited = null;
//Ищем в чеке товар по идентификатору.
Receipt CurrentSellReceipt = ReceiptApi.getReceipt(MyIntegrationActivity.this, Receipt.Type.SELL);
if (CurrentSellReceipt != null) {
    for (Position ItemOfReceipt : CurrentSellReceipt.getPositions()) {
        if (ItemOfReceipt.getProductUuid().equals(ProdUuid)) {
            UuidOfPositionToBeEdited = ItemOfReceipt.getUuid();
            Log.e("", "Product UUID: " + ProdUuid + " Position UUID: " + PositionToBeEdited);
        }
    }
}

if (UuidOfPositionToBeEdited != null) {
    //Создаём список изменений, который будет передан в результате.
    List<IPositionChange> changes = new ArrayList<>();
    ProductItem.Product Item = (ProductItem.Product) InventoryApi.getProductByUuid(SuggestActivity.this, ProdUuid);
    //Добавляем новую позицию с изменённым количеством товара.
    changes.add(new PositionEdit(
            Position.Builder.newInstance(
                    UuidOfPositionToBeEdited,
                    item.getUuid(),
                    item.getName(),
                    item.getMeasureName(),
                    item.getMeasurePrecision(),
                    item.getPrice(),
                    new BigDecimal(qty.getText().toString())
            ).build()
    ));
    //Возвращаем результат со списком изменений.
    setIntegrationResult(new BeforePositionsEditedEventResult(changes, null));
}
```

Для удаления позиции используйте метод [`PositionRemove(private val positionUuid: String)`](./integration-library/ru/evotor/framework/core/action/event/receipt/changes/position/PositionRemove.html).

Пример:

```java
//Создаём список изменений, который будет передан в результате.
List<IPositionChange> changes = new ArrayList<>();
//Удаляем позицию
changes.add(new PositionRemove(positionUuid));
//Возвращаем результат со списком изменений.
setIntegrationResult(new BeforePositionsEditedEventResult(changes, null));
```

Посмотрите пример использования методов в [демонстрационном приложении](./https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/SuggestActivity.java).

## Зацикливание обработки события изменения чека {#BeforePositionsEditedEventLoop}

Зацикливание обработки события `BeforePositionsEditedEvent` возникает если в ответ на изменение чека пользователем или другими интеграционными приложениями, ваше приложение всегда вносит свои изменения.

Чтобы избежать этого, просмотрите список сделанных изменений с помощью метода [`getChanges()`](./integration-library/ru/evotor/framework/core/action/event/receipt/before_positions_edited/BeforePositionsEditedEvent.html#getChanges--) и убедитесь, что вашему приложению необходимо реагировать на эти изменения.

Если такой необходимости нет, пропустите обработку события вызвав метод [`skip()`](./integration-library/ru/evotor/framework/core/action/processor/ActionProcessor.Callback.html#skip--).

Пример:

```java
public void call(@NonNull String action, @NonNull BeforePositionsEditedEvent event, @NonNull Callback callback) {
    boolean hasCoffee = false;
    Position foundPosition = null;
    String uuid = null, productUuid = null;
    //Просматриваем все изменения в чеке.
    for (IPositionChange change : event.getChanges()) {
        //Сохраняем позицию товара, если необходимый товар добавлен в чек.
        if (change instanceof PositionAdd) {
            foundPosition = ((PositionAdd) change).getPosition();
            if (foundPosition.getName().toLowerCase().contains("кофе")) {
                uuid = foundPosition.getUuid();
                productUuid = foundPosition.getProductUuid();
                hasCoffee = true;
                break;
            }
        }
    }

    try {
        if (hasCoffee) {
            //Передаём полученные о товаре данные в интеграционную операцию
            Intent intent = new Intent(getApplicationContext(), EditActivity.class);
            intent.putExtra("foundPosition", foundPosition);
            intent.putExtra("uuid", uuid);
            intent.putExtra("productUuid", productUuid);
            callback.startActivity(intent);
        } else {
            //Пропускаем обработку события, если необходимых изменений не обнаружено.
            callback.skip();
        }
    } catch (RemoteException e) {
        e.printStackTrace();
    }
}
});
```

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
