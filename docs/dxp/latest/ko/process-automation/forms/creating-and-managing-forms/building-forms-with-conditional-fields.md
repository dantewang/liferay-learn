# 조건부 필드로 양식 작성

양식은 하나의 질문에 대한 응답으로 응답자가 다음 세 개의 질문을 건너뛰거나 추가 질문에 응답하도록 요구하는 동적 양식이 될 수 있습니다. 따라서 각 필드는 조건부 필드가 될 수 있습니다. 어떤 필드가 조건부인지 결정했으면 양식 규칙을 사용하여 해당 질문에 대한 답변을 기반으로 어떤 일이 발생하는지 결정합니다(예: 다중 페이지 양식에서 3페이지를 건너뛰고 4페이지로 이동).

각 양식 규칙에는 조건과 작업이 포함됩니다. 자세한 내용은 [양식 규칙 개요](../form-rules/form-rules-overview.md) 문서를 참조하세요.

양식 규칙을 추가하기 전에 먼저 모든 필드가 있는 양식을 [](./creating-forms.md). (각 필드 유형에 대한 자세한 내용은 [양식 필드 유형 참조](./forms-field-types-reference.md) 을 참조하십시오.) 모든 필드가 생성되면 양식 규칙을 추가합니다. 양식 규칙 목록은 다음과 같습니다.

* [표시-숨기기 규칙](#show-hide-rule)
* [활성화-비활성화 규칙](#enable-disable-rule)
* [페이지로 이동 규칙](#jump-to-page-rule)
* [자동 채우기 규칙](#autofill-rule)
* [규칙 필요](#require-rule)
* [규칙 계산](#calculate-rule)

## 표시-숨기기 규칙

응답자가 추가 질문에 답하도록 하려면 **표시-숨기기** 규칙을 사용하십시오. 예를 들어, 캠프 등록 양식에는 캠프 참가자가 18세 이상인지 여부에 대한 질문이 있습니다. 답변이 **NO** 인 경우 양식에 보호자의 이름을 묻는 추가 필드가 표시됩니다. 그렇지 않으면 참가자가 **YES** 이라고 대답하면 보호자의 이름을 묻는 필드가 숨겨집니다.

자세한 내용은 [표시-숨기기 규칙 사용](../form-rules/using-the-show-hide-rule.md) 기사를 참조하십시오.

## 활성화-비활성화 규칙

표시-숨기기 규칙과 마찬가지로 **활성화/비활성화** 규칙은 하나 이상의 조건에 따라 필드를 편집 가능하게 만듭니다. 선택적 정보를 입력하거나 특정 그룹에 속하는 사용자만 데이터를 수집할 때 유용합니다. 예를 들어, 야영장이나 병원에서는 사람들에게 치료에 영향을 미칠 수 있는 약물이나 알레르기를 나열하도록 요청할 수 있습니다. 이 필드는 사용자가 예를 선택한 경우에만 편집할 수 있습니다.

자세한 내용은 [Enable-Disable Rule 사용](../form-rules/using-the-enable-disable-rule.md) 기사를 참조하십시오.

## 페이지 규칙으로 이동

또 다른 옵션은 **페이지** 양식 규칙으로 이동을 사용하는 것입니다. 이름에서 알 수 있듯이 응답자는 답변에 따라 양식의 다른 페이지로 이동할 수 있습니다. 이는 일부 페이지가 모든 양식 사용자에게 적용되지 않는 경우에 유용합니다.

자세한 내용은 [페이지로 이동 규칙 사용](../form-rules/using-the-jump-to-page-rule.md) 기사를 참조하십시오.

## 자동 채우기 규칙

**자동 완성** 규칙은 미리 구성된 조건을 기반으로 양식 필드의 옵션을 필터링합니다. 한 가지 일반적인 용도는 시/도, 국가 및 지역을 채운 다음 조건부 필터를 적용하는 것입니다. 예를 들어 응답자는 지리적 지역(유럽, 북미, 아시아 등)을 선택한 다음 국가(독일, 미국, 말레이시아 등)를 선택합니다. **자동 완성** 규칙을 사용하기 전에 먼저 [데이터 공급자](../data-providers/data-providers-overview.md) 을 연결해야 합니다. 자세한 내용은 [REST 데이터 공급자를 사용하여 양식 옵션 채우기](../data-providers/using-the-rest-data-provider-to-populate-form-options.md) 을 참조하십시오.

## 규칙 필요

**Require** 규칙을 사용하여 하나 이상의 조건에 따라 필드를 필수로 만들 수 있습니다. 필수 규칙은 **표시** 규칙과 같은 다른 규칙과 함께 작동합니다. 예를 들어 자동차 렌탈 양식에는 응답자가 렌트에 할인을 적용하는지 여부를 나타내는 섹션이 있습니다. 답변이 **YES** 인 경우 응답자는 할인을 받기 위해 프로모션 코드를 입력해야 합니다.

자세한 내용은 [Require Rule](../form-rules/using-the-require-rule.md) 사용 문서를 참조하십시오.

## 규칙 계산

다른 필드를 기반으로 해당 값을 계산하여 숫자 필드를 채우는 **계산** 양식 규칙을 만듭니다. 예를 들어 계산 규칙은 참석자 수와 등록비(각각 $130인 17명)를 곱하여 캠프 또는 컨퍼런스의 총 등록 비용을 계산할 수 있습니다.

```{important}
계산은 숫자 필드로 제한됩니다.
```

자세한 내용은 [계산 규칙 사용](../form-rules/using-the-calculate-rule.md) 기사를 참조하십시오.

## 관련 주제

* [양식 만들기](./creating-forms.md)
* [양식 필드 유형 참조](./forms-field-types-reference.md)
* [데이터 공급자 개요](../data-providers/data-providers-overview.md)
