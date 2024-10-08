# 양식 번역

양식은 현재 사이트에서 현재 활성화된 모든 언어로 번역 및 제공될 수 있습니다.

번역을 추가하려면:

1. 번역할 기존 양식(예: **게스트 피드백 설문**)을 보는 것으로 시작합니다.
1. 언어 드롭다운 메뉴 옆에 있는 (+) 기호를 클릭합니다.
1. 양식을 번역할 언어를 선택하십시오.

    ![원하는 언어를 선택합니다.](./translating-forms/images/01.png)

1. 새 언어 탭이 양식에 추가됩니다. 입력한 번역 텍스트는 기본 언어를 재정의하지 않습니다.

    ![다음 탭에서 추가 양식을 봅니다.](./translating-forms/images/03.png)

1. 새 제목을 입력하세요.
1. 필드의 레이블을 수정하려면 필드를 클릭하십시오. 그러면 필드 구성 메뉴가 열립니다.

    ![필드의 레이블을 번역합니다.](./translating-forms/images/02.png)

1. 번역을 입력하십시오.
1. 원하는 모든 필드가 번역될 때까지 계속하십시오.
1. 완료되면 **양식** 저장을 클릭합니다.

```{note}
각 양식 필드의 메시지는 필드 설정 사이드바를 사용하여 번역에서 편집할 수 있습니다. 필드 설정에 대한 기타 변경 사항은 어떤 번역을 위해 만들어졌는지에 관계없이 모든 번역에 적용됩니다(예: 필드를 필수로 표시). Accept if Input [유효성 검사 설정](./validating-text-and-numeric-field-entries.md)은 약간 다릅니다. 해당 값 및 오류 메시지 필드는 번역 가능하지만 기본 언어로만 편집할 수 있습니다.
```

## 번역된 양식 보기

사이트에 대해 일치하는 기본 언어를 구성한 인증된 사용자는 이제 기본적으로 번역된 양식을 볼 수 있습니다.

![언어 설정이 현지화된 인증된 사용자는 해당 언어로 양식을 볼 수 있습니다.](./translating-forms/images/04.png)

[Liferay DXP 페이지의 양식 위젯](../sharing-forms-and-managing-submissions/sharing-forms.md)에서 액세스하면 양식이 자동으로 사용자의 언어로 표시됩니다. 사용자가 선택한 언어로 사용 가능한 번역이 없는 경우 양식의 기본 언어가 표시됩니다.

## 번역된 양식 레코드 보기

Liferay 7.4부터 각 양식 레코드의 언어는 관리자를 위해 두 사이트에 기록됩니다. [내보낸 양식 데이터](exporting-and-importing-forms.md) 및 양식의 항목 보기 화면 내에서.

Liferay Forms 애플리케이션에서 항목과 해당 언어를 보려면,

1. 사이트 관리 메뉴를 열고 콘텐츠 & 데이터 &rarr; 양식으로 이동합니다.
1. 양식에 대한 작업(![Actions](../../../images/icon-actions.png)) 메뉴를 열고 **항목 보기** 를 클릭합니다.
   
   ![관리자는 양식 레코드 언어를 쉽게 볼 수 있습니다.](./translating-forms/images/05.png)

## 관련 주제

* [양식 필드 유형 참조](./forms-field-types-reference.md)
* [제출 버튼 사용자 지정](./customizing-the-submit-button.md)
