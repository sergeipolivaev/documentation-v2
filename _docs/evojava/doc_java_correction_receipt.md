---
title: Печать чека коррекции
permalink: doc_java_correction_receipt.html
sidebar: evojava
product: Java SDK
---

<!-- Новые классы:

* `src/main/java/ru/evotor/framework/core/ContextExt.kt` -- надстройка над стандартным классом контекста приложения. Возможно, понадобится при описании архитектуры и написании концептуальных и базовых разделов.
* `src/main/java/ru/evotor/framework/kkt/FiscalTags.kt` -- новый класс, содержащий фискальные теги.
* `src/main/java/ru/evotor/framework/kkt/api/DocumentRegistrationCallback.kt` -- новый класс колбэка регистрации документов. Документирование не потребуется.
* `src/main/java/ru/evotor/framework/kkt/event/CorrectionReceiptRegistrationRequestedEvent.kt` -- новое событие, которое приходит при запросе регистрации чека коррекции. Необходимо исправить раздел про точки интеграции.
* `src/main/java/ru/evotor/framework/kkt/event/handler/service/KktBacksideIntegrationService.kt` -- какой-то новый класс службы, не знаю зачем нужен. Надо выяснить. Какая-то сложная замута с тем, что помимо обычного приёмника есть ещё какая-то служба. Видимо, она необходима для взаимодействия с Evotor Pos.
* `src/main/java/ru/evotor/framework/payment/AmountOfRubles.kt` -- не знаю зачем нужен.
* `src/main/java/ru/evotor/framework/payment/PaymentMean.kt` -- не знаю зачем нужен.
* `src/main/java/ru/evotor/framework/receipt/correction/CorrectionType.kt` -- новый класс-перечисление типов коррекции (тег 1173).
* `src/main/java/ru/evotor/framework/receipt/position/VatRate.kt` -- новый класс-перечисление ставок НДС.

Изменённые классы:

* `src/main/java/ru/evotor/framework/FiscalDocument.kt` -- все фискальные теги вынесены в новый класс.
* `src/main/java/ru/evotor/framework/counterparties/collaboration/agent_scheme/*.kt` -- участники агентского договора изменены, т.к. фискальные теги выделены в новый класс (см. выше). Возможно, потребуется изменение раздела про агентскую схему.
* `src/main/java/ru/evotor/framework/kkt/FiscalRequisite.kt` -- небольшое изменение в флаге множественных значений фискального реквизита (флаг выделен в companion object). Документирование не потребуется.
* `src/main/java/ru/evotor/framework/kkt/api/KktApi.kt` -- добавлен новый метод регистрации чека коррекции.
* `src/main/java/ru/evotor/framework/receipt/FiscalReceipt.kt` -- изменён, потому что все теги вынесены в отдельный класс. -->

Чек коррекции необходим для исправления разницы между поступившей выручкой и данных о выручке, переданных в ФНС. Такая разница может возникнуть из-за ошибок кассира или технических сбоев.

{% include note.html content="Чек коррекции необходимо оформлять в течение кассовой смены, в день, когда была допущена ошибка или любой последующий день. [Подробнее об оформлении чеков коррекции](https://www.nalog.ru/rn27/news/activities_fts/7636412/)." %}

Чтобы напечатать чек коррекции используйте метод [`registerCorrectionReceipt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#registerCorrectionReceipt-context-settlementType-taxationSystem-correctionType-basisForCorrection-prescriptionNumber-correctableSettlementDate-amountPaid-paymentMean-vatRate-correctionDescription-callback-).

Часть параметров метода записываются в кассу в виде тегов фискальных документов. Такие параметры отмечены тегом `@FiscalRequisite`. Все фискальные теги хранятся в классе [`FiscalTags`](./integration-library/ru/evotor/framework/kkt/FiscalTags.html).

Вы также можете получить список фискальных документов с помощью метода [`getFiscalReceipts(context: Context, receiptUuid: String)`](./integration-library/ru/evotor/framework/receipt/ReceiptApi.html#getFiscalReceipts-context-receiptUuid-).
