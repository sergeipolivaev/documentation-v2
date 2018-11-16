---
title: Запись в чек данных агентской схемы
permalink: doc_java_counterparties.html
sidebar: evojava
product: Java SDK
---

Апи смарт-терминала позволяет записывать данные агентской схемы (агентские реквизиты) в чек. Для этого используется класс [`AgentRequisites.kt`](./integration-library/ru/evotor/framework/receipt/position/AgentRequisites.html), экземпляр которого передаётся в позицию чека. Этот класс состоит из данных контрагентов (участников агентского договора), которые представлены классами:

* `Agent`;
* `Principal`;
* `SubAgent`;
* `TransactionOperator`.

Некоторые из полей этих классов помечены аннотацией `@FfdTag`. Это означает, что такие поля будут записаны в кассу в виде тегов фискального документа с указанными номерами.

Для различных типов агентов или субагентов агентские реквизиты должны содержать различный набор необходимых данных. Этот набор определён форматом фискальных данных (ФФД).

Чтобы создать агентские реквизиты с необходимыми данными для соответствующего типа агента или субагента используйте метод `create*ТипАгента`. Например:

```kotlin
AgentRequisites.createForAgent(principalInn, principalPhones)
```

{% include important.html content="Используйте только те типы агентов или субагентов, которые были указаны при регистрации кассы. Вы можете получить их с помощью методов [`getRegisteredAgentTypes`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#getRegisteredAgentTypes-context-) или [`getRegisteredSubagentTypes`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#getRegisteredSubagentTypes-context-) класса [`KktApi.kt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html)." %}

Чтобы записать агентские реквизиты в чек вы можете, например, создать [интеграционную службу, подписанную на события изменения позиций чека](./doc_java_receipt_interactions.html). В списке изменений (`changes`) в полученном событии выберите все намерения добавления позиций в чек ([`PositionAdd`](./integration-library/ru/evotor/framework/core/action/event/receipt/changes/position/PositionAdd.html)) и установите для позиции каждого из этих намерений ваши агентские реквизиты. Для этого используйте класс `Position.Builder` и его метод [`setAgentRequisites`](./integration-library/ru/evotor/framework/receipt/Position.Builder.html#setAgentRequisites--):

```kotlin
val resultPosition = Position.Builder.newinstace(sourcePosition).setAgentRequisites(myRequisites).build()
```

Для каждой из полученных позиций создайте намерение изменения позиции `PositionEdit`, после чего примените результат вашей службы:

```kotlin
callback.onResult(BeforePositionsEditedEventResult(myEditions))
```

***

*Итак, чтобы добавить в чек данные агентской схемы:*

1. Создайте интеграционную службу, подписанную на события изменения позиций чека.
2. Создайте экземпляр класса `AgentRequisites` для необходимого вам типа агента.
3. С помощь метода `setAgentRequisites` класса `Position.Buider` добавьте созданные вами агентские реквизиты в необходимые вам позиции.
4. Примените результат службы с намерениями изменения необходимых вам позиций.
