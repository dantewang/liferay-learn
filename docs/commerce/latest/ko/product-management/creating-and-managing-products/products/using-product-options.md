# 제품 옵션 사용

제품 **옵션** 은 제품을 맞춤화하는 편리하고 유연한 방법을 제공합니다. 옵션을 사용하면 채널에서 판매되는 제품에 필드를 추가하여 고객이 제품 변형, 번들 등에서 선택할 수 있습니다.

옵션을 사용하여 시작하려면 먼저 옵션 [을 만들고 구성](#creating-an-option-template) . 그런 다음 템플릿 구성에 따라 [에 값](#adding-values-to-option-templates) 을 추가합니다. 일단 생성되면 전역 템플릿에 영향을 주지 않고 [템플릿을 제품에 [](#configuring-options-and-values-applied-to-products) ](#applying-an-option-template-to-a-product) 에서 해당 설정 및 값을 구성할 수 있습니다.

## 옵션 템플릿 생성

옵션 템플릿을 생성하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **커머스** 탭을 클릭한 후 **상품 관리** &rarr; **옵션** 로 이동합니다.

1. **추가** 버튼(![Add icon](../../../images/icon-add.png))을 클릭합니다.

   ![추가 버튼을 클릭하여 새 옵션 템플릿을 생성합니다.](./using-product-options/images/01.png)

1. 템플릿 **이름** 및 **설명**(선택 사항)을 입력합니다. 이름 필드와 일치하도록 **키** 이 자동으로 생성되지만 원하는 경우 수동으로 키를 변경할 수 있습니다.

1. 템플릿의 **필드 유형** 을 선택합니다. 제품에 사용되는 필드 유형을 결정합니다.

   * **텍스트** : 고객이 텍스트를 입력할 수 있도록 빈 필드를 추가합니다.
   * **목록** 에서 선택: 옵션 값에 대한 드롭다운 목록을 추가합니다.
   * **단일 선택** : 옵션 값에 대한 라디오 버튼 목록 추가
   * **다중 선택** : 고객이 여러 값을 선택할 수 있도록 옵션 값에 대한 체크 박스 목록을 추가합니다.
   * **날짜** : 고객이 날짜를 입력할 수 있는 필드 추가
   * **숫자** : 고객이 정수를 입력할 수 있도록 빈 필드 추가
   * **Boolean 질문** : Option에 Boolean 체크박스 추가

1. 옵션이 **패싯 탐색에서** 사용될 수 있는지 여부를 결정합니다. 활성화되면 옵션을 제품에 대한 검색 필터로 사용할 수 있습니다.

1. 옵션이 **인지 확인 필수** . 활성화되면 고객은 장바구니에 제품을 추가하기 전에 필드를 사용해야 합니다.

1. 옵션이 **SKU 기여자** 인지 확인합니다.

   활성화된 경우 옵션 값은 제품 변형에 대해 SKU [](./creating-skus-for-product-variants.md) 를 생성하는 데 사용됩니다. 고객은 사용 가능한 옵션 값에서 선택해야 합니다.

   ```{note}
   SKU 기여자는 *단일 선택* 및 *목록에서 선택* 필드 유형으로만 활성화할 수 있습니다.
   ```

1. 완료되면 **저장** 을 클릭합니다.

   일단 생성되면 [일반 값](#adding-values-to-option-templates) 을 옵션 템플릿에 추가하거나 이 단계를 건너뛰고 [옵션](#applying-an-option-template-to-a-product) 을 개별 제품에 적용할 수 있습니다.

```{note}
또는 *제품* 페이지를 통해 기본 옵션 템플릿을 생성할 수 있습니다. *글로벌 메뉴* → *상거래 탭* → *상품 관리* → *상품*으로 이동합니다. 그런 다음 원하는 *제품*을 선택하고 *옵션* 탭을 클릭합니다. *옵션 추가* 필드에 새 옵션의 이름을 입력하고 *새로 만들기*를 클릭합니다. 옵션 템플릿이 즉시 생성되어 제품에 적용됩니다. 
```

## 옵션 템플릿에 값 추가

옵션이 **목록에서 선택** , **단일 선택** 또는 **다중 선택** 필드 유형을 사용하는 경우 값을 추가해야 합니다.

옵션 템플릿에 일반 값을 추가하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **커머스** 탭을 클릭한 후 **상품 관리** &rarr; **옵션** 로 이동합니다.

1. 원하는 템플릿에 대해 **값** 을 클릭합니다.

1. **추가** 버튼(![Add icon](../../../images/icon-add.png))을 클릭합니다.

1. 값에 **이름** 을 입력합니다. 입력한 이름과 일치하도록 **키** 이 자동으로 생성되지만 원하는 경우 독립적으로 설정할 수 있습니다.

1. 값의 **우선 순위** 을 설정하여 나열되는 순서를 결정합니다.

1. 옵션 템플릿에 값을 추가하려면 **저장** 을 클릭합니다.

   ![생산 옵션에 값을 추가합니다.](./using-product-options/images/03.png)

이 프로세스를 반복하여 원하는 만큼 옵션에 일반 값을 추가할 수 있습니다. 템플릿이 제품에 적용되면 모든 값이 포함되지만 템플릿 값에 영향을 주지 않고 각 제품의 값을 추가, 제거 또는 편집할 수 있습니다.

## 제품에 옵션 적용

제품에 옵션을 적용하려면 다음 단계를 따르십시오.

1. **글로벌 메뉴**(![Global Menu](../../../images/icon-applications-menu.png))을 열고 **커머스** 탭을 클릭한 후 **상품 관리** &rarr; **상품** 로 이동합니다.

1. **옵션** 탭을 클릭합니다.

1. **옵션 추가** 필드에 옵션 템플릿의 이름을 입력하고 **선택** 을 클릭합니다.

   ![원하는 옵션 템플릿을 선택합니다.](./using-product-options/images/04.png)

옵션은 제품에 즉시 적용되며 고객은 제품 세부 정보 위젯을 통해 옵션 필드에 액세스할 수 있습니다.

원하는 경우 동일한 제품에 여러 옵션을 추가할 수 있습니다. 자세한 내용은 [제품 변형에 대한 SKU 생성](./creating-skus-for-product-variants.md) 을 참조하십시오.

```{important}
SKU Contributor가 활성화된 경우 생성된 후 옵션 값에 대한 SKU를 수동으로 생성해야 합니다. 이렇게 하려면 제품의 *SKU* 탭으로 이동하여 *추가* 버튼을 클릭하고 *모든 SKU 조합 생성*을 선택합니다. 고유한 SKU는 각 값에 대해 즉시 생성됩니다. SKU가 생성되지 않으면 옵션 필드에 해당 값이 표시되지 않습니다.
```

![고객은 제품 표시 페이지에서 옵션 필드를 보고 사용할 수 있습니다.](./using-product-options/images/05.png)

## 제품에 적용되는 옵션 및 값 구성

옵션이 제품에 적용되면 옵션 및 해당 값에 대한 추가 구성 설정에 액세스할 수 있습니다.

```{note}
제품 옵션에 대한 변경 사항은 옵션 템플릿에 영향을 미치지 않으며 그 반대의 경우도 마찬가지입니다.
```

### 추가 옵션 설정

* **사이트** : `0.0`부터 시작하여 옵션이 표시되는 순서를 결정하도록 옵션의 우선 순위를 설정합니다.

* **가격 유형** : 옵션 값에 사용되는 가격 유형을 Dynamic 또는 Static으로 설정합니다.

  * **Dynamic** 가격은 값을 SKU에 연결해야 하며 연결된 제품의 가격을 값의 자체 가격에 사용합니다.

  * **고정** 가격은 옵션 값에 대해 고정 가격을 사용합니다. 값이 제품에 연결된 경우 정가는 정가에 영향을 주지 않고 제품의 인스턴스 가격을 재정의합니다.

```{note}
가격 유형 속성은 *단일 선택* 및 *목록에서 선택* 필드 유형과만 호환됩니다.
```

### 추가 값 설정

* **기본값** : 옵션의 기본값을 설정합니다.

* **델타 가격**(정적 전용): 값에 대한 특정 가격을 설정합니다.

* **제품** : 기존 SKU를 값에 연결하고 수량을 지정합니다.

```{note}
제품은 가격 유형 속성이 있는 옵션에만 연결할 수 있습니다.
```

## 상거래 2.1 이하

### 옵션 템플릿 생성

옵션 템플릿을 생성하려면:

1. **제어판** → **상거래** → **제품** 로 이동합니다.
1. **옵션** 탭을 클릭합니다. 그러면 페이지 왼쪽에 기존 템플릿 목록이 표시되고 오른쪽에는 **Option Template Detail** 양식이 표시됩니다.
1. (+)를 클릭하여 옵션 템플릿을 추가합니다.
1. 다음을 입력:
    * **제목** : 색상
    * **설명** : 색상 선택
    * **필드 종류** : 목록에서 선택
    * **패싯 내비게이션에서 사용** : 예
    * **필수** : 예
    * **SKU 기여자:** 아니오
    * **키** : (자동 생성)

        ![옵션 템플릿](./using-product-options/images/06.png)

1. **저장** 을 클릭합니다.

옵션 템플릿이 추가되어 모든 제품에 적용할 수 있습니다.

**Use in Faceted Navigation** 이 **Active** 로 전환되면 사용자는 지정된 옵션을 기반으로 검색 결과를 필터링할 수 있습니다.

SKU 기여자는 [SKU](./creating-skus-for-product-variants.md)를 통해 각 변형에 대해 고유한 가격 및 기타 속성을 할당할 수 있습니다. 활성화된 경우 판매하려면 옵션에 SKU가 있어야 합니다.

```{warning}
부울 옵션을 SKU 기여자로 사용할 수 없습니다. 부울 옵션을 SKU 기여자로 사용하려고 시도하면 'SKU 기여자는 선택한 필드 유형에 대해 참으로 설정할 수 없습니다.'라는 경고 메시지가 표시됩니다.
```

### 옵션 값 추가

템플릿에 사용된 필드 유형에 따라 해당 옵션에 대한 값을 생성해야 할 수도 있습니다. 이 예에서 **목록** 에서 선택하려면 다른 제품 색상과 같은 옵션 값이 필요합니다.

여러 옵션 값을 추가하려면:

1. **색상** 옆에 있는 **값** 링크를 클릭합니다.
1. (![Add icon](../../../images/icon-add.png))을 클릭하여 옵션 템플릿을 추가합니다.
1. 다음을 입력:
    * **이름:** 블랙
    * **우선순위:** 1.0
    * **키:**(**이름** 필드에서 자동 생성됨)

        ![옵션 값 추가](./using-product-options/images/07.png)

1. **저장** 을 클릭합니다.

**검정** 이 이제 색상 옵션에 추가되었습니다. 더 많은 색상을 추가하려면 단계를 반복하고 우선 순위를 높입니다. 예를 들어 **흰색** 을 추가하고 우선순위를 2.0으로 설정한 다음 **파란색** 을 우선순위 3.0으로 설정하는 식으로 추가할 수 있습니다. 우선 순위 필드는 가장 낮은 값이 먼저 표시되는 옵션이 표시되는 순서를 결정한다는 것을 기억하십시오.

### 제품에 옵션 템플릿 적용

제품에 템플릿을 적용하면 제품의 옵션을 변경할 수 있습니다. 이러한 변경 사항은 옵션 템플릿이나 다른 제품에 영향을 미치지 않습니다.

옵션 템플릿을 제품에 적용하려면:

1. **글로벌 어플리케이션** → **커머스** → **상품** 로 이동합니다.
1. 거기에 나열된 제품을 클릭하십시오. 예를 들어 Miniium 가속기를 사용하여 사이트를 만든 경우 하나의 샘플 제품은 **Torque Converters** 입니다.

    ![제품 옵션을 추가할 제품을 선택하세요.](./using-product-options/images/08.png)

1. **토크 컨버터** 을 클릭합니다.
1. **옵션** 탭을 클릭합니다.

    ![옵션 탭을 클릭합니다.](./using-product-options/images/09.png)

1. 옵션을 검색합니다(예: **수량**).
1. **패키지 수량** 옆에 있는 **선택** 을 클릭합니다.

이제 옵션 템플릿이 적용됩니다. 제품이 카탈로그 페이지에 표시되면 구매자는 이제 토크 컨버터에 대해 다른 수량을 선택할 수 있습니다.

![수량 옵션이 토크 컨버터에 추가되었습니다.](./using-product-options/images/10.png)

## 관련 주제

제품당 하나 이상의 옵션 템플릿을 적용할 수 있으며 각 옵션에는 고유한 표시 우선 순위가 있습니다. **패키지 수량**(Minium 액셀러레이터에서 기본적으로 생성됨) 외에도 위의 옵션 템플릿 섹션에서 생성된 **색** 옵션이 있습니다. 템플릿 자체를 변경하지 않고도 이 화면에서 옵션 값을 변경할 수도 있습니다.

1. **패키지 수량** 옆에 있는 **값** 링크를 클릭합니다.
2. (![Add icon](../../../images/icon-add.png)) 버튼을 클릭하여 새 값을 추가합니다.
3. 다음을 입력:
    * **이름:** 60
    * **우선순위:** 5.0
    * **키:**(자동 생성)
4. **저장** 을 클릭합니다.

    ![제품 옵션에 값을 추가합니다.](./using-product-options/images/11.png)

구매자가 선택할 수 있는 가능한 수량에 새 옵션이 추가되었습니다.
