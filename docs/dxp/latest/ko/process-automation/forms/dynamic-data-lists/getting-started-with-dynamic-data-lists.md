# 동적 데이터 목록 시작하기

```{important}
동적 데이터 목록은 Liferay DXP 7.3부터 더 이상 사용되지 않습니다. [Objects]으로 대체됩니다(../../../building-applications/objects.md).
```

동적 데이터 목록은 데이터 정의라는 필드 세트에서 생성된 양식을 표시합니다. 데이터 정의는 양식의 필드 유형(예: 텍스트, 부울, 날짜, 라디오 버튼, 선택기 메뉴 등)과 해당 필드의 레이블 및 설정으로 구성됩니다. 데이터 정의는 동적 데이터 목록의 데이터 모델 역할을 효과적으로 수행합니다. 예를 들어 회의 등록을 위한 세 개의 필드(사용자 이름, 전자 메일 주소 및 티셔츠 크기 드롭다운 목록)가 있는 데이터 정의를 만들 수 있습니다. 이 데이터 정의는 생성한 모든 회의 등록 양식에 사용할 수 있습니다.

![데이터 목록이 있는 컨퍼런스 등록 양식의 예](./getting-started-with-dynamic-data-lists/images/01.png)

**데이터 정의:** 양식의 필드를 정의합니다.

**동적 데이터 목록:** 데이터 정의를 기반으로 양식을 표시합니다.

단일 데이터 정의에서 하나 이상의 동적 데이터 목록을 생성할 수 있습니다. 각 동적 데이터 목록에 대해 입력된 사용자 데이터는 데이터 정의가 공유되는 경우에도 별도로 유지됩니다. 예를 들어 위의 예제 데이터 정의를 사용하여 여러 동적 데이터 목록을 만든 다음 사용자로부터 피드백을 받아야 하는 모든 사이트에 배치할 수 있습니다. 각 동적 데이터 목록의 양식 데이터는 개별적이기 때문에 사용자 입력이 어떤 동적 데이터 목록에서 왔는지 파악하려고 할 필요가 없습니다.

동적 데이터 목록은 유연합니다. 동적 데이터 목록을 단순 입력으로 제한할 필요가 없습니다. 부동산 목록을 위한 전체 데이터 입력 시스템이나 상상할 수 있는 다른 간단한 목록 기반 응용 프로그램처럼 복잡한 것을 만들 수 있습니다.

사이트 메뉴의 콘텐츠 &rarr; 동적 데이터 목록 애플리케이션에서 데이터 정의 및 동적 데이터 목록을 생성합니다. 데이터 정의 및 목록을 만드는 데 코딩이 필요하지 않습니다. 그러나 [FreeMarker 템플릿](https://freemarker.apache.org/) 사용하여 추가 서식을 추가할 수 있습니다.

다음 문서에서는 데이터 정의 및 동적 데이터 목록을 만들고 사용하는 방법을 설명합니다.

* [데이터 정의 만들기](./creating-data-definitions.md)
* [동적 데이터 목록 만들기](./creating-data-lists.md)
* [양식 템플릿 만들기](./creating-form-templates.md)
* [표시 템플릿 만들기](./creating-display-templates.md)

## 시스템 설정

**제어판** &rarr; **시스템 설정** &rarr; **콘텐츠 및 데이터** &rarr; **동적 데이터 목록** : 동적 데이터 목록 서비스 및 동적 데이터 목록에서 구성할 수 있는 두 가지 설정이 있습니다.

동적 데이터 목록 서비스 설정에서:

**기본 구조 추가:** 이것은 기본적으로 활성화되어 있으며 여러 포함된 데이터 정의를 기본 데이터 목록에 미리 로드합니다. 포털 시작 시 로드된 이러한 정의는 사이트 메뉴 → 동적 데이터 목록 애플리케이션에서 수동으로 삭제해야 합니다. 이 설정은 가상 인스턴스의 첫 번째 시작에 적용됩니다.

동적 데이터 목록 설정에서:

**변경 가능한 기본 언어:** 활성화되면 데이터 정의의 기본 언어를 변경할 수 있습니다.

**CSV 내보내기:** 동적 데이터 목록 레코드를 경고를 표시하거나 표시하지 않고 CSV 형식으로 내보낼 수 있는지 여부를 선택하거나 이 옵션을 비활성화합니다. 경고 내용은 다음과 같습니다.

```{warning}
이 CSV 파일에는 사용자 제공 입력이 포함되어 있습니다. 스프레드시트 프로그램에서 CSV 파일을 여는 것은 위험할 수 있습니다.
```

**기본 표시 보기:** 테이블 기반 기본 보기 또는 목록 기반 기본 보기를 사용할지 여부를 선택합니다.
