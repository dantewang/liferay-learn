---
toc:
- ./using-content-pages/adding-elements-to-content-pages.md
- ./using-content-pages/managing-content-in-content-pages.md
- ./using-content-pages/using-widgets-on-a-content-page.md
- ./using-content-pages/using-page-comments.md
- ./using-content-pages/content-page-editor-ui-reference.md
uuid: 6f904c1b-7c0a-409d-b8aa-8f22d75fd8f9
---

# 콘텐츠 페이지 사용

```{toctree}
:maxdepth: 3

using-content-pages/adding-elements-to-content-pages.md
using-content-pages/managing-content-in-content-pages.md
using-content-pages/using-widgets-on-a-content-page.md
using-content-pages/using-page-comments.md
using-content-pages/content-page-editor-ui-reference.md
```

기본적으로 Liferay DXP는 페이지 콘텐츠 및 디자인을 관리하고 편집하기 위한 편리한 사용자 인터페이스를 제공하는 콘텐츠 페이지 유형을 사용합니다. 콘텐츠 페이지를 사용하면 즉시 구성 가능한 끌어서 놓기 요소를 사용하거나 직접 개발하여 원하는 사용자 경험을 만들 수 있습니다.

다른 페이지 유형과 마찬가지로 [위젯](./using-content-pages/using-widgets-on-a-content-page.md) 사용하여 블로그, 위키, 게시판 등을 통합하여 콘텐츠 페이지에 동적 기능을 추가할 수 있습니다. 콘텐츠 페이지는 주로 [페이지 조각](./page-fragments-and-widgets/using-fragments.md)을 사용하여 구축됩니다. 페이지 조각은 사용 가능한 콘텐츠에 매핑할 수도 있는 텍스트, 이미지 및 링크와 같은 편집 가능한 구성 요소를 포함하는 확장 가능하고 재사용 가능한 페이지 요소입니다. DXP의 즉시 사용 가능한 조각에 대해 자세히 알아보려면 [기본 조각 참조](./page-fragments-and-widgets/using-fragments/default-fragments-reference.md) 을 참조하고, 자신만의 조각을 만드는 방법을 알아보려면 [개발 조각](../developer-guide/developing-page-fragments/developing-fragments-intro.md) 참조하십시오.

콘텐츠 페이지를 편집할 때 *Site Builder* 통해 변경 사항이 적용되고 초안으로 저장됩니다. 라이브 버전에 영향을 주지 않고 현재 편집 세션 중에 변경한 내용을 검토, 실행 취소 및 다시 실행할 수 있습니다. 준비가 되면 변경 사항을 즉시 게시하거나 사용자 정의 [워크플로](../../process-automation/workflow/introduction-to-workflow.md) 활성화하여 검토 및 게시 프로세스를 지시하십시오. 페이지 요소에 댓글 [개](./using-content-pages/using-page-comments.md) 추가하여 팀원과 협업할 수도 있습니다.

![콘텐츠 페이지를 편집할 때 사이트 작성기를 통해 콘텐츠 페이지에 대한 모든 변경 사항이 적용됩니다.](./using-content-pages/images/01.png)

콘텐츠 페이지 조각 및 위젯을 사용하여 웹 콘텐츠, 문서 등을 표시할 수 있습니다. 페이지 필드에 매핑된 콘텐츠를 포함하여 콘텐츠를 보고 편집하고 관리할 수도 있습니다. 자세한 내용은 [콘텐츠 페이지의 콘텐츠 관리](./using-content-pages/managing-content-in-content-pages.md) 참조하십시오.

개인화된 페이지 [경험](../personalizing-site-experience/experience-personalization/content-page-personalization.md) 을 생성하고 현지화된 번역을 관리하여 대상 고객의 참여를 유도하십시오. 반응형 레이아웃 편집기를 사용하여 사용자 경험을 더욱 최적화할 수도 있습니다. 이 도구는 페이지 콘텐츠를 조정하므로 데스크톱, 태블릿 및 스마트폰에서 콘텐츠 페이지가 표시되는 방식을 보고 구성할 수 있습니다.

마지막으로 [A/B 테스트](../optimizing-sites/ab-testing/ab-testing.md) 사용하면 콘텐츠 페이지의 대체 버전을 생성하여 방문자 데이터(예: 이탈률, 클릭수 등)를 추적할 수 있습니다. 알고리즘을 사용하면 이 데이터를 분석하여 목표를 가장 잘 달성하는 페이지 버전을 결정하고 그에 따라 메시지를 다듬을 수 있습니다.

시작하려면 [콘텐츠 페이지에 요소 추가](./using-content-pages/adding-elements-to-content-pages.md) 참조하십시오!

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 콘텐츠 페이지에 요소 추가
:link: ./using-content-pages/adding-elements-to-content-pages.md
:::

:::{grid-item-card} 콘텐츠 페이지의 콘텐츠 관리
:link: ./using-content-pages/managing-content-in-content-pages.md
:::

:::{grid-item-card} 프래그먼트 사용

* [기본 조각 참조](./page-fragments-and-widgets/using-fragments/default-fragments-reference.md)
* [레이아웃 요소 사용](./page-fragments-and-widgets/using-fragments/using-layout-elements.md)
* [프래그먼트 구성](./page-fragments-and-widgets/using-fragments/configuring-fragments.md)
:::

:::{grid-item-card} 콘텐츠 페이지에서 위젯 사용
:link: ./using-content-pages/using-widgets-on-a-content-page.md
:::

:::{grid-item-card} 페이지 댓글 사용
:link: ./using-content-pages/using-page-comments.md
:::

:::{grid-item-card} 콘텐츠 페이지 편집기 UI 참조
:link: ./using-content-pages/content-page-editor-ui-reference.md
:::
::::
