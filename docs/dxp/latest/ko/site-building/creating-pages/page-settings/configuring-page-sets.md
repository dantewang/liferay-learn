# 페이지 세트 구성

```{important}
Liferay 7.4 U22+ 및 GA22+의 경우 새 설치에 대해 비공개 페이지가 비활성화됩니다. 그러나 원하는 경우 활성화할 수 있습니다. 자세한 내용은 [비공개 페이지 활성화](../understanding-pages/understanding-pages.md#enabling-private-pages) 를 참조하세요.
```

비공개 페이지가 활성화되면 사이트 페이지는 공개 및 비공개 [페이지 세트](../understanding-pages/understanding-pages.md#page-sets) 로 나뉩니다. 이러한 세트는 페이지를 그룹화하므로 각 유형의 페이지에 대량 구성을 적용할 수 있습니다. 페이지 집합에 대해 구성된 설정은 그룹화된 모든 페이지에 적용되며 사이트 수준에서 구성을 재정의합니다. 페이지 집합 구성은 개별 페이지에 대한 [사용자 정의](./configuring-individual-pages.md)로 재정의됩니다.

Liferay 시스템에 대해 개인 페이지가 비활성화된 경우 다음 단계에 따라 페이지에 대한 대량 구성 옵션에 액세스하십시오.

1. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))을 열고 **사이트 빌더** 를 확장한 다음 **페이지** 을 클릭합니다.

1. Application Bar에서 **Actions** 버튼(![Actions Button](../../../images/icon-actions.png))을 클릭하고 **Configuration** 를 선택합니다.

![애플리케이션 표시줄에서 작업 버튼을 클릭하고 구성을 선택합니다.](./configuring-page-sets/images/01.png)

Liferay 시스템에 대해 개인 페이지가 활성화된 경우 다음 단계에 따라 페이지 세트 구성 옵션에 액세스하십시오.

1. **사이트 메뉴**(![Site Menu](../../../images/icon-product-menu.png))을 열고 **사이트 빌더** 를 확장한 다음 **페이지** 을 클릭합니다.

1. **공개 페이지** 또는 **비공개 페이지** 에 대해 **기어** 아이콘(![Gear Button](../../../images/icon-cog3.png))을 클릭합니다.

![기어 아이콘을 클릭하여 페이지 집합의 구성 옵션에 액세스합니다.](./configuring-page-sets/images/02.png)

## 페이지 세트의 룩앤필 구성

**디자인** 탭에서 페이지 세트의 테마 및 로고 설정을 사용자 정의할 수 있습니다.

### 품질

테마는 사이트에 대한 전반적인 느낌을 만들고 모양을 완전히 변형할 수 있습니다. **현재 테마** 섹션에는 구성 가능한 테마 설정 및 테마에 있는 색 구성표와 함께 페이지 집합에 현재 적용된 테마가 표시됩니다. 많은 테마에는 사이트에 다른 풍미를 부여하면서 기존 모양과 느낌을 유지하는 둘 이상의 색 구성표가 포함되어 있습니다.

![Look and Feel 인터페이스를 사용하면 현재 사이트의 테마를 선택할 수 있습니다.](./configuring-page-sets/images/03.png)

현재 테마를 변경하려면

1. **현재 테마 변경** 버튼을 클릭하고 나타나는 창에서 테마를 선택합니다.

1. 원하는 테마를 선택하세요.

    ![사용 가능한 테마 중 하나를 선택합니다.](./configuring-page-sets/images/04.png)

1. **저장** 을 클릭하여 새 테마를 페이지 세트에 적용합니다.

테마를 수정하기 위해 **CSS** 섹션에 맞춤 CSS를 입력할 수 있습니다. 전체 사이트(여기에 설명됨) 또는 개별 페이지( [페이지 구성](./configuring-individual-pages.md#look-and-feel) 에 설명됨)에 테마를 적용할 수 있습니다.

### 로고

기본적으로 Liferay 로고는 사이트 페이지에 사용됩니다. 사이트에 자신의 로고를 사용하려면,

1. **로고** 섹션을 확장합니다.

1. **변경** 버튼을 클릭합니다.

1. 로고 사이트를 찾습니다. 로고가 사이트에 사용 중인 테마의 왼쪽 상단 모서리 공간에 맞는지 확인하세요. 그렇지 않으면 다른 페이지 요소가 로고를 위해 옆으로 밀려납니다.

1. 사이트에 사이트 이름을 표시할지 여부를 선택합니다. **사이트 이름 표시** 이 활성화되면 사이트 이름이 로고 옆에 나타납니다.

    ```{note}
    이 옵션은 기본적으로 활성화되어 있으며 *인스턴스 설정*에서 *사이트 관리자가 자신의 로고를 설정하도록 허용* 옵션이 비활성화된 경우 비활성화할 수 없습니다. 기본 Liferay 사이트에서는 사이트 이름을 제거할 수 없습니다. 새 사이트 및 사용자 페이지에 대해서만 구성할 수 있습니다.
    ```

1. **저장** 을 클릭합니다.

이제 사이트의 로고 설정이 구성되었습니다.

## 페이지 세트의 고급 설정 구성

**고급** 탭에는 사이트 및 전체 성능에 영향을 줄 수 있는 여러 옵션이 포함되어 있습니다. 관리자는 주의해서 진행해야 합니다.

![고급 탭에는 사이트를 향상시키는 여러 옵션이 포함되어 있습니다.](./configuring-page-sets/images/05.png)

### 자바스크립트

**JavaScript** 탭에서 JavaScript 편집기에 JavaScript를 붙여넣을 수 있습니다. 여기에 입력된 코드는 사이트의 모든 페이지 하단에서 실행됩니다. 사이트의 JavaScript는 테마에 포함되었을 가능성이 높습니다(포함되어야 합니다). 그러나 프로덕션이 아닌 동안 JavaScript 코드를 빠르게 테스트할 수 있는 좋은 장소일 수 있습니다.

### 고급 설정

여러 사이트가 있는 경우 한 사이트는 방문자가 도메인 이름을 방문할 때 보게 되는 **기본 사이트** 로 표시됩니다. 기본적으로 기본 사이트의 공개 페이지만 탐색에 표시됩니다.

해당 사이트에 대해 **공개 페이지 병합** 옵션을 활성화하여 기본 사이트 탐색에 다른 사이트의 공개 페이지를 표시할 수 있습니다.

```{warning}
기본 탐색에 너무 많은 페이지를 추가하면 매우 빠르게 다루기 어려워질 수 있습니다.
```

1. **Liferay DXP 공개 페이지 병합** 상자를 선택합니다.

    ![사이트의 최상위 수준을 DXP 게스트 사이트와 병합할 수 있습니다.](./configuring-page-sets/images/06.png)

1. 완료되면 **저장** 을 클릭합니다.

### 모바일 장치 규칙

**모바일 장치 규칙** 을 추가하여 특정 모바일 장치 또는 페이지 집합 유형에 대한 동작을 구성할 수 있습니다. 모바일 장치 규칙은 공개 페이지에서 상속되지만 페이지별로 특정 규칙을 정의할 수 있습니다. 테마를 포함하여 모바일 장치용 특정 페이지의 모양과 느낌을 편집할 수 있습니다. 자세한 내용은 [모바일 장치 규칙](../../optimizing-sites/building-a-responsive-site/creating-mobile-device-rules.md) 을 참조하십시오.

### 로봇

여기에서 도메인의 공개 및 비공개 페이지에 대한 `robots.txt` 규칙에서 검색 및 인덱싱 규칙을 구성할 수 있습니다. `robots.txt` 파일은 사이트를 자동으로 크롤링하고 인덱싱하는 검색 엔진 및 기타 도구에 대한 지침을 제공합니다. 예를 들어 특정 페이지를 색인화하지 않도록 지정할 수 있습니다.

### 사이트 지도

이렇게 하면 사이트를 크롤링할 수 있도록 일부 검색 엔진에 보낼 수 있는 사이트맵이 생성됩니다. 업계 표준 사이트맵 프로토콜을 사용합니다. 검색 엔진 링크를 선택하여 사이트맵을 보내거나(사이트당 한 번만 필요) 검색 엔진으로 전송되는 생성된 XML을 보려면 **미리보기** 링크를 선택하십시오.

## 페이지 트리 메뉴 사용

Liferay DXP 7.3에서는 **페이지 트리** 메뉴에서 동일한 설정에 액세스할 수 있습니다.

1. **사이트 메뉴**(![Site Menu](../../../images/icon-menu.png))을 열고 **페이지 트리**(![Page Tree](../../../images/icon-page-tree.png))를 클릭합니다.

1. 드롭다운 메뉴에서 **공개 페이지** 또는 **비공개 페이지** 을 선택합니다.

1. 톱니바퀴 아이콘을 클릭합니다.

    ![페이지 트리 메뉴에서 동일한 페이지 세트 옵션에 액세스할 수 있습니다.](./configuring-page-sets/images/07.png)

## 관련 주제

* [개별 페이지 구성](./configuring-individual-pages.md)
