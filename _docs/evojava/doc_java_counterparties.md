---
title: Запись в чек данных агентской схемы
permalink: doc_java_counterparties.html
sidebar: evojava
product: Java SDK
---

API смарт-терминала позволяет записывать данные агентской схемы (агентские реквизиты) в чек. Для этого используется класс [`AgentRequisites.kt`](./integration-library/ru/evotor/framework/receipt/position/AgentRequisites.html), экземпляр которого передаётся в позицию чека.

Этот класс состоит из данных контрагентов (участников [агентского договора](./doc_agency_agreement.html)), которые представлены классами:

* `Agent`;
* `Principal`;
* `Subagent`;
* `TransactionOperator`.

Некоторые из полей этих классов помечены аннотацией `@FfdTag`. Это означает, что такие поля будут записаны в кассу в виде тегов фискального документа с указанными номерами.

Для различных типов агентов или субагентов агентские реквизиты должны содержать различный набор необходимых данных. Этот набор определён форматом фискальных данных (ФФД).

{% include tip.html content="Используйте метод [`getRegisteredFfdVersion`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#getRegisteredFfdVersion-context-) класса [`KktApi.kt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html), чтобы узнать на какую версию фискальных документов зарегистрирована касса пользователя вашего приложения." %} 

Чтобы создать агентские реквизиты с необходимыми данными для соответствующего типа агента или субагента используйте метод `create*ТипАгента`. Например:

```kotlin
AgentRequisites.createForAgent(principalInn, principalPhones)
```

{% include important.html content="Используйте только те типы агентов или субагентов, которые были указаны при регистрации кассы. Вы можете получить их с помощью методов [`getRegisteredAgentTypes`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#getRegisteredAgentTypes-context-) или [`getRegisteredSubagentTypes`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#getRegisteredSubagentTypes-context-) класса `KktApi.kt`." %}

Чтобы записать агентские реквизиты в позицию используйте метод [`setAgentRequisites`](./integration-library/ru/evotor/framework/receipt/Position.Builder.html#setAgentRequisites--) класса `Position.Builder`:

```kotlin
val resultPosition = Position.Builder.newinstace(sourcePosition).setAgentRequisites(myRequisites).build()
```

Чтобы добавить полученную позицию в чек вы можете, например, создать [интеграционную службу, подписанную на события изменения позиций чека](./doc_java_receipt_interactions.html) или [использовать команду открытия чека](doc_java_receipt_creation.html).

***

*Итак, чтобы добавить в чек данные агентской схемы:*

1. Создайте экземпляр класса `AgentRequisites` для необходимого вам типа агента.
2. С помощь метода `setAgentRequisites` класса `Position.Buider` добавьте созданные вами агентские реквизиты в необходимые вам позиции.
3. Добавьте полученную позицию в чек с помощью интеграционной службы или команды открытия чека.
