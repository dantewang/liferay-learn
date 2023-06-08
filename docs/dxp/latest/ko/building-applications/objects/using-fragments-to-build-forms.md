# 프래그먼트를 사용하여 양식 작성

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

Liferay에는 콘텐츠 페이지에 개체 양식을 작성하기 위한 양식 조각이 포함되어 있습니다. 양식을 작성하려면 콘텐츠 페이지 또는 페이지 템플릿에 양식 컨테이너를 추가하고 게시된 개체에 매핑합니다. 컨테이너는 각 개체 필드에 매핑된 조각을 자동으로 채웁니다. 프래그먼트를 수동으로 구성, 제거 또는 추가할 수 있습니다. 일단 게시되면 최종 사용자는 양식을 사용하여 개체 항목을 만들 수 있습니다.

콘텐츠 페이지에서 양식을 작성하려면 다음을 수행해야 합니다.

* 양식 조각은 매핑된 양식 컨테이너에만 배치하십시오.
* 데이터 손실을 방지하기 위해 양식의 모든 양식 조각을 개체 필드에 매핑합니다.
* 모든 필수 개체 필드에 대한 양식 컨테이너에 조각을 포함합니다.
* 필수 양식 조각을 표시합니다.
* 양식 컨테이너에 보이는 제출 버튼을 포함합니다.

기본적으로 Liferay에는 [양식 구성 요소](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components) 조각 세트가 포함되어 있지만 직접 만들 수 있습니다. 자세한 내용은 [양식 조각 만들기](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md) 참조하십시오.

```{important}
양식 조각은 사용자 정의 개체에만 사용할 수 있습니다. 따라서 Liferay는 게시된 개체가 하나 이상 있을 때까지 양식 구성 요소 조각 세트를 숨깁니다. 일단 게시되면 개체에 대한 액세스 권한이 있는 사용자는 양식 구성 요소 조각을 보고 사용할 수 있습니다. 자세한 내용은 [객체 만들기](../objects/creating-and-managing-objects/creating-objects.md)를 참조하세요.
```

## 양식 만들기

1. 콘텐츠 페이지 또는 페이지 템플릿 편집을 시작합니다.

   디스플레이 페이지 템플릿은 양식 조각을 지원하지 않습니다.

1. (선택 사항) 프래그먼트를 사용하여 레이아웃을 디자인합니다. 자세한 내용은 [조각으로 반응형 레이아웃 구축](../../site-building/optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) 을 참조하십시오.

1. **Form Container** 조각을 페이지에 추가하고 개체에 매핑합니다.

   컨테이너는 모든 개체 필드에 대한 제출 버튼과 조각을 자동으로 생성합니다. 알파벳순으로 나타납니다. 필수 필드는 그에 따라 표시됩니다.

   ![양식 컨테이너를 추가하고 개체에 매핑합니다.](./using-fragments-to-build-forms/images/01.png)

1. 양식에서 원하지 않는 비필수 필드를 제거하십시오.

1. 양식 조각을 드래그 앤 드롭하여 재구성하십시오. 기본적으로 양식 요소는 알파벳순으로 구성됩니다.

1. (선택 사항) 양식 컨테이너에 기본 조각을 추가합니다. 기본 구성 요소(예: 그리드, 구분 기호, 단락, 이미지)를 사용하여 양식 컨테이너에 구조와 스타일을 제공할 수 있습니다.

   ![양식 컨테이너에 기본 조각을 추가하고 페이지 요소를 재구성하여 원하는 구조를 만듭니다.](./using-fragments-to-build-forms/images/02.png)

1. 조각을 구성합니다. 양식 조각에는 [표준](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md) 및 [고유](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options) 구성 옵션이 모두 포함됩니다.

   ```{note}
   양식 조각 구성 옵션은 조각을 개체 필드에 매핑한 후에 사용할 수 있습니다.
   ```

   ![양식 조각을 구성합니다.](./using-fragments-to-build-forms/images/03.png)

1. 완료되면 **게시** 클릭합니다.

## 양식 구성 요소에 대해 지원되는 필드 유형

각 양식 조각은 하나 이상의 개체 필드 유형을 지원할 수 있습니다. 기본 양식 구성 요소는 이러한 필드를 지원합니다.

| 양식 프래그먼트 | 개체 필드 유형              |
|:-------- |:--------------------- |
| CAPTCHA  | N/A                   |
| 체크 박스    | 불리언                   |
| 날짜       | 날짜                    |
| 파일 올려주기  | 부착                    |
| 다중 선택 목록 | 다중 선택 목록              |
| 숫자 입력    | 정수, 긴 정수, 십진수, 정밀 십진수 |
| 서식있는 텍스트 | 서식있는 텍스트              |
| 목록에서 선택  | 관계, 선택 목록             |
| 제출 버튼    | N/A                   |
| 텍스트 입력   | 텍스트, 긴 텍스트            |
| 텍스트 영역   | 텍스트, 긴 텍스트            |

```{tip}
개체에 대해 분류가 활성화된 경우 태그 및 범주 양식 조각을 사용하여 개체 항목에 메타데이터를 추가할 수 있습니다. 
```

## 관련 주제

* [양식 컴포넌트](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components)
* [조각 구성](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
* [양식 조각 옵션](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options)
* [양식 조각 만들기](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md)
