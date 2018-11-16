---
title: Выкуп (товара у клиента)
permalink: rest_buy.html
sidebar: evorestreference
product: Customer API
---

### `BUY`

```json
{
  "body": {
    "positions": [
      {
        "position": {
          "agentRequisites": {
            "counterpartyIndexes": [
              0,
              1,
              2,
              3
            ],
            "operationDescription": "Some description"
          },
          "product_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "parent_id": "1c4ba9e5-27f1-40a6-87a7-dfb08aa0cca8",
          "attributes_choices": {
            "attribute_id": "5f4c26b9-3a19-4f6e-bb67-5c71efa712ad",
            "attribute_name": "Цвет",
            "choice_id": "ec990252-4de7-4a00-9782-f65a8e847d2a",
            "choice_value": "Бесцветный"
          },
          "quantity": 123.123,
          "initial_quantity": 123.123,
          "product_type": "NORMAL",
          "mark": null,
          "alcohol_by_volume": 123.123,
          "alcohol_product_kind_code": 123.123,
          "tare_volume": 123.123,
          "code": "42",
          "bar_сode": null,
          "product_name": null,
          "measure_name": null,
          "id": 12,
          "uuid": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "price": 12.12,
          "cost_price": 12.12,
          "result_price": 12.12,
          "sum": 12.12,
          "result_sum": 12.12,
          "tax": {
            "type": "NO_VAT",
            "sum": 0,
            "result_sum": 0
          },
          "doc_distributed_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345
          },
          "position_discount": {
            "discount_type": "SUM",
            "discount_sum": 12.12,
            "discount_percent": 12.12345,
            "discount_price": 12.12
          },
          "extra_keys": [
            {
              "extra_key": {
                "identity": "string",
                "app_id": "string",
                "description": "string"
              }
            }
          ],
          "print_group_id": "1022722e-9441-4beb-beae-c6bc5e7af30d",
          "splitted_positions": [
            {
              "splitted_position": {
                "quantity": 123.123,
                "result_price": 12.12,
                "result_sum": 12.12,
                "position_discount": 12.12,
                "doc_distributed_discount": 12.12,
                "tax_type": "NO_VAT",
                "result_tax_sum": 12.12
              }
            }
          ]
        }
      }
    ],
    "doc_discounts": [
      {
        "doc_discount": {
          "discount_type": "SUM",
          "discount_sum": 12.12,
          "discount_percent": 12.12345,
          "coupon": "string"
        }
      }
    ],
    "payments": [
      {
        "payment": {
          "id": "string",
          "type": "CASH",
          "sum": 12.12,
          "app_payment": {
            "app_id": "string",
            "name": "string"
          },
          "parts": [
            {
              "print_group_id": "string",
              "part_sum": 12.12,
              "change": 12.12
            }
          ]
        }
      }
    ],
    "print_groups": [
      {
        "print_group": {
          "id": "string",
          "type": "CASH_RECEIPT",
          "org_name": "string",
          "org_inn": "string",
          "org_address": "string",
          "taxation_system": "COMMON"
        }
      }
    ],
    "pos_print_results": [
      {
        "pos_print_result": {
          "print_group_id": "string",
          "receipt_number": 0,
          "document_number": 0,
          "session_number": 0,
          "check_sum": 0,
          "receipt_date": "string",
          "fn_serial_number": "string",
          "kkt_serial_number": "string",
          "kkt_reg_number": "string",
          "fiscal_sign_doc_number": "string",
          "fiscal_document_number": 0
        }
      }
    ],
    "sum": 2123.12,
    "result_sum": 2123.12,
    "customer_email": "ivanov@example.ru",
    "customer_phone": 79876543210
  }
}
```


Имя  | Тип  | Описание
-----|------|--------------
`positions`|`Array of object`|Массив товарных позиций (объектов position) к приёмке.
`positions.position`|`object`|Позиция к продаже.
`positions.position.agentRequisites`|`object`|*Необязательный* Агентские реквизиты. Присутствует в документе, только если на терминале установлено приложение "Агентская схема".
`positions.position.agentRequisites.counterpartyIndexes`|`array`| Индексы контрагентов из списка в заголовке документа
`positions.position.agentRequisites.operationDescription`|`string`|*Необязательный* Описание операции контрагента.
`positions.position.quantity`|`number`|Количество товара, над которыми выполняется операция. Всегда положительное и содержит до трёх знаков в дробной части.
`positions.position.initial_quantity`|`integer`|Остаток товара до выполнения операции. До трёх знаков в дробной части.
`positions.position.product_type`|`string`|Тип товара: `NORMAL` - неалкогольный товар; `ALCOHOL_MARKED` - маркированный алкоголь; `ALCOHOL_NOT_MARKED` - немаркированный алкоголь; `SERVICE` - услуга. В список могут быть добавлены новые типы товаров.
`positions.position.product_name`|`string`|Наименование товара.
`positions.position.measure_name`|`string`|Единица измерения из карточки товара.
`positions.position.product_id`|`string`|Идентификатор товара, уникальный в рамках магазина. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене". Формат `uuid4`, в соответствии с RFC.
`positions.position.price`|`number`|Отпускная стоимость единицы товара. До двух знаков в дробной части.
`positions.position.cost_price`|`number`|Закупочная стоимость единицы товара. До двух знаков в дробной части.
`positions.position.sum`|`number `|Отпускная стоимость товарной позиции (price*quantity). До двух знаков в дробной части.
`positions.position.result_sum`|`number `|Отпускная стоимость товарной позиции с учётом скидок. До двух знаков в дробной части.
`positions.position.code`|`string`|*Необязательный*. Код товара или модификации товара. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене".
`positions.position.bar_code`|`string`|*Необязательный*. Штрихкод, по которому товар добавили в документ приемки.
`positions.position.attributes_choices`|`object`|Объект, содержащий описание характеристик и их значений на момент формирования документа. Присутствует только в случае, если позиция сформирована на основе модификации товара.
`positions.position.attributes_choices.attribute_id`|`string`|Идентификатор характеристики.
`positions.position.attributes_choices.attribute_name`|`string`|Название характеристики.
`positions.position.attributes_choices.choice_id`|`string`|Идентификатор значения характеристики.
`positions.position.attributes_choices.choice_value`|`string`|Текст значения характеристики.
`positions.position.product_id`|`string`|*Необязательный*. Идентификатор товара, уникальный в рамках магазина. Поле не передаётся, если производится продажа или возврат товара "Позиция по свободной цене". Формат `uuid4`, в соответствии с RFC.
`positions.position.parent_id`|`string`|*Необязательный*. Указатель на родительский элемент позиции в древовидной иерархии номенклатуры. Родительским элементом может быть группа товаров или группа модификаций. Формат `uuid4`, в соответствии с RFC.
`positions.position.uuid`|`string`|*Необязательный*. Уникальный идентификатор товарной позиции в чеке. Полезен в случаях, когда нужно программно (средствами SDK) сослаться на конкретную позицию.
`positions.position.mark`|`string`|*Необязательный*. Марка алкогольного товара.
`positions.position.result_price` | `number` |*Необязательный*. Конечная стоимость единицы позиции после всех калькуляций в чеке (скидки на чек и скидки на позицию). Соответствует значению, которое печатается на чеке. До двух знаков в дробной части.
`positions.position.alcohol_product_kind_code`| `integer` |*Необязательный*. Код вида алкогольной продукции ФСРАР.
`positions.position.tare_volume`| `number` |*Необязательный*. Ёмкость тары алкогольной продукции в литрах. До трёх знаков в дробной части.
`positions.position.tax`| `object` |*Необязательный*. Информация о расчете НДС на товарную позицию.
`positions.position.tax.type`| `string` |Ставка НДС. Возможные значения: `NO_VAT` – без НДС; `VAT_0` – основная ставка 0%; `VAT_10` – основная ставка 10%; `VAT_10_110` – расчётная ставка 10%; `VAT_18` – основная ставка 18%; `VAT_18_118` – расчётная ставка 18%.
`positions.position.tax.sum`| `number` |Сумма НДС на товарную позицию без применения скидок.
`positions.position.tax.result_sum`| `number` |Сумма НДС на товарную позицию с учетом скидок.
`positions.position.doc_distributed_discount`| `object` |*Необязательный*.
`positions.position.doc_distributed_discount.discount_type`| `string` | Тип скидки - сумовая или процентная. Возможные значения: `SUM`, `PERC`. **Важно!** Все скидки сейчас на терминале работают как суммовые. Даже если клиент делает процентную скидку – она пересчитывается в суммовую.
`positions.position.doc_distributed_discount.discount_sum`| `number` | Сумма скидки. До двух знаков в дробной части.
`positions.position.doc_distributed_discount.discount_percent`| `number` | Процент скидки. До пяти знаков в дробной части.
`positions.position.position_discount`| `object` |*Необязательный*. Объект скидки на позицию, изначально применённой к конкретной позиции.
`positions.position.position_discount.discount_type`| `object` | Тип скидки - сумовая или процентная. Возможные значения: `SUM`, `PERC`.
`positions.position.position_discount.discount_type`| `string` | Тип скидки - сумовая или процентная. Возможные значения: `SUM`, `PERC`. **Важно!** Все скидки сейчас на терминале работают как суммовые. Даже если клиент делает процентную скидку – она пересчитывается в суммовую.
`positions.position.position_discount.discount_sum`| `number` | Сумма скидки на позицию. До двух знаков в дробной части.
`positions.position.position_discount.discount_percent`| `number` | Процент скидки на позицию. До пяти знаков в дробной части.
`positions.position.position_discount.discount_price`| `number` | Скидка на единицу товара с учетом налогов. До двух знаков в дробной части.
`positions.position.extra_keys`|`Array of object`|*Необязательный*. Массив объектов `extra_key`, соответствующих extra товара, на момент добавления товара в документ.
`positions.position.extra_keys.extra_key`|`object`|*Необязательный*. Массив объектов `extra_key`, соответствующих extra товара, на момент добавления товара в документ.
`positions.position.extra_keys.extra_key.identity`|`string`|*Необязательный*. Уникальный идентификатор дополнительного атрибута товара. Формат – uuid4, в соответствии с RFC.
`positions.position.extra_keys.extra_key.app_id`|`string`|*Необязательный*. Идентификатор приложения, в рамках которого к товарной позиции привязан дополнительный атрибут.
`positions.position.extra_keys.extra_key.description`|`string`|*Необязательный*. Описание дополнительного атрибута для визуализации на смарт-терминале.
`positions.position.print_group_id`|`string`|*Необязательный*. Идентификатор печатной группы при разбивке чека. Формат – uuid4, в соответствии с RFC.
`positions.position.splitted_positions`|`Array of object`|*Необязательный*. Массив объектов `splitted_position`. Используется, когда применение скидок к позициям приводит к дроблению цен с точностью меньше одной копейки.
`positions.position.splitted_positions.splitted_position.`|`object`|Позиция к продаже.
`positions.position.splitted_positions.splitted_position.quantity`|`number`|Количество товара, над которыми выполняется операция. Всегда положительное и содержит до трёх знаков в дробной части.
`positions.position.splitted_positions.splitted_position.result_price`|`number`|Конечная стоимость единицы позиции после всех калькуляций в чеке (скидки на чек и скидки на позицию). Соответствует значению, которое печатается на чеке. До двух знаков в дробной части.
`positions.position.splitted_positions.splitted_position.result_sum`|`number`|Отпускная стоимость товарной позиции с учётом скидок. До двух знаков в дробной части.
`positions.position.splitted_positions.splitted_position.position_discount`|`number`|Сумма скидки на позицию, применённой в момент добавления позиции в документ. Не учитывает скидку на весь документ. До двух знаков в дробной части.
`positions.position.splitted_positions.splitted_position.doc_distributed_discount`|`number`|Сумма скидки, которая была распределена на позицию в момент применения скидки на документ. До двух знаков в дробной части.
`positions.position.splitted_positions.splitted_position.tax_type`|`string`|Ставка НДС. Возможные значения: `NO_VAT` – без НДС; `VAT_0` – основная ставка 0%; `VAT_10` – основная ставка 10%; `VAT_10_110` – расчётная ставка 10%; `VAT_18` – основная ставка 18%; `VAT_18_118` – расчётная ставка 18%.
`positions.position.splitted_positions.splitted_position.result_tax_sum`|`number`|Сумма НДС на товарную позицию с учетом скидок. До двух знаков в дробной части.
`payments`| `Array of object` |Массив платежей (объекты payment).
`payments.payment`| `object` |Массив платежей (объекты payment).
`payments.payment.id`| `string` |Уникальный идентификатор платежа. Формат – uuid4, в соответствии с RFC.
`payments.payment.type`| `string` |Способ платежа. Возможные значения: `UNKNOWN` – по умолчанию, `CASH` – наличными деньгами, `ELECTRON` – электронными деньгами, `ADVANCE` – предоплатой (зачётом аванса), `CREDIT` – постоплатой (в кредит), `COUNTEROFFER` – встречным предоставлением.
`payments.payment.app_payment`| `object` |*Необязательный*. Объект с информацией для электронных платежей, в случае типа оплаты ELECTRON.
`payments.payment.app_payment.app_id`| `object` |*Необязательный*. Обязательный идентификатор приложения в формате uuid4, которое проводило платеж электронными средствами.
`payments.payment.app_payment.name`| `object` |*Необязательный*. Наименование платежной системы, не более 2048 символов.
`payments.payment.parts`| `Array of object` |
`payments.payment.parts.part_sum`| `number` | Часть платежа, которая пошла на оплату данной печатной группы. До двух знаков в дробной части.
`payments.payment.parts.print_group_id`| `string` |*Необязательный*. Идентификатор печатной группы при разбивке чека. Формат – `uuid4`, в соответствии с RFC.
`payments.payment.parts.change`| `number` |*Необязательный*. Сдача. До двух знаков в дробной части.
`pos_print_results`| `Array of object` |Результаты печати ККТ (массив объектов с фискальными данными). Соответствует зафиксированным в ККТ данным.
`pos_print_results.pos_print_result`| `object` |
`pos_print_results.pos_print_result.receipt_number`| `number`  |  Номер чека в ККТ.
`pos_print_results.pos_print_result.document_number`| `number`  |  Номер документа в ККТ.
`pos_print_results.pos_print_result.session_number`| `number`  |  Номер смены в ККТ.
`pos_print_results.pos_print_result.check_sum`| `number`  |Итоговая сумма для печати на документе, с учетом скидок. До двух знаков в дробной части.
`pos_print_results.pos_print_result.receipt_date`| `string`  |Дата печати в ККТ на момент печати документа, в формате "DDMMYYYY".
`pos_print_results.pos_print_result.print_group_id`| `string`  |*Необязательный*. Идентификатор печатной группы. Формат – uuid4, в соответствии с RFC.
`pos_print_results.pos_print_result.fn_serial_number`| `string`  |*Необязательный*. Заводской номер фискального накопителя.
`pos_print_results.pos_print_result.kkt_serial_number`| `string`  |*Необязательный*. Серийный номер ККТ.
`pos_print_results.pos_print_result.kkt_reg_number`| `string`  |*Необязательный*. Регистрационный номер ККТ.
`pos_print_results.pos_print_result.fiscal_sign_doc_number`| `string`  |*Необязательный*. Номер фискального признака документа.
`pos_print_results.pos_print_result.fiscal_document_number`| `number`  |*Необязательный*. Фискальный номер документа в ККТ из ФН.
`sum`| `number`  |Итоговая сумма с учетом налогов. До двух знаков в дробной части.
`result_sum`| `number`|Итоговая сумма с учетом налогов и скидок. До двух знаков в дробной части.
`doc_discounts`| `Array of object`|*Необязательный*. Массив скидок на документ (объекты doc_discount).
`doc_discounts.doc_discount`| `object`|
`doc_discounts.doc_discount.discount_type`| `string`| Тип скидки - суммовая или процентная. Все скидки сейчас на терминале работают как суммовые. Даже если клиент делает процентную скидку – она пересчитывается в суммовую. Возможные значения: `SUM`, `PERC`.
`doc_discounts.doc_discount.discount_sum`| `number`|Сумма скидки, до двух знаков в дробной части.
`doc_discounts.doc_discount.discount_percent`| `number`|Процент скидки. До пяти знаков в дробной части.
`doc_discounts.doc_discount.coupon`| `string`|*Необязательный*. Идентификатор купона (для случаев применения скидки через штатный функционал скидочных купонов).
`print_groups`| `Array of object`|*Необязательный*. Печатные группы (массив объектов printGroup). Используется для печати нескольких чеков. Например, в случае с разделенной оплатой.
`print_groups.print_group`| `object`|*Необязательный*. Печатные группы (массив объектов printGroup). Используется для печати нескольких чеков. Например, в случае с разделенной оплатой.
`print_groups.print_group.id`| `string`|*Необязательный*. Идентификатор печатной группы. Формат – uuid4, в соответствии с RFC.
`print_groups.print_group.type`| `string`|*Необязательный*. Способ оплаты. Возможные способы: `CASH_RECEIPT`, `INVOICE`, `STRING_UTII`.
`print_groups.print_group.org_name`| `string`|*Необязательный*. Наименование организации.
`print_groups.print_group.org_inn`| `string`|*Необязательный*. ИНН организации.
`print_groups.print_group.org_address`| `string`|*Необязательный*. Адрес организации.
`print_groups.print_group.taxation_system`| `string`|*Необязательный*. Используемая система налогообложения: `COMMON` – общая; `SIMPLIFIED_INCOME` – упрощённая Доход; `SIMPLIFIED_INCOME_OUTCOME` – упрощённая Доход минус Расход; `SINGLE_IMPUTED_INCOME` – единый налог на вмененный доход; `SINGLE_AGRICULTURE` – единый сельскохозяйственный налог; `PATENT` – патентная система налогообложения.
`customer_email`| `string`|*Необязательный*. Адрес электронной почты покупателя.
`customer_phone`| `string`|*Необязательный*. Номер телефона покупателя.
