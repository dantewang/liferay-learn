# 배송 관리 참조 가이드

이 안내서는 **발송물 관리** 메뉴의 모든 기능을 문서화합니다. **Shipments Management** 에 액세스하려면 **Global Applications** &rarr; **Shipments** 으로 이동합니다.

![배송 관리 개요 페이지](./shipments-management-reference-guide/images/01.png)

| 분야     | 묘사                                                    |
|:------ |:----------------------------------------------------- |
| 배송 ID  | 배송 ID는 자동으로 생성되며 주문 ID와 다릅니다.                         |
| 계정     | 주문한 계정입니다.                                            |
| 채널     | 주문한 채널(상점 사이트)입니다.                                    |
| 배송 주소  | 이것은 계정의 배송 주소입니다.                                     |
| 추적 번호  | 운송업체(FedEx, UPS, DHL, 우편 서비스 등)에서 생성한 자동 생성 추적 번호입니다. |
| 날짜 생성  | 배송이 생성된 날짜입니다.                                        |
| 예상 배송일 | 주문 상품이 배송될 예상 날짜입니다.                                  |
| 배송 예상일 | 배송예정일입니다.                                             |

## 처리 탭

### 세부사항

**세부 정보** 섹션에서는 사용자가 배송에 대한 주요 정보를 입력할 수 있습니다.

![세부정보 섹션](./shipments-management-reference-guide/images/04.png)

### 제품

**제품** 섹션은 이 배송에 포함될 모든 제품을 추적합니다.

![제품 섹션](./shipments-management-reference-guide/images/02.png)

| 분야       | 묘사                                                           |
|:-------- |:------------------------------------------------------------ |
| SKU      | 제품 SKU입니다.                                                   |
| Order Id | 이 배송과 관련된 주문 ID입니다. 동일한 계정에서 주문한 여러 주문을 동일한 배송으로 처리할 수 있습니다. |
| 창고       | 주문이 들어올 창고입니다.                                               |
| 미결 수량    | 미해결 수량은 배송에 아직 포함되지 않은 필수 수량을 나타냅니다.                         |
| 배송 수량    | 이 수량은 발송물에 포함된 항목 수를 나타냅니다. 이것은 **미결 수량** 에서 뺍니다.               |

(![Add Icon](../../images/icon-add.png)) 아이콘을 클릭하면 사용자가 항목을 선택할 수 있습니다.

![이 발송물에 포함될 항목을 선택하십시오.](./shipments-management-reference-guide/images/03.png)

점 3개 아이콘(![Actions icon](../../images/icon-actions.png))을 클릭하면 사용자가 인벤토리를 가져올 창고를 선택할 수 있습니다.

해당 창고 옆에서 사용자는 필드에 수량을 입력하거나 화살표를 사용하여 증가 또는 감소할 수 있습니다. **저장** 버튼을 클릭하면 변경 사항이 적용됩니다.

![이 발송물에 포함될 항목을 선택하십시오.](./shipments-management-reference-guide/images/05.png)

마지막으로 **Finish Processing** 을 클릭하면 발송 처리의 다음 단계로 넘어갑니다. **Finish Processing** 을 클릭할 때 유효성 검사가 있습니다. SKU에 대한 **배송** 의 수량 값이 0이면 다음 오류 메시지가 표시됩니다. `오류: 모든 배송 항목에 대해 유효한 창고와 수량을 선택하십시오.`

## 발송 준비 탭

이 탭에서 **세부 정보** 섹션은 동일하게 유지됩니다. 사용자는 여전히 운송업체 세부 정보와 예상 배송 및 배송 날짜를 수정할 수 있습니다.

![세부정보 섹션](./shipments-management-reference-guide/images/04.png)

**제품** 섹션에 작은 변화가 있습니다. 여기에서 사용자는 주문이 배송되기 전에 다양한 비즈니스 이유로 배송에서 항목을 삭제할 수 있습니다.

![배송 준비 탭의 제품 섹션에서는 사용자가 배송 전에 항목을 제거할 수 있습니다.](./shipments-management-reference-guide/images/06.png)

## 발송됨 탭

**배송됨** 탭은 사용자가 배송의 현재 상태를 볼 수 있는 곳입니다. 사용자는 언제든지 운송업체 세부 정보와 예상 배송 및 배송 날짜를 수정할 수 있습니다.

![배송됨](./shipments-management-reference-guide/images/07.png)

| 분야       | 묘사                  |
|:-------- |:------------------- |
| SKU      | 제품 SKU입니다.          |
| Order Id | 이 배송과 관련된 주문 ID입니다. |
| 배송됨      | 배송에 포함된 수량입니다.      |

## 배달됨 탭

**배송됨** 탭에는 **배송됨** 탭과 동일한 정보가 표시됩니다.

![배달됨 탭](./shipments-management-reference-guide/images/08.png)

## 관련 주제

* [배송 만들기](./creating-a-shipment.md)
