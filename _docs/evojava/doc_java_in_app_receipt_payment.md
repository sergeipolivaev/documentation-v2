---
title: Оплата чеков из интерфейса приложения
permalink: doc_java_in_app_receipt_payment.html
sidebar: evojava
product: Java SDK
---

Ваше приложение может передать текущий открытый чек продажи выбранному *исполнителю* (класс [PaymentPerformer.kt](./integration-library/ru/evotor/framework/component/PaymentPerformer.html)) или *делегатору* (класс [PaymentDelegator.kt](./integration-library/ru/evotor/framework/component/PaymentDelegator.html)) платежей. Для этого необходимо вызвать соответствующий метод интерфейса [SellApi.kt](./integration-library/ru/evotor/framework/receipt/formation/api/SellApi.html). Такой подход сокращает время, необходимое для оплаты, но при этом лишает пользователей возможности применить скидку на чек.

*Чтобы запустить процесс оплаты чека из интерфейса приложения*:

1. Получите текущий открытый чек продажи, с помощью метода [getReceipt(context: Context, type: Receipt.Type)](./integration-library/ru/evotor/framework/receipt/ReceiptApi.html#getReceipt-context-type-).

   {% include note.html content="Из приложения можно оплачивать только чеки продажи, поэтому в качестве типа чека передавайте `Receipt.Type.SELL`." %}

2. Получите список всех компонентов установленных приложений, способных выполнить оплату:

   * Для получения всех исполнителей платежей используйте метод [`getAllPaymentPerformers()`](./integration-library/ru/evotor/framework/component/PaymentPerformerApi.html#getAllPaymentPerformers-packageManager-).
   * Для получения всех делегаторов платежей используйте метод [`getAllPaymentDelegators()`](./integration-library/ru/evotor/framework/component/PaymentDelegatorApi.html#getAllPaymentDelegators-packageManager-).

3. Передайте чек выбранному исполнителю или делегатору платежей с помощью соответствующего метода [`moveCurrentReceiptDraftToPaymentStage()`](./integration-library/ru/evotor/framework/receipt/formation/api/SellApi.html#moveCurrentReceiptDraftToPaymentStage-context-paymentPerformer-callback-) интерфейса [SellApi.kt](./integration-library/ru/evotor/framework/receipt/formation/api/SellApi.html).

   {% include note.html content="Интерфейс содержит два метода с одинаковым названием, но в один метод передаётся экземпляр исполнителя платежа, а в другой экземпляр делегатора." %}

## Пример

Пример ниже показывает как можно получить текущий открытый чек и передать его исполнителю платежа.

```java
//Получаем текущий открытый чек.
Receipt receipt = ReceiptApi.getReceipt(MainActivity.this, Receipt.Type.SELL);
if (receipt == null) return;
//Получаем идентификатор чека.
String uuid = receipt.getHeader().getUuid();
if (uuid == null) return;
//Создаём список всех компонентов, способных выполнить оплату.
List<PaymentPerformer> paymentPerformers = PaymentPerformerApi.INSTANCE.getAllPaymentPerformers(getPackageManager());
AlertDialog.Builder builderSingle = new AlertDialog.Builder(MainActivity.this);

//Показываем пользователю диалоговое окно с возможностью выбрать исполнителя платежа, например, Наличными или Банковской картой.
final ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(MainActivity.this, android.R.layout.select_dialog_singlechoice);
for (int i = 0; i < paymentPerformers.size(); i++) {
    arrayAdapter.add(paymentPerformers.get(i).getPaymentSystem().getUserDescription());
}

builderSingle.setAdapter(arrayAdapter, new DialogInterface.OnClickListener() {
    @Override
    //По выбору пользователя выполняем оплату и печатаем чек.
    public void onClick(DialogInterface dialog, int which) {
        SellApi.moveCurrentReceiptDraftToPaymentStage(MainActivity.this, paymentPerformers.get(which), new ReceiptFormationCallback() {
            @Override
            public void onSuccess() {
                Toast.makeText(MainActivity.this, "Оплата прошла успешно", Toast.LENGTH_LONG).show();
            }

            @Override
            public void onError(ReceiptFormationException e) {
                Toast.makeText(MainActivity.this, e.getCode() + " " + e.getMessage(), Toast.LENGTH_LONG).show();
            }
        });
    }
});
builderSingle.show();
```
