# 간행물 권한

{bdg-secondary}`7.4+`

간행물은 Liferay의 권한 프레임워크와 함께 작동하므로 [application](#application-permissions) 및 [resource](#resource-permissions) 권한을 일반 역할에 할당할 수 있습니다. 공동 작업자를 초대할 때 [개별 게시물 범위](#assigning-roles-to-publication-collaborators) 권한을 할당할 수도 있습니다. 허용된 사용자만 게시에 액세스하고 해당 리소스에 대한 작업을 수행할 수 있습니다.

```{note}
출판물 권한에는 페이지 및 콘텐츠 편집 권한이 포함되지 않습니다. 간행물 사용자는 작업을 수행할 것으로 예상되는 응용 프로그램 및 리소스(예: 웹 콘텐츠, 블로그, 페이지)에 대한 명시적인 권한이 필요합니다.
```

기본적으로 Liferay는 [**간행물 사용자**](#publications-user-role) 역할에 간행물 생성 및 액세스를 위한 기본 권한을 제공합니다.

![Liferay는 기본 간행물 사용자 역할을 제공합니다.](./publications-permissions/images/01.png)

필요한 경우 추가 [일반 역할](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md) 을 생성하거나 콘텐츠 작성자, 검토자 및 게시자에 대한 기존 역할을 구성할 수 있습니다. 자세한 내용은 [역할 생성 및 관리](../../../users-and-permissions/roles-and-permissions/creating-and-managing-roles.md) 및 [역할 권한 정의](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md) 을 참조하십시오.

![일반 역할을 추가하거나 다른 역할 권한을 구성합니다.](./publications-permissions/images/02.png)

```{note}
*일반 역할*에만 간행물 권한을 할당할 수 있습니다. 자세한 내용은 [역할 및 권한 이해](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)를 참조하세요.
```

## 애플리케이션 권한

애플리케이션 권한은 출판물 애플리케이션 자체에 대한 액세스 권한을 부여하며 [리소스 권한](#resource-permissions) 을 포함하지 않습니다.

| 허가        | 묘사                                                                                                    |
|:--------- |:----------------------------------------------------------------------------------------------------- |
| 컨트롤 패널 접근 | 전역 메뉴( ![Global Menu](../../../images/icon-applications-menu.png) )에서 출판물 애플리케이션에 액세스합니다.             |
| 페이지에 추가   | N/A                                                                                                   |
| 설정        | [](./enabling-publications.md) Publications 및 Sandbox Only 모드를 활성화 또는 비활성화합니다.                        |
| 권한        | 출판물 애플리케이션에 대한 권한을 보고 수정합니다.                                                                          |
| 환경 설정     | N/A                                                                                                   |
| 보기        | 전역 메뉴( ![Global Menu](../../../images/icon-applications-menu.png) )에서 간행물 애플리케이션을 보고 간행물 표시줄에 액세스합니다. |
| 생산 작업     | 출판이 활성화되어 있는 동안 프로덕션에서 액세스하고 작업합니다.                                                                   |


최소한 출판물을 사용하려면 제어판의 액세스 및 보기 권한이 있는 일반 역할이 필요합니다.

```{important}
샌드박스 전용을 활성화했고 사용자가 프로덕션에서 작업하는 것을 원하지 않는 경우 프로덕션 작업 권한이 없는지 확인하십시오.
```

## 리소스 권한

리소스 권한은 Publications 애플리케이션에서 리소스를 보고 작업할 수 있는 액세스 권한을 부여합니다. 이러한 권한 중 일부는 [간행물 작성과 관련됨](#publications-related-to-creating-publications) , 다른 권한은 [기존 발행물에 대한 작업 수행](#publication-for-performing-actions-on-existing-publications) 을 위한 것입니다. (예: 편집, 삭제, 게시).

### 출판물(출판물 만들기)

| 허가        | 묘사                                                                                                                             |
|:--------- |:------------------------------------------------------------------------------------------------------------------------------ |
| 간행물 추가(1) | 발행물을 만듭니다. 이 권한이 없으면 사용자는 [초대된](./collaborating-on-publications.md#inviting-users-to-a-publication) 경우에만 출판물에 액세스하고 기여할 수 있습니다. |
| 권한 (2)    | 게시 생성과 관련된 권한 보기 및 수정: 게시 및 권한 추가.                                                                                             |


이러한 권한이 있는 사용자는 출판물 애플리케이션에서 이러한 작업을 수행할 수 있습니다.

![사용자는 간행물을 추가하고 간행물 추가 권한을 관리할 수 있습니다.](./publications-permissions/images/03.png)



### 간행물(기존 간행물에 대한 조치)

| 허가 | 묘사                                                                                                                                |
|:-- |:--------------------------------------------------------------------------------------------------------------------------------- |
| 삭제 | 볼 수 있는 발행물을 삭제하십시오.                                                                                                               |
| 권한 | 볼 수 있는 출판물에 대한 권한을 보고 수정합니다. 여기에는 발행물에 [사용자를](./collaborating-on-publications.md#inviting-users-to-a-publication) 초대하는 기능이 포함됩니다. |
| 공개 | 볼 수 있는 간행물을 게시합니다.                                                                                                                |
| 수정 | 볼 수 있는 간행물을 업데이트합니다. 여기에는 발행물에서 작업하고 발행물의 이름과 설명을 편집하는 기능이 포함됩니다.                                                                 |
| 보기 | Liferay 인스턴스의 모든 간행물을 봅니다. 여기에는 각 게시의 변경 사항을 검토하는 기능이 포함됩니다.                                                                      |


이러한 권한이 있는 사용자는 기존 게시에 대한 작업을 수행할 수 있습니다.

![사용자는 기존 게시에 대한 권한을 보고, 업데이트하고, 게시하고, 삭제하고, 관리할 수 있습니다.](./publications-permissions/images/04.png)

## 간행물 사용자 역할

기본적으로 **Publications User** 역할에는 다음 권한이 있습니다.

* 포털: 제어판 메뉴 보기
* 간행물: 제어판에서 액세스
* 간행물: 보기
* 출판물 > 출판물: 출판물 추가

![Liferay는 이러한 권한이 있는 기본 간행물 사용자 역할을 제공합니다.](./publications-permissions/images/05.png)


## 간행물 협력자에게 역할 할당

기본적으로 게시 작성자에게는 자동으로 **소유자** 역할이 할당되며 게시에 대한 모든 작업을 수행할 수 있습니다. [자신의 출판물에 사용자를 초대할 때](./collaborating-on-publications.md#inviting-users-to-a-publication) 소유자는 다음 출판 역할을 할당할 수 있습니다.

| 출판 역할 | 보기       | 수정       | 공개       | 권한       | 삭제       |
|:----- |:-------- |:-------- |:-------- |:-------- |:-------- |
| 뷰어    | &#10004; | &#10008; | &#10008; | &#10008; | &#10008; |
| 편집자   | &#10004; | &#10004; | &#10008; | &#10008; | &#10008; |
| 발행인   | &#10004; | &#10004; | &#10004; | &#10008; | &#10008; |
| 관리자   | &#10004; | &#10004; | &#10004; | &#10004; | &#10008; |


![게시에 사용자를 초대할 때 해당 게시로 범위가 지정된 역할을 할당할 수 있습니다.](./publications-permissions/images/06.png)

각 게시 역할은 현재 게시로 범위가 지정되며 다른 게시에 대한 권한을 부여하지 않습니다.

게시 역할은 일반 역할 권한을 제한하지 않습니다. 예를 들어 삭제 권한이 있는 사용자가 게시에 초대되고 **뷰어** 역할이 할당된 경우 일반 역할 권한 때문에 게시를 삭제할 수 있습니다.

## 관련 주제

* [출판](../publications.md)
* [출판물 생성 및 관리](./creating-and-managing-publications.md)
* [간행물 공동 작업](./collaborating-on-publications.md)
* [역할 권한 정의](../../../users-and-permissions/roles-and-permissions/defining-role-permissions.md)
