# 가격표 생성

가격 목록을 생성하여 특정 계정, 채널 및 주문 유형을 대상으로 하는 SKU 가격 항목을 저장할 수 있습니다. 이는 제품의 단가를 결정하고 적격 고객에 대한 기본 가격표 항목을 재정의하거나 수정할 때 사용됩니다. 각 가격 목록에 대해 사용자 정의 [가격 수정자](./using-price-modifiers.md) 을 정의할 수도 있습니다.

새 가격표를 생성하려면

1. **글로벌 메뉴**(![애플리케이션 메뉴 아이콘](../images/icon-applications-menu.png))를 열고 **가격** &rarr; **가격 목록** 으로 이동합니다.

1. **추가**(![아이콘 추가](../images/icon-add.png))를 클릭합니다.

1. 새 가격표에 대한 **이름** , **카탈로그** 및 **통화** 를 입력합니다. 언제든지 가격표의 이름과 통화를 변경할 수 있지만 연결된 카탈로그는 변경할 수 없습니다.

   ```{note}
   가격표를 생성하려면 Liferay 인스턴스에 최소한 하나의 [카탈로그가 있어야 합니다](../catalogs/creating-a-new-catalog.html) .
   ```

1. **제출** 을 클릭하세요.

가격 목록이 생성되면 제품에 대한 [가격 항목 추가](./adding-products-to-a-price-list.md)를 추가하고 일반 설정을 구성할 수 있습니다. 이러한 설정에는 목록의 상대적 우선순위, 상위 가격 목록, 가격 유형(예: 순액 또는 총액)이 포함됩니다. 또한 계정, 채널 및 주문 유형 자격을 결정하고 원하는 경우 [가격 수정자 추가](./using-price-modifiers.md)를 설정할 수도 있습니다.

완료되면 **게시** 를 클릭하여 변경 사항을 적용하거나 **초안으로 저장** 을 클릭하여 나중에 게시하세요.

```{note}
카탈로그가 처음 생성되면 각 항목의 기본 가격을 저장하기 위해 기본 가격표가 자동으로 생성됩니다. 이러한 가격 목록의 경우 세부 정보 및 항목 탭만 사용할 수 있습니다. 자격 및 가격 수정자 탭은 이후에 생성된 가격 목록에만 사용할 수 있습니다.
```

![Configure the newly created price list.](./creating-a-price-list/images/02.png)

## 커머스 2.1 이하

1. **제어판** &rarr; **상거래** &rarr; **가격 목록** 으로 이동하세요.

1. (![아이콘 추가](../images/icon-add.png)) 버튼을 클릭하세요.

1. 다음 필드를 입력합니다(아래 표시된 값 예시).
   * **카탈로그** : Sahara.com
   * **이름** : VIP 고객
   * **스토어 통화** : USD
   * **우선순위** : 1.0

1. **계정 그룹** 에서 **선택** 을 클릭하세요.

1. 이 가격표에 액세스하려면 하나 이상의 계정 그룹을 선택하십시오(아래에 표시된 계정 그룹의 예).
   - **일반적인**
   - **자동차 수리점**

1. **추가** 를 클릭하세요.

1. **계정** 에서 **선택** 을 클릭하세요.

1. 이 가격표에 액세스하려면 하나 이상의 계정을 선택하십시오(아래에 표시된 계정 예).
   * 마이크의 자동차 수리
   * 파운틴 밸리 세차장

1. **추가** 를 클릭하세요.

1. 가격표에 대한 일정을 선택합니다. (이 예에서는 **Never Expire** 확인란을 선택된 상태로 둡니다. 또는 가격표가 활성화되는 날짜 범위를 설정할 수 있습니다.)

    ![Adding a price list](./creating-a-price-list/images/01.png)

1. **게시** 를 클릭하세요.

가격표(이 예에서는 **VIP Customers**)가 생성되어 선택한 계정 그룹 및 계정에 적용되었습니다. 필요에 따라 다른 가격표를 생성하려면 단계를 반복합니다.

## 관련 주제

* [새 계정 만들기](../users-and-accounts/account-management/creating-a-new-account.md)
* [새 계정 그룹 생성](../users-and-accounts/account-management/creating-a-new-account-group.md)
* [가격 목록에 제품 추가](./adding-products-to-a-price-list.md)
* [가격 등급 사용](./using-price-tiers.md)
