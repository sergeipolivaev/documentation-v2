---
title: STDEV-1852 (Добавление позиции / создание товара по результатам сканирования штрихкода)
permalink: doc_java_return_positions_for_barcode_requested.html
sidebar: evojava
product: Java SDK
---

Эта функциональность предваряет глобальные изменения в API смарт-терминала.

В рамках этой задачи сделаны следующие изменения:

* Создан новый пакет framework.common, в котором будут храниться родительские классы необходимые для интеграций. В пакет добавлены:

   * интеграционная служба второй версии (IntegrationServiceV2). Чтобы поддержать заявленную функциональность, необходимо наследоваться от этой версии службы.
   * родительское событие IntegrationEvent.

* Добавлено событие ReturnPositionsForBarcodeRequestedEvent, унаследованное от IntegrationEvent.
* Добавлены две службы для обработки события: ReceiptFormationIntegrationService и SellIntegrationService. Обе службы унаследованы от IntegrationServiceV2.
* Изменён класс RequiresIntentAction. Теперь он необходим не только приёмникам широковещательных сообщений, но и для обработки событий смарт-терминала с помощью IntegrationServiceV2.


Для документирования понадобится:

* Добавить разел об обработке событий смарт-терминала с помощью интеграционных служб обоих версий.
* Обновить раздел doc_app_integration_points.html#events (дописать новое событие со ссылкой на javadoc).
* Обновить javadoc по созданным сущностям.
* Описать новое разрешение(?)


Начиная с версии Evotor POS X.X.X приложения могут добавлять позиции в чек продажи и создавать новые товары на основе данных, полученных от сканера штрихкодов.

Для этого в интеграционной библиотеке были созданы соответствующие интеграционные же службы. Вы можете видеть, что эти службы (наполнения чека и продажи) наследуют новую версию [интеграционной службы](./).

Таким образом механизм работы с новой функциональностью во многом напоминает обычную обработку [событий](./).

# Обработка события сканирования штрихкода

Когда пользователь сканирует штрихкод, смарт-терминал рассылает широковещательное сообщение и событие [ReturnPositionsForBarcodeRequestedEvent](./ссылка на javadoc).

После обработки этого события, ваше приложение может добавить товар в чек продажи или создать новый товар.

## Разрешение

В манифесте приложения укажите следующее разрешение:

```xml
<uses-permission android:name="ru.evotor.permission.SELL_INTEGRATION_SERVICE" />
```

## Получение события

В манифесте приложения, в intent-фильтре службы, укажите событие сканирования чека:

```xml
<service
    android:name=".BarcodeEventHandlerService"
    android:enabled="true"
    android:exported="true"
    android:permission="ru.evotor.permission.SELL_INTEGRATION_SERVICE">
    <!-- служба использует объявленное разрешение -->
    <intent-filter>
        <action android:name="ru.evotor.event.sell.BARCODE_RECEIVED" />
        <category android:name="android.intent.category.EVOTOR" />
    </intent-filter>
</service>
```

## Обработка события

Чтобы добавить позицию в чек продажи:

1. Унаследуйте службу `BarcodeEventHandlerService` от службы [`SellIntegrationService`](./ссылка на javadoc).
2. Переопределите метод `handleEvent()` и передайте в него событие `ReturnPositionsForBarcodeRequestedEvent`.
3. Верните результат `ReturnPositionsForBarcodeRequestedEvent.Result()`.

   Результат должен содержать список позиций чека продажи и флаг, который сообщает, что приложение может (`true`) или не может (`false`) создать новый товар, если по полученному штрихкоду найти товар не удалось.

## Пример

```kotlin
open class BarcodeReceiverIntegration : SellIntegrationService() {

    open val v: Int = 1

    private val sp: SharedPreferences by lazy { getSharedPreferences("test", Context.MODE_PRIVATE) }

    private fun get(key: String): Boolean {
        return sp.getBoolean(key, false)
    }

    /*
        Логика работы точки интеграции перехвата сканированного barcode

        Кассир сканирует штрихкод, штрихкод отправляется в интеграционные приложения, подписанные на событие сканирования
        Сначала всем подписанным интеграциям прилетает event, содержащий штрихкод, и поле creatingNewProduct == false.
        Интеграция не должна создавать товар, если creatingNewProduct == false.
        Интеграция выполняет поиск товара и формирование позиций чека.
        Одна интеграция может вернуть на один штрихкод несколько позиций.
        Если интеграция может создать товар по данному штрихкоду, то она должна вернуть признак iCanCreateNewProduct == true.
        Если интеграция не хочет создавать товар по данному штрихкоду - вернуть iCanCreateNewProduct == false.
        Параллельно будет выполнен поиск внутри локальной ТУ EvotorPOS.
        Если суммарно будет найден один товар/вернутся позиции из одной интеграции - товар/позиции будут добавлены в чек.
        Если суммарно будет найдено n товаров/интеграций вернут позиции, пользователю будет предложен выбор, что добавить в чек.
        Если не будет найдено ни одного товара и ни одной позиции во всех интеграциях - будет стандартный диалог "Товар не найден"
        Если кассир выбирает "создать товар", и несколько интеграций хотят создать товар, кассиру будет предложен выбор интеграции для создания товара.
        После выбора интеграции, или в случае только одной интеграции, готовой создать товар, в интеграцию будет переслан event,
        содержащий отсканированный штрихкод и поле creatingNewProduct == true.
        Получив event с полем creatingNewProduct == true интеграция запускает создание товара через другие известные точки интеграции, а из метода необходимо вернуть null.
        После создания интеграцией товара (пример в CreateProductActivity) необходимо вернуть список позиций для добавления в чек.
        Рекомендуется вернуть одну позицию, содержащую ссылку на созданный товар. Пример возврата позиций в CreateProductActivity.
        Если же ни одна интеграция не была готова создать товар по штрихкоду, будет вызван стандартный диалог создания товара с отсканированным штрихкодом.
     */
    override fun handleEvent(
            /*
                ReturnPositionsForBarcodeRequestedEvent(
                    val barcode: String, -- строка, содержащая штрихкод (датаматрикс, gs1, ean8, ean13 -- всё, что прилетит со сканера)
                    val creatingNewProduct: Boolean -- признак необходимости создания нового товара по полученному штрихкоду
                )
             */
            event: ReturnPositionsForBarcodeRequestedEvent
    ):
            /*
                ReturnPositionsForBarcodeRequestedEvent.Result(
                    val positions: List<Position>, -- список позиций для добавления в чек
                    val iCanCreateNewProduct: Boolean -- признак того, что интеграция может и хочет создать товар по полученному штрихкоду
                )
             */
            ReturnPositionsForBarcodeRequestedEvent.Result?
    {

        //Создаём список позиций, который будет возвращён в результате
        val pos = mutableListOf<Position>()

        //Запускаем операцию создания новой карточки товара, если creatingNewProduct == true.
        if (event.creatingNewProduct) {
            startIntegrationActivity(Intent(this, CreateProductActivity::class.java).apply {
                putExtra("SCANNED_BARCODE", event.barcode)
            })
            return null
        } else {
            //Наполняем список позиций
        }
        return ReturnPositionsForBarcodeRequestedEvent.Result(pos, get("editv$v"))
    }
}
```

## См. также

* [Обработка событий смарт-терминала](./ссылка на новый раздел)

# Обработка событий смарт-терминала

Обработка событий смарт-терминала является одним из способов взаимодействия вашего приложения со Evotor POS.
