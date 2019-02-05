---
title: Товароучёт
sidebar: evojava
permalink: doc_java_inventory.html
tags:
product: Java SDK
---

{% include important.html content="В связи с изменением законодательства, с первого января 2019 года значения `VAT_18` и `VAT_18_118` (класс [`TaxNumber`](./integration-library/ru/evotor/framework/receipt/TaxNumber.html)) могут указывать как на 18%, так и на 20% ставку НДС. Наименования значений (`VAT_18` и `VAT_18_118`), при этом не меняются.<br> Реальное значение ставки НДС зависит от того, имеет пользователь доступ к новому значению НДС или нет. Например, пользователь установил приложение [\"Пакет обновлений\"](https://market.evotor.ru/store/apps/9ddd7629-3397-47eb-a83a-1d987aa71610)." %}

## Методы

Класс [`InventoryApi`](./integration-library/ru/evotor/framework/inventory/InventoryApi.html) содержит методы, описанные ниже.

### Получить все штрихкоды товара:

```java
fun getAllBarcodesForProduct(context: Context, productUuid: String): List<String>
```

Где:

* `context` – контекст приложения.
* `productUuid` – идентификатор товара в формате `uuid4`.
* `List<String>` – список всех штрихкодов товара.

### Поиск товара по идентификатору:

```java
fun getProductByUuid(context: Context, uuid: String): ProductItem?
```

Где:

* `context` – контекст приложения.
* `productUuid` – идентификатор товара в формате `uuid4`
* `ProductItem` – абстракция над товарами и товарными группами.

Поля, одинаковые для товара и группы:

* `uuid` – идентификатор товара или группы в формате `uuid4`.
* `parentUuid` – идентификатор родительской группы в формате `uuid4`.
* `code` – код товара из 1С, если нет, то null.
* `name` – наименование товара или группы.
* `taxNumber` – налоговая ставка.

Поля, уникальные для товаров:

* `type` – тип товара. Допустимые значения:

  * NORMAL (обычный товар);
  * ALCOHOL_MARKED (маркированный алкоголь);
  * ALKOHOL_NOT_MARKED (немаркированный алкоголь);
  * SERVICE (услуга);
  * TOBACCO_MARKED (маркированный табак).

* `price` – цена товара.
* `quantity` – количество товара.
* `description` – описание товара.
* `measureName` – единицы измерения товара.
* `measurePrecision` – точность измерения.
* `alcoholByVolume` – крепость алкоголя. Если указан обычный товар, используется значение null.
* `alcoholProductKindCode` – идентификатор алкогольной продукции в формате uuid4.
* `tareVolume` – объём тары алкогольной продукции.

### Получить возможные дополнительные поля:

```java
fun getField(context: Context, fieldUuid: String): Field?
```

Где:

* `context` - контекст приложения
* `productUuid` - uuid товара
* `Field` – результат. Может быть одного из двух типов: TextField и DictionaryField.

  Независимо от типа, содержит поля:
   `name` – имя поля.
   `fieldUUID` – идентификатор поля в формате `uuid4`.
   `title` – заголовок, который отображается в интерфейсе смарт-терминала.
   `type` – тип поля: TEXT_FIELD или DICTIONARY_FIELD.

   Поля, уникальные для типа TEXT_FIELD:

   * `data` – Валидный JSON-объект, который содержит данные, отображаемые с помощью JavaScript в интерфейсе смарт-терминала.

   Поля, уникальные для типа DICTIONARY_FIELD:

   * `multiple` –	включает или выключает возможность выбора нескольких значений.
   * `items` – массив возможных значений. Массив содержит поля `title` – заголовок элемента управления, который отображается пользователю и `value` – идентификатор элемента управления.

### Получить значения дополнительных полей товара:

```java
fun getProductExtras(context: Context, productUuid: String): List<ProductExtra>
```
Где:

* `context` - контекст приложения
* `productUuid` - uuid товара
* `List<ProductExtra>` – в качестве результата будет возвращен список значений дополнительных полей товара

Объект `ProductExtra` содержит в себе следующие данные:

* `uuid` – uuid значения дополнительного поля товара.
* `name` – имя дополнительного поля товара.
* `fieldUUID` – uuid дополнительного поля товара.
* `fieldValue` – строка содержащая значение дополнительного поля в определенном формате:

    * для текстового поля – строка обрамленная кавычками ("785af1da-4053-4214-abd6-71c9cd4b5800").
    * для поля из словаря – массив uuid элементов (["61bff019-5040-40cd-bedf-d854ac935f6c","b993bd2a-8f6a-4fbc-b916-2d9786cd5def"]).

* `data` - дополнительные данные от приложения.

## Пример

Пример работы с Inventory API в [демонстрационном приложении](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/InventoryApiActivity.java).
