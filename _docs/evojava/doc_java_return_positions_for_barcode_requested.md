---
title: Обработка события сканирования штрихкода
permalink: doc_java_return_positions_for_barcode_requested.html
sidebar: evojava
product: Java SDK
published: true
---

Когда пользователь сканирует штрихкод (EAN-13, QR-код, DataMatrix или любой другой), смарт-терминал рассылает событие [`ReturnPositionsForBarcodeRequestedEvent`](./integration-library/ru/evotor/framework/receipt/formation/event/ReturnPositionsForBarcodeRequestedEvent.html).

Обрабатывая данные, содержащиеся в событии сканирования штрихкода, приложения могут добавлять позиции в чек продажи и / или создавать новые товары.

<!-- #TODO ДОБАВИТЬ СХЕМУ РАСПРОСТРОСТРАНЕНИЯ ШТРИХКОДОВ -->

## Разрешение на обработку события сканирования штрихкода

Для обработки события сканирования штрихкода, в манифесте приложения необходимо указать следующее разрешение:

```xml
<uses-permission android:name="ru.evotor.permission.SELL_INTEGRATION_SERVICE" />
```

## Получение события

Создайте службу, которая будет обрабатывать событие, например, `BarcodeEventHandlerService`.

В манифесте приложения, в разделе службы, укажите разрешение, а в intent-фильтре службы, укажите событие сканирования чека:

```xml
<service
    android:name=".BarcodeEventHandlerService"
    android:enabled="true"
    android:exported="true"
    android:permission="ru.evotor.permission.SELL_INTEGRATION_SERVICE">
    <!-- служба использует объявленное разрешение -->
    <intent-filter>
        <!-- событие сканирования штрихкода -->
        <action android:name="ru.evotor.event.sell.BARCODE_RECEIVED" />
        <category android:name="android.intent.category.EVOTOR" />
    </intent-filter>
</service>
```

## Обработка события

После сканирования штрихкода, служба получит событие `ReturnPositionsForBarcodeRequestedEvent`, которое содержит полученные о сканера данные (`barcode`) и параметр `creatingNewProduct` со значением `false`. С помощью параметра `creatingNewProduct` смарт-терминал сообщает приложениям о необходимости создания нового товара.

Получив событие, служба `BarcodeEventHandlerService` может добавить существующий товар в чек продажи или запустить процесс создания нового товара.

Чтобы обработать событие сканирования штрихкода:

1. Унаследуйте службу `BarcodeEventHandlerService` от класса [`SellIntegrationService`](./integration-library/ru/evotor/framework/receipt/formation/event/handler/service/SellIntegrationService.html).
2. Переопределите метод [`handleEvent()`](./integration-library/ru/evotor/framework/receipt/formation/event/handler/service/SellIntegrationService.html#handleEvent-event-) и передайте в него событие сканирования штрихкода [`ReturnPositionsForBarcodeRequestedEvent`](./integration-library/ru/evotor/framework/receipt/formation/event/ReturnPositionsForBarcodeRequestedEvent.html).

   В методе следует реализовать логику поиска товаров по данным из события и наполнения списка позиций, который будет добавлен в чек продажи.

   {% include note.html content="Наряду с приложениями, которые обрабатывают события сканирования штрихкода, смарт-терминал самостоятельно выполняет поиск товара. Если после обработки события будет найдено несколько товаров, или несколько различных приложений предложат свои результаты, пользователь сможет выбрать что добавить в чек." %}

4. Верните результат `ReturnPositionsForBarcodeRequestedEvent.Result()`.

   В результате приложение может вернуть одну или несколько позиций, которые будут добавлены в чек продажи. Кроме списка позиций, в результате необходимо вернуть параметр `iCanCreateNewProduct`. Параметр принимает значения `true` или `false` и указывает на то, может приложение создать новый товар или нет.

### Создание нового товара

Если приложение не нашло необходимый товар, но готово создать новый (результат обработки события содержит параметр `iCanCreateNewProduct == true`), смарт-терминал передаст приложению событие `ReturnPositionsForBarcodeRequestedEvent` с параметром `creatingNewProduct == true`. В ответ на это событие метод `handleEvent()` должен вернуть `null`.


После создания товара приложение должно вернуть одну или несколько позиций, которые будут добавлены в чек продажи. [Рекомендуется возвращать одну позицию, которая ссылается на созданный товар](./doc_java_return_positions_for_barcode_requested.html#CreateProductActivity).

{% include tip.html content="Для создания нового товара воспользуйтесь методами [`NavigationApi`](./integration-library/build/javadoc/ru/evotor/framework/navigation/NavigationApi.html)." %}

Если ни одно из приложений не готово создать новый товар, смарт-терминал самостоятельно запустит процесс создания нового товара.

## Пример

### Служба, обрабатывающая событие сканирование чека

Если служба не может найти необходимый товар, она запускает операцию создания нового товара.

```kotlin
open class BarcodeEventHandlerService : SellIntegrationService() {

    override fun handleEvent(
            /*
                ReturnPositionsForBarcodeRequestedEvent(
                    val barcode: String, – строка данных, полученных от сканера штрихкодов.
                    val creatingNewProduct: Boolean – указывает на необходимость создать новый товар. Сразу после сканирования штрихкода всегда содержит false.
                )
             */
            event: ReturnPositionsForBarcodeRequestedEvent
    ):
            /*
                ReturnPositionsForBarcodeRequestedEvent.Result(
                    val positions: List<Position>, – список позиций, которые будут добавлены в чек.
                    val iCanCreateNewProduct: Boolean – указывает, будет приложение создавать товар на основе отсканированного штрихкода или нет
                )
             */
            ReturnPositionsForBarcodeRequestedEvent.Result?
    {

        // Создаём список позиций, который будет возвращён в результате и добавлен в чек продажи
        val positions = mutableListOf<Position>()

        // Запускаем операцию CreateProductActivity для создания нового товара, если creatingNewProduct == true.
        if (event.creatingNewProduct) {
            startIntegrationActivity(Intent(this, CreateProductActivity::class.java).apply {
                putExtra("SCANNED_BARCODE", event.barcode)
            })
            return null
        } else {
            // Наполняем список позиций positions
        }
        // Возвращаем позиции и сообщаем о намерении создать новый товар
        return ReturnPositionsForBarcodeRequestedEvent.Result(positions, iCanCreateNewProduct = true)
    }
}
```

### Операция создания нового товара {#CreateProductActivity}

```kotlin
class CreateProductActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Ключ штрихкода, присвоенный в службе BarcodeEventHandlerService
        val scannedBarcode = intent.getStringExtra("SCANNED_BARCODE")

        val parsedBarcode: String

        // Выделяем необходимый штрихкод из отсканированных данных и помещаем его в переменную parsedBarcode

        // Открываем окно создания нового товара с пердзаполненным полем штрихкода
        startActivityForResult(NavigationApi.createIntentForNewProduct(NavigationApi.NewProductIntentBuilder()
                .setBarcode(parsedBarcode)
        ), 5555)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {//Параметр data содержит идентификатор созданного товара
    super.onActivityResult(requestCode, resultCode, data)
    if (requestCode == 5555) {
        // Ищем созданный товар по идентификатору
        val prodItem = data?.getStringExtra("productUuid")?.let { InventoryApi.getProductByUuid(this, it) }
        if (pi == null) {
            finish()
            return
        }
        val p = prodItem as ProductItem.Product
        val b = intent.getBundleExtra(KEY_INTENT_DATA)
        val r = b.getParcelable<IntegrationResponse>(KEY_INTEGRATION_RESPONSE)
        r?.onResult(Bundle().apply {
            putBundle(IntegrationManager.KEY_DATA,
                    // Возвращаем результат со списком позиций и сообщаем смарт-терминалу, что создавать новый товар не требуется (iCanCreateNewProduct == false)
                    ReturnPositionsForBarcodeRequestedEvent.Result(listOf(
                            Position(
                              // Указываем параметры позиции
                            )
                    ), false).toBundle())
        })
        finish()
    }
    }
}
```

<!-- TODO ## См. также

* [Обработка событий смарт-терминала](./doc_java_return_st_events_processing.html) -->
