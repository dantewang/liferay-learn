# 웹 콘텐츠 구조 및 템플릿에 권한 할당

웹 콘텐츠 구조와 템플릿은 Liferay의 API에 대한 직접적인 액세스를 제공합니다. Liferay DXP 기능에 대한 무단 또는 의도하지 않은 액세스를 방지하려면 웹 컨텐츠 구조 및 템플릿에 대한 권한을 구성해야 합니다.

가장 좋은 방법은 웹 콘텐츠 구조 및 템플릿에 액세스할 수 있는 두 가지 역할을 정의하는 것입니다.

1. **콘텐츠 개발자:** 이 역할을 가진 사용자는 웹 콘텐츠 구조 또는 템플릿을 생성하고 편집할 수 있는 권한을 갖습니다.

1. **콘텐츠 제작자:** 이 역할을 가진 사용자는 웹 콘텐츠 구조나 템플릿을 볼 수 있는 권한이 있으므로 이를 사용하여 콘텐츠를 만들 수 있습니다.

역할 생성 방법에 대한 자세한 내용은 [역할 생성 및 관리](../../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md)을 참조하십시오.

웹 콘텐츠 구조 또는 템플릿에 권한을 할당할 때 아래 정보를 고려하십시오.

* 귀하의 역할이 Liferay DXP 인스턴스 전체의 모든 웹 콘텐츠 구조나 템플릿에 대해 전역 권한을 가져야 하는지, 아니면 특정 사이트에 대해서만 전역 권한을 가져야 하는지 결정하세요.
* 보기 권한이 있는 사용자는 웹 콘텐츠 구조나 템플릿을 볼 수만 있습니다.
* 대부분의 사용자는 웹 콘텐츠 구조나 템플릿을 편집할 수 없어야 합니다.

## 웹 콘텐츠 템플릿에 대한 보안 고려 사항

웹 콘텐츠 템플릿은 기본적으로 FTL(FreeMarker 템플릿 언어)을 사용합니다. FreeMarker를 사용하여 템플릿을 생성하거나 편집할 수 있는 권한이 있는 사용자는 DXP 인스턴스에서 임의의 코드를 실행하고 다른 사용자에 대한 정보를 포함한 민감한 정보에 액세스할 수 있습니다.

```{important}
신뢰할 수 있는 사용자에게만 FreeMarker에서 웹 콘텐츠 템플릿을 생성하거나 편집할 수 있는 권한을 부여합니다.
```

템플릿 생성을 완전히 비활성화할 수 있습니다. 비활성화되면 사용자는 더 이상 웹 콘텐츠 템플릿 생성 옵션에 액세스할 수 없습니다. 이 작업은 기존 템플릿에 영향을 주지 않습니다.

1. 글로벌 메뉴에서 **제어판** 탭을 엽니다.

1. **구성** &rarr; **시스템 설정** &rarr; **콘텐츠 및 데이터** &rarr; **동적 데이터 매핑** 으로 이동합니다.

1. **동적 데이터 매핑 웹** 을 클릭합니다.

1. **템플릿 생성 활성화** 선택 취소합니다.

1. **저장** 또는 **업데이트** 클릭합니다.

## 권한 할당

1. **사이트 메뉴**( ![Site Menu](../../../images/icon-product-menu.png) )을 열고 **콘텐츠 & 데이터** &rarr; **웹 콘텐츠** 로 이동합니다.

1. **Structures** 탭을 선택하여 구조에 대한 권한을 설정하거나 **Templates** 탭을 선택하여 템플릿에 대한 권한을 설정합니다.

1. 권한을 할당하려는 웹 콘텐츠 템플릿에 대해 **작업**( ![Actions](../../../images/icon-actions.png) )을 클릭하고 **권한** 선택합니다.

1. 역할에 필요한 권한을 선택하세요.

1. **저장** 클릭하세요.

![웹 콘텐츠 구조 및 템플릿에 대한 권한 대화 상자](./assigning-permissions-to-structures-and-templates/images/01.png)

권한 구성에 대한 자세한 내용은 [역할 권한 정의](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md) 참조하세요.

## 관련 주제

* [구조 만들기](./creating-structures.md)
* [구조 필드 구성](./configuring-structure-fields.md)
* [구조 관리](./managing-structures.md)
