# 사이트 계층 구조

사이트는 조직과 마찬가지로 하위 사이트를 사용하여 계층적으로 구성할 수 있습니다. 사이트를 계층적으로 구성하면 사이트 간에 콘텐츠를 쉽게 공유할 수 있습니다. 사이트와 조직의 차이점은 사이트는 페이지, 콘텐츠, 애플리케이션 데이터 및 사용자(사이트 멤버십을 통해)를 구성하는 반면, 조직은 사용자만 그룹화한다는 점입니다. 사이트 계층 구조는 아래에서 자세히 설명합니다.

## 사이트 간 콘텐츠 공유

콘텐츠 공유는 동일한 계층 구조 내의 사이트에서 사용할 수 있습니다. 예를 들어 상위 사이트에 Devcon 프레젠테이션이라는 문서 유형이 있고 모든 하위 사이트에 사본이 있어야 하는 경우 상위 사이트의 관리자는 콘텐츠 공유를 활성화하여 하위 사이트와 해당 문서 유형을 자동으로 공유할 수 있습니다. 또한 콘텐츠 공유 권한을 설정하여 모든 사이트 관리자가 자신이 관리하는 사이트 간에 콘텐츠를 공유할 수 있도록 할 수 있습니다. 이러한 콘텐츠 유형을 여러 사이트에서 공유할 수 있습니다:

* 웹 콘텐츠 구조
* 웹 콘텐츠 템플릿
* 문서 이름
* 어휘 및 카테고리
* 위젯 템플릿
* 데이터 정의(동적 데이터 목록)

관련 구성 가능한 속성 목록은 Liferay의 `portal.properties` 파일의 [사이트 관리자 포틀릿](https://resources.learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) 섹션을 참조하세요. 예를 들어 `Sites.content.sharing.with.children.enabled` 속성을 사용하면 사이트와 하위 사이트 간의 콘텐츠 공유를 비활성화/활성화할 수 있으며, 사이트 관리자가 사이트별로 구성할 수 있습니다.

## 사이트 계층 구조 역할 및 권한

이러한 규칙은 사이트 계층 구조에 적용됩니다:

* 계층 구조의 각 하위 사이트에는 자체 관리자가 있습니다.
* 사이트 관리자 역할 권한이 계층 구조의 하위 사이트로 내려가지 않습니다.
* 사이트 관리자가 하위 사이트를 만들면 해당 하위 사이트에서도 동일한 권한을 갖게 됩니다. 사이트를 만들면 해당 사이트의 소유자가 되기 때문입니다(상속이 아님).
* 사이트 관리자는 다른 사이트 관리자가 만든 하위 사이트에서 기본 역할이 없습니다.

```{note}
사용자가 사이트/자식 사이트 계층 구조의 모든 사이트에 대한 관리 액세스 권한을 갖도록 하려면 사이트 관리자 역할을 기반으로 하위 사이트 관리 권한이 있는 역할을 만들어야 합니다.
```

## 사이트 디렉터리 애플리케이션으로 사이트 계층 구조 탐색하기

사이트 디렉터리 애플리케이션은 사이트 및 하위 사이트의 계층 구조를 표시하는 구성 가능한 앱입니다. 사용자는 표시된 모든 사이트로 이동할 수 있습니다. 이 앱을 사용하여 사이트 계층 구조를 표시하려면 다음 단계를 따르세요:

1. **사이트 디렉토리** 애플리케이션을 페이지에 추가합니다.
1. **구성** 창을 엽니다.
1. 표시 스타일 아래에서 **목록 계층** 을 선택합니다.
