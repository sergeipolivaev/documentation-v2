---
title: Комбинированная оплата
sidebar: evojava
permalink: doc_java_сombined_payment_old.html
tags:
product: Java SDK
---

Комбинированная оплата позволяет клиентам оплачивать часть счёта наличными, а другую часть с помощью карты.

Чтобы поддержать комбинированную оплату в своём приложении, вам потребуется создать соответствующую службу.

## Добавление комбинированной оплаты в приложение

_Чтобы добавить комбинированную оплату в приложение:_

1. В файле `AndroidManifest.xml` добавьте разрешение:

   ```xml
   <uses-permission android:name="ru.evotor.permission.sell.payment.COMBINED" />
   ```

2. С помощью мастера Android Studio создайте новую службу `CombinedPaymentService`.
3. В файле `AndroidManifest.xml`, в секции службы `CombinedPaymentService` добавьте фильтры намерений:

   ```xml
   <intent-filter android:priority="20">
     <category android:name="android.intent.category.DEFAULT" />
     <action android:name="evo.v2.receipt.sell.payment.SELECTED" />
   </intent-filter>
   ```

4. Измените службу `CombinedPaymentService` следующим образом:

   ```kotlin
   class CombinedPaymentService : IntegrationService() {
    override fun createProcessors(): Map<String, ActionProcessor>? {
        val map = HashMap<String, ActionProcessor>()

        map.put(
                PaymentSelectedEvent.NAME_SELL_RECEIPT,
                object : PaymentSelectedEventProcessor() {
                    override fun call(s: String, combinedPaymentEvent: PaymentSelectedEvent, callback: ActionProcessor.Callback) {
                        val receipt = ReceiptApi.getReceipt(applicationContext, Receipt.Type.SELL)
                        if (receipt != null) {
                            val discountMap = HashMap<String, BigDecimal>()

                            receipt.getPositions().forEach { position ->
                                val discount = receipt.printDocuments.filter { it.positions.contains(position) }.firstOrNull()?.discounts?.get(position.uuid)
                                discountMap.put(position.uuid, discount ?: BigDecimal.ZERO)
                            }

                            var sum = receipt.getPositions().fold(BigDecimal.ZERO,
                                    { acc, pos ->
                                        MoneyCalculator.add(acc, pos.getTotal(discountMap[pos.uuid]))
                                    })
                            val half = MoneyCalculator.divide(sum, BigDecimal("2"))
                            val paymentPurposes = arrayListOf<PaymentPurpose>().apply {
                                val cash = PaymentSystemApi.getPaymentSystems(applicationContext).find { it.first.paymentType == PaymentType.CASH }
                                val electron = PaymentSystemApi.getPaymentSystems(applicationContext).find { it.first.paymentType == PaymentType.ELECTRON }
                                add(PaymentPurpose("0", cash?.first?.paymentSystemId,
                                        half, null, "Налик"))
   //                                add(PaymentPurpose("0", cash?.first?.paymentSystemId, // налик больше, чем нужно
   //                                        sum, null, "Налик"))
   //                                add(PaymentPurpose("1", electron?.first?.paymentSystemId,
   //                                       sum, null, "Лол, ты платишь картой")) // картой больше, чем нужно
                                add(PaymentPurpose("1", electron?.first?.paymentSystemId,
                                        MoneyCalculator.subtract(sum, half), null, "Лол, ты платишь картой"))
                            }
                            if (combinedPaymentEvent.paymentSystem.paymentType == PaymentType.COMBINED) {
                                callback.onResult(
                                        PaymentSelectedEventResult(
                                                null,
                                                paymentPurposes
                                        )
                                )
                            } else {
                                callback.onResult(
                                        PaymentSelectedEventResult(
                                                null,
                                                arrayListOf(PaymentPurpose(
                                                        "2",
                                                        combinedPaymentEvent.paymentSystem.paymentSystemId,
                                                        sum,
                                                        null,
                                                        "Игнорим"
                                                ))
                                        )
                                )
                            }
                        }
                    }
                }
        )

        return map
    }
   }
   ```
