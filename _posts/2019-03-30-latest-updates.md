---
title: Март
sidebar: evomain
permalink: march_updates.html
summary: "В API работы с кассой добавлен метод печати чека коррекции, а так же сделан ряд сопутствующих изменений и исправлений."
published: true
github_button: false
---

В API работы с кассой добавлен метод печати чека коррекции, а так же сделан ряд сопутствующих изменений и исправлений.

## Добавлено {#added}

* В класс [`KktApi.kt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html) добавлен метод [`registerCorrectionReceipt`](./integration-library/ru/evotor/framework/kkt/api/KktApi.html#isVatRate20Available-context-). С помощью метода вы можете [печатать чеки коррекции](./doc_java_correction_receipt.html).
* Добавлен новый класс с перечислением возможных ставок НДС -- [`VatRate.kt`](./integration-library/ru/evotor/framework/receipt/position/VatRate.html).

## Изменено {#changed}

* Фискальные теги вынесены в отдельный класс [`FiscalTags`](./integration-library/ru/evotor/framework/kkt/FiscalTags.html). Изменение затронуло классы [участников агентской схемы](./integration-library/ru/evotor/framework/counterparties/collaboration/agent_scheme/package-summary.html) и [фискальных документов](./integration-library/ru/evotor/framework/FiscalDocument.html).
