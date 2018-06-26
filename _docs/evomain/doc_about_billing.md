---
title: О биллинге
keywords:
sidebar: evomain
permalink: doc_about_billing.html
tags:
---

Эвотор определяет кто выполняет биллинг пользователя в зависимости от того, работает пользователь с существующей учётной записью стороннего сервиса или создаёт новую из Личного кабинета.

### Кто выполняет биллинг

Эвотор выполняет биллинг, если пользователь создал новую учётную запись в стороннем сервисе после установки приложения, из Личного кабинета Эвотор (сторонний сервис должен поддерживать URL [/api/v1/user/create](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1verify%2Fpost)). В этом случае, при создании новой учётной записи, сторонний сервис возвращает параметр `"hasBilling": "False"`. Впоследствии, при авторизации с помощью такой учётной записи, сторонний сервис всегда возвращает `"hasBilling": "False"`.

Сторонний сервис выполняет биллинг, если после установки приложения пользователь авторизовался с помощью учётной записи, созданной не из Личного кабинета. (сторонний сервис должен поддерживать URL [/api/v1/user/verify](https://api.evotor.ru/docs/#tag/Vebhuki-zaprosy%2Fpaths%2F~1partner.ru~1api~1v1~1user~1verify%2Fpost)). Сторонний сервис возвращает параметр `"hasBilling": "True"` после авторизации пользователя, если биллинг выполняет сторонний сервис.

Все изменения, связанные с подпиской, Эвотор отправляет по адресу [partner.ru/api/v1/user/event](https://api.evotor.ru/docs/#tag/Vebhuki-uvedomleniya%2Fpaths%2F~1partner.ru~1api~1v1~1user~1event%2Fpost).


### Данные о биллинге пользователей

Эвотор отправляет данные о биллинге пользователей на URL `partner.ru/api/v1/user/event` в форме следующих сообщений:

  * `SubscriptionCreated` – новая подписка.
  * `SubscriptionActivated` – активирована платная фаза подписики. Эвотор передаёт сообщение, если пользователь решил продолжить использовать приложение после завершения пробного периода.
  * `SubscriptionRenewed` – подписка продлена на следующий период.
  * `SubscriptionCancelled` – подписка отменена.
  * `SubscriptionTermsChanged` – изменились условия подписки, например, тарифный план или количество устройств.

    Стороннему сервису достаточно подписаться на эти сообщения. Эвотор гарантирует доставку сообщений и не требует подтверждения получения.

    Подробное описание передаваемых данных и способов авторизации смотрите в [справочнике API](https://api.evotor.ru/docs).

### Диаграммы последовательности действий, при которых Эвотор передаёт сообщения

<!--
title "Диаграма последовательности установки и изменения условий подписки приложения в ЛК"
participant ЛК

participant Счёт
participant Планировщик
participant Оплата


ЛК -> Счёт : CreateSubscription
note right of ЛК
Типы подписок:
* OTP (разовая оплата)
* Subscription (подписка)
* Installment (рассрочка)
end note
Счёт -> Планировщик : SubscriptionCreated + AddonsUpdated / SubscriptionRenew + AddonsUpdated
Планировщик -> Планировщик :
Планировщик -> Счёт: TrialEnded
Счёт -> Оплата : SubscriptionInvoiced
note left of Счёт
Передаваемые параметры:
* UserId
* ProductId
* SubscriptionId
end note
Счёт <-- Оплата : PaymentFailed
Счёт -> ЛК : SubscriptionTerminated
Счёт <-- Оплата : PaymentSucceeded
Счёт -> Планировщик : SubscriptionActivated

ЛК -> Счёт : ChangeTerms + Addons
Счёт -> Оплата : SubscriptionTermsChangeRequested
Счёт <- Оплата : PaymentSucceeded
Счёт -> Планировщик : TermsChanged / AddonsUpdated



title "Диаграма последовательности отмены и возобновления подписки на приложение в ЛК"
actor Пользователь
participant ЛК
participant Корзина
participant Счёт
participant Планировщик
participant Оплата


Пользователь -> ЛК : Cancel
note right of Пользователь
Пользователь отменяет подписку в ЛК
end note
ЛК -> Счёт: CancelSubscription
Счёт -> Счёт : SubscriptionCancellationRequested
Планировщик -> Счёт : Renew
note left of Планировщик
Попытка продления подписки
end note


Счёт -> ЛК : SubscriptionTerminated
Пользователь -> ЛК : Renew + Addon
ЛК -> Счёт : Renew + Addon
Счёт ->Оплата : SubscriptionRenewRequested
Оплата -> Счёт : PaymentSucceeded
Счёт -> Планировщик : SubscriptionRenewed / SubscriptionTermsChanged / AddonsUpdated



title "Диаграма последовательности приобретения приложения с помощью Корзины"
actor Пользователь
participant ЛК
participant Корзина
participant Счёт
participant Планировщик
participant Оплата




Пользователь -> Корзина : putProduct
...
Пользователь -> Корзина : createOrder

Пользователь -> Корзина : invoiceOrder
Корзина -> Оплата : OrderInvoiced

Оплата -> Корзина : PaymentSucceeded
Корзина -> ЛК : ProductReady
Пользователь -> ЛК : configureProduct
ЛК -> Счёт : AppConfigured
Счёт -> Оплата : SubscriptionCreated



title "Диаграма последовательности рекуррентной оплаты"

participant Счёт
participant Планировщик
participant Оплата

Счёт <- Планировщик : Renew
Счёт -> Оплата : PaymentAttempt
Счёт <- Оплата : PaymentFailed
Счёт -> Оплата : Dunning

...Всего 5 попыток оплаты с интервалом один день...
Счёт <- Оплата : PaymentSucceeded
-->

{% include image.html file="subscription_changed_within_lk.png" url="images/subscription_changed_within_lk.png" %}
{% include image.html file="user_interactions_with_subscription.png" url="images/user_interactions_with_subscription.png" %}
{% include image.html file="basket_usage.png" url="images/basket_usage.png" %}
{% include image.html file="recurrent_payment.png" url="images/recurrent_payment.png" %}
