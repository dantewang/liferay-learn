# 사용자 관리

LDAP에서 사용자를 가져오거나 Liferay 내에서 사용자를 생성하는 경우 사용 가능한 도구를 사용하여 사용자를 관리하세요. 자세한 내용은 [사용자 추가 및 관리](https://learn.liferay.com/ko/w/dxp/users-and-permissions/users/adding-and-managing-users) 를 참조하세요.

## 관리자 만들기

기본 Liferay 관리자 계정을 계속 사용하는 대신 다른 사용자, 조직 및 계정을 생성할 새로운 Clarity Vision Solutions 관리자 계정을 생성하십시오.

```{warning}
프로덕션 환경에서는 기본 관리자 계정을 사용하면 안 됩니다. 대신 귀하의 비즈니스와 관련된 관리자 계정을 만드십시오.
```

1. 사용자 인증 설정을 변경합니다. 이는 학습 및 테스트 목적으로만 사용됩니다.

   * **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **인스턴스 설정** 으로 이동합니다.
   * 플랫폼에서 **사용자 인증** 을 클릭하세요.
   * 낯선 사람에게 이메일 주소 확인을 요구하려면 옆에 있는 확인란을 선택 취소하세요.
   * **저장** 을 클릭하세요.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** 으로 이동합니다. **사용자 추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. 다음 계정 정보를 입력하세요.

   * 화면 이름: `kyle`
   * 이메일 주소: `kyle@clarityvisionsolutions.com`
   * 이름: '카일'
   * 성 : '클라인'
   * 직위 : `IT 직원`

**저장** 을 클릭하세요.

1. Kyle에게 관리자 역할을 부여합니다.

   * 왼쪽 탐색에서 **역할** 을 클릭합니다.
   * 일반 역할 옆에 있는 **선택** 을 클릭하세요.
   * 새 창에서 관리자 옆에 있는 **선택** 을 클릭하세요.
   * 아래로 스크롤하여 **저장** 을 클릭하세요.

1. 카일의 비밀번호를 설정하세요.

   * 왼쪽 탐색 메뉴에서 **Password** 를 클릭하세요.
   * 두 필드에 `test`를 입력합니다.
   * **저장** 을 클릭하세요.

1. 기본 관리자 계정에서 로그아웃하고 Kyle Klein으로 로그인합니다.

   * 오른쪽 상단의 사용자 프로필 이미지를 클릭한 후 **로그아웃** 을 클릭하세요.
   * 오른쪽 상단의 **로그인** 을 클릭하세요.
   * 이메일 주소는 `kyle@clarityvisionsolutions.com`, 비밀번호는 `test`로 로그인하세요.
   * 비밀번호를 재설정하려면 다음 페이지에서 새 비밀번호를 `learn`으로 설정하세요.

## IT 관리자용 계정을 만듭니다.

1. **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **사용자 및 조직** 으로 이동합니다. **사용자 추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하세요.

1. Kyle의 관리자에 대한 사용자 계정을 만듭니다.

   * 화면 이름: '마커스'
   * 이메일 주소: `marcus@clarityvisionsolutions.com`
   * 이름: '마커스'
   * 성 : '모건'
   * 직위 : `IT 관리자`

   사용자 목록은 다음과 같아야 합니다.

   ![The list of users includes Kyle, Marcus, and the default Test account.](./managing-users/images/01.png)

다음 단계는 [organizations](./creating-organizations.md)을 만드는 것입니다.

## 관련 개념

* [사용자 이해](https://learn.liferay.com/ko/w/dxp/users-and-permissions/users/understanding-users)
* [사용자 추가 및 관리](https://learn.liferay.com/ko/w/dxp/users-and-permissions/users/adding-and-managing-users)
* [조직에 사용자 추가](https://learn.liferay.com/ko/w/dxp/users-and-permissions/organizations/adding-users-to-organizations)
