# 계정 역할

계정 역할은 계정 컨텍스트 내에서 사용자에게 특정 기능을 부여하는 권한 집합입니다. 이러한 역할은 계정 책임을 위임하는 데 사용하거나 상거래 사이트 역할과 쌍을 이루어 비즈니스 계정에 대한 전체 구매 워크플로를 구현할 수 있습니다.

```{note}
계정 역할은 Liferay 7.4에서 도입되었습니다. 이전 버전에서는 다음 역할이 사이트 역할로 나열됩니다. 
```

Commerce에는 즉시 사용할 수 있는 두 가지 계정 역할이 포함됩니다.

* **계정 관리자** : 이 역할을 가진 사용자는 계정을 편집하고 사용자를 계정에 가입하도록 초대하고 계정 구성원에게 역할을 할당할 수 있습니다. 이 역할에는 모든 구매자 및 주문 관리자 권한도 포함됩니다.

* **계정 구성원** : 이 역할은 계정 내의 모든 사용자에게 자동으로 할당되며 기본 보기 권한을 부여합니다. 구성원에게 구매자 또는 주문 관리자 역할을 부여하여 구매 책임을 위임합니다.

  * **구매자**(사이트 역할): 이 역할을 가진 사용자는 주문을 보고 생성하고 확인할 수 있습니다.

  * **주문 관리자**(사이트 역할): 주문 관리자는 구매자의 모든 권한을 가지며 주문을 관리, 삭제 및 승인할 수도 있습니다.

즉시 사용 가능한 모든 역할 목록과 자신의 인스턴스에 대해 만들 수 있는 일반적인 사용자 지정 역할은 [상거래 역할 참조](../roles-and-permissions/commerce-roles-reference.md) 을 참조하십시오.

## 계정 역할 생성

기존 계정 역할이 비즈니스 요구 사항을 충족하기에 충분하지 않은 경우 추가 계정 역할을 생성할 수 있습니다. 기존 계정 역할에 권한을 추가할 수도 있습니다. 이 작업은 다른 유형의 DXP 역할을 만들고 편집하는 것과 동일한 프로세스입니다.

자세한 내용은 [역할 생성 및 관리](https://learn.liferay.com/dxp/latest/ko/users-and-permissions/roles-and-permissions/creating-and-managing-roles.html) 및 [역할 권한 정의](https://learn.liferay.com/dxp/latest/ko/users-and-permissions/roles-and-permissions/defining-role-permissions.html) 을 참조하십시오.

## 라이프레이 7.3 이하

### 판매자 측 계정 관리 역할

계정은 관리자 및 판매 에이전트가 관리할 수도 있습니다. 판매 에이전트를 통해 사용자는 관리 권한을 부여하지 않고도 역할에 할당된 모든 계정을 관리할 수 있습니다.

판매 에이전트에게 계정에 대한 액세스 권한을 부여하려면:

1. 계정 위젯을 사용하여 계정에서 조직을 그룹화합니다.
1. 영업 에이전트를 동일한 조직과 연결합니다.

![판매 에이전트 역할을 가진 사용자 목록](./account-roles/images/01.png)

판매 에이전트는 관련 조직 내의 모든 계정에 액세스할 수 있습니다.

## 관련 주제

* [계정 관리](../account-management.md)
* [새 계정 만들기](./creating-a-new-account.md)
* [새 계정 그룹 만들기](./creating-a-new-account-group.md)
* [역할 및 권한 이해](https://learn.liferay.com/dxp/latest/ko/users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.html)
