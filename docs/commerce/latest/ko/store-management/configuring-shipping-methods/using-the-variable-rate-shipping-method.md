# 가변 요율 배송 방법 사용

변동 요금 배송을 사용하면 무게, 주문 소계(배송비, 세금 및 할인 전 비용) 및 구성 가능한 고정 요금의 세 가지 요소를 사용하여 배송비를 계산할 수 있습니다. 상점 관리자는 운송 계산에서 각 요소의 가중치를 구성할 수 있습니다.

변동 요금이 있는 여러 배송 옵션을 만들 수 있습니다. 예를 들어 무게당 비용이 낮은 '표준 접지' 옵션을 만들 수 있습니다. 반대로 'Standard Ground'와 동일한 논리를 사용하지만 무게당 비용이 더 높은 'Two-Day Air' 옵션을 만들 수 있습니다.

가변 요율 배송비는 다음 공식으로 결정됩니다.

`shipping costs = [fixed price] + ([order total weight] * [rate unit weight price]) * ([order subtotal] x [rate percentage])`

## 가변 요율 배송 방법 활성화

가변 요율 배송 방법을 활성화하려면:

1. **제어판** &rarr; **상거래** &rarr; **채널** 로 이동합니다.

    ![제어판에서 채널로 이동](./using-the-variable-rate-shipping-method/images/07.png)

1. 원하는 채널(예: Sahara.com)을 클릭합니다. (Minium과 같은 액셀러레이터를 사용하여 사이트를 만든 경우 기본적으로 해당 채널이 이미 생성되어 있습니다.)
1. **배송 방법** 까지 아래로 스크롤합니다.

    ![가변 요율 배송 방법을 구성합니다.](./using-the-variable-rate-shipping-method/images/03.png)

1. 변동금리 옆의 **편집** 을 클릭합니다.
1. **활성** 토글을 **예** 으로 전환합니다.

가변 요율 배송 방법이 활성화되었습니다.

## 가변 요율 배송 옵션 추가

변동 요금 배송 옵션을 추가하려면:

1. **제어판** &rarr; **상거래** &rarr; **채널** 로 이동합니다.

1. 원하는 채널(예: Sahara.com)을 클릭합니다. (Minium과 같은 액셀러레이터를 사용하여 사이트를 만든 경우 기본적으로 해당 채널이 이미 생성되어 있습니다.)
1. **배송 방법** 까지 아래로 스크롤합니다.
1. 변동금리 옆의 **편집** 을 클릭합니다.
1. **배송 옵션** 탭을 클릭합니다.
1. 추가(![Add Icon](../../images/icon-add.png)) 버튼을 클릭하여 새로운 배송 옵션을 추가하세요.
1. 다음을 입력:
    * **명칭** : 투데이 그라운드
    * **설명** : 2일 접지
    * **우선순위** : 3.0

    ![2일 그라운드 옵션을 만듭니다.](./using-the-variable-rate-shipping-method/images/04.png)

1. **저장** 을 클릭합니다.
1. 구성 창을 닫습니다.

새로운 배송 옵션이 생성되었습니다. 이 배송 옵션 구성을 완료하려면 변동 배송비를 적용하세요.

## 가변 배송비 구성

1. **배송 옵션 설정** 탭을 클릭합니다.
1. 추가(![Add Icon](../../images/icon-add.png)) 버튼을 클릭하여 가변 요율 비용 공식을 추가합니다.
1. 배송 옵션 설정 화면이 나타납니다.

    ![배송 옵션 화면.](./using-the-variable-rate-shipping-method/images/05.png)

1. 다음 필드를 채우십시오.

    * **배송 옵션** : 2-Day Ground
    * **창고** : 한 곳에서 발송되는 경우에만 해당 방법을 적용하려면 창고를 선택합니다. 모든 창고에 이 방법을 사용하려면 비워 둡니다.
    * **국가** : 배송 방법이 지정된 국가로 제한되어야 하는 경우 이 필드를 사용하십시오.
    * **지역** : 배송 방법을 지정된 지역으로 제한해야 하는 경우 이 필드를 사용합니다.
    * **우편번호** : 배송 방법을 지정된 우편번호로 제한해야 하는 경우 이 필드를 사용하십시오.
    * **Weight From** : 이 옵션을 사용할 수 있는 주문의 최소 중량을 입력합니다.
    * **Weight To** : 이 옵션을 사용할 수 있는 주문의 최대 중량을 입력합니다.
    * **고정 가격** : 이 필드의 항목은 최소 가격을 설정하고 배송비 공식의 고정 구성요소를 제공합니다. 비워 둘 수 있습니다.
    * **요율 단위 중량 가격** : 이 필드의 항목은 중량당 비용을 부과합니다. 비워 둘 수 있습니다.
    * **비율 백분율** : 이 필드의 항목은 주문 소계의 백분율을 기준으로 배송비를 부과합니다. 비워 둘 수 있습니다.

1. **저장** 을 클릭합니다.
1. 배송 옵션 설정 편집 창을 닫습니다.

## 상거래 2.0 이하

### 배송 방법 활성화

1. **사이트 관리** → **상업** → **설정** 로 이동합니다.
1. **배송 방법** 탭을 클릭합니다.
1. **가변 비율** 을 클릭합니다.
1. **세부 정보** 탭을 클릭합니다.
1. **활성** 버튼을 **예** 으로 전환합니다.
1. **저장** 을 클릭합니다.

이제 배송 방법이 활성화되었습니다.

### 새 가변 요율 배송 옵션 생성

새 변동 요금 배송 옵션을 생성하려면:

1. **사이트 관리** → **상업** → **설정** 로 이동합니다.
1. **배송 방법** 탭을 클릭합니다.
1. **가변 비율** 을 클릭합니다.
1. **배송 옵션** 탭을 클릭합니다.
1. 추가(![Add Icon](../../images/icon-add.png)) 버튼을 클릭하여 새 배송 옵션을 추가합니다.
1. 다음을 입력:
    * **이름** : 2일 그라운드
    * **설명** : 2일 접지
    * **우선순위** : 3.0

    ![새로운 2일 지상 배송 옵션](./using-the-variable-rate-shipping-method/images/01.png)

1. **저장** 을 클릭합니다.

새로운 배송 옵션이 생성되었습니다. 이 배송 옵션 구성을 완료하려면 변동 배송비를 적용하세요.

### 가변 배송비 구성

1. **배송 옵션 설정** 탭을 클릭합니다.
1. (+) 버튼을 클릭하여 변동 요율 비용 공식을 추가합니다.
1. 다음 필드를 채우십시오.

    * **배송 옵션** : 2일 그라운드
    * **창고** : 한 곳에서 발송되는 경우에만 해당 방법을 적용하려면 창고를 선택합니다. 모든 창고에 이 방법을 사용하려면 비워 둡니다.
    * **국가** : 배송 방법이 지정된 국가로 제한되어야 하는 경우 이 필드를 사용하십시오.
    * **지역** : 배송 방법을 지정된 지역으로 제한해야 하는 경우 이 필드를 사용합니다.
    * **우편번호** : 배송 방법을 지정된 우편번호로 제한해야 하는 경우 이 필드를 사용하십시오.
    * **Weight From** : 이 옵션을 사용할 수 있는 주문의 최소 중량을 입력합니다.
    * **Weight To** : 이 옵션을 사용할 수 있는 주문의 최대 중량을 입력합니다.
    * **고정 가격** : 이 필드의 항목은 최소 가격을 설정하고 배송비 공식의 고정 구성요소를 제공합니다. 비워 둘 수 있습니다.
    * **요율 단위 중량 가격** : 이 필드의 항목은 중량당 비용을 부과합니다. 비워 둘 수 있습니다.
    * **비율 백분율** : 이 필드의 항목은 주문 소계의 백분율을 기준으로 배송비를 부과합니다. 비워 둘 수 있습니다.

      ![2일 그라운드 설정](./using-the-variable-rate-shipping-method/images/02.png)

1. **저장** 을 클릭합니다.

## 관련 주제

* [고정 요금 배송 방법 사용](./using-the-flat-rate-shipping-method.md)
* [배송 방법으로 FedEx 사용](./using-the-fedex-shipping-method.md)
* [배송 방법 제한 적용](./applying-shipping-method-restrictions.md)
* [측정 단위](./measurement-units.md)
* [배송 방법 참조](./shipping-method-reference.md)
* [새 발송물 만들기](../../order-management/shipments/creating-a-shipment.md)
