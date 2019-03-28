---
title: Печать чека коррекции
permalink: doc_java_correction_receipt.html
sidebar: evojava
product: Java SDK
---

Чек коррекции необходим для исправления разницы между поступившей выручкой и данных о выручке, переданных в ФНС. Такая разница может возникнуть из-за ошибок кассира или технических сбоев.

{% include note.html content="Чек коррекции необходимо оформлять в течение кассовой смены, в день, когда была допущена ошибка, или любой последующий день. [Подробнее об оформлении чеков коррекции](https://www.nalog.ru/rn27/news/activities_fts/7636412/)." %}

Чтобы напечатать чек коррекции используйте метод [`registerCorrectionReceipt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#registerCorrectionReceipt-context-settlementType-taxationSystem-correctionType-basisForCorrection-prescriptionNumber-correctableSettlementDate-amountPaid-paymentMean-vatRate-correctionDescription-callback-).

Часть параметров метода записываются в кассу в виде тегов фискальных документов. Такие параметры отмечены аннотацией `@FiscalRequisite`. Все фискальные теги хранятся в классе [`FiscalTags`](./integration-library/ru/evotor/framework/kkt/FiscalTags.html).
