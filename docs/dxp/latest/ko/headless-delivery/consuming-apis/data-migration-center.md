# 가져오기/내보내기 센터

{bdg-secondary}`Liferay DXP 2023.Q4+/Portal 7.4 GA98+`
{bdg-link-primary}`[베타 기능](../../system-administration/configuring-liferay/feature-flags.md#beta-feature-flags)`

```{important}
데이터 마이그레이션 센터는 현재 개체 정의 및 개체 항목 가져오기 및 내보내기만 지원하는 베타 기능입니다.
```

데이터 마이그레이션 센터를 사용하면 Liferay 설치 간에 개체 정의와 개체 항목을 쉽게 이동할 수 있습니다.

데이터 마이그레이션 센터를 활성화하려면,

1. _글로벌 메뉴_ (![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; _제어판_ &rarr; _인스턴스 설정_으로 이동합니다.

1. _Platform_ 아래의 _Feature Flags_를 클릭하세요.

1. 왼쪽 탐색 메뉴에서 _베타_를 선택하세요. _Data Migration Center_ 토글을 활성화하세요.

1. _글로벌 메뉴_ (![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; _Applications_ &rarr; _Data Migration Center_로 이동합니다.

   ![The data migration center is found under applications.](./data-migration-center/images/01.png)

1. 가져오기 및 내보내기 작업 목록과 해당 상태를 보려면 _가져오기 및 내보내기_ 탭을 클릭하세요. _options_ (![옵션 아이콘](../../images/icon-options.png)) 아이콘을 클릭하여 이전 작업에서 파일을 다운로드하세요.

1. 가져오기 및 내보내기 템플릿 목록을 보려면 _템플릿_ 탭을 클릭하세요.

## 개체 정의 내보내기

객체 정의를 내보내려면

1. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하고 _파일 내보내기_를 선택합니다.

1. (선택 사항) 이전에 저장한 템플릿을 사용하는 경우 다음 페이지에서 내보내기 템플릿을 선택합니다.

1. 엔터티 유형으로 _ObjectDefinition(v1_0 - Liferay Object Admin REST)_을 선택합니다.

1. 내보내기 파일 형식 중 하나를 선택합니다.

   ```{note}
   데이터 마이그레이션 센터에서는 가져오기용 JSON 및 JSONL 파일 형식만 지원합니다.

   일괄 클라이언트 확장과 함께 사용하기 위해 내보내는 경우 JSONT 파일 형식을 선택하세요. `*.batch-engine-dat.json` 파일에는 JSONT가 필요합니다.
   ```

1. 필드 섹션에서 내보내기에 포함하려는 객체 정의 필드를 선택합니다.

   ![Select the object definition fields you wish to export.](./data-migration-center/images/02.png)

1. 나중에 사용할 수 있도록 내보내기 설정을 저장하려면 _템플릿으로 저장_을 클릭하세요. 템플릿 이름을 지정하고 _Save_를 클릭하세요.

1. 마지막으로 _Export_를 클릭하여 개체 정의를 내보냅니다.

1. 내보내기 프로세스를 표시하는 창이 나타납니다. 작업이 완료되면 _다운로드_를 클릭하여 zip 파일을 다운로드하세요.

   ![Click download to download a zip file.](./data-migration-center/images/03.png)

   zip 파일이 로컬 컴퓨터에 다운로드됩니다.

## 개체 항목 내보내기

개체 항목을 내보내려면

1. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하고 _파일 내보내기_를 선택합니다.

1. (선택 사항) 이전에 저장한 템플릿을 사용하는 경우 다음 페이지에서 내보내기 템플릿을 선택합니다.

1. 엔터티 유형에서 작업하려는 개체를 선택합니다. 객체에 대한 자세한 내용은 [객체 생성 및 관리](../../building-applications/objects/creating-and-managing-objects.md) 참조하세요.

1. 내보내기 파일 형식 중 하나를 선택합니다.

1. 필드 섹션에서 내보내기에 포함하려는 객체 정의 필드를 선택합니다.

1. 나중에 사용할 수 있도록 내보내기 설정을 저장하려면 _템플릿으로 저장_을 클릭하세요. 템플릿 이름을 지정하고 _Save_를 클릭하세요.

1. 마지막으로 _Export_를 클릭하여 개체 항목을 내보냅니다.

1. 내보내기 프로세스를 표시하는 창이 나타납니다. 작업이 완료되면 _다운로드_를 클릭하여 zip 파일을 다운로드하세요. zip 파일이 로컬 컴퓨터에 다운로드됩니다.

## 객체 정의 가져오기

객체 정의를 가져오려면

1. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하고 _파일 가져오기_를 선택합니다.

1. 다음 페이지에서 새 가져오기 작업의 이름을 입력합니다.

1. (선택 사항) 이전에 저장한 템플릿을 사용하는 경우 가져오기 템플릿을 선택합니다.

1. 엔터티 유형으로 _ObjectDefinition(v1_0 - Liferay Object Admin REST)_을 선택합니다.

1. 오류 발생 시 가져오기 작업을 중지할지 아니면 계속할지 선택하려면 확인란을 사용하세요.

1. 가져오기 전략에서 _기록 추가 또는 업데이트_ 또는 _새 기록만 추가_ 옵션을 선택하세요. _새 레코드만 추가_를 선택한 경우 엔터티가 이미 있으면 가져오기 작업이 오류와 함께 실패합니다. 데이터 마이그레이션 센터가 기존 엔터티를 덮어쓰도록 하려면 대신 _레코드 추가 또는 업데이트_를 선택하세요.

1. 업데이트 전략에서 _변경된 기록 필드 업데이트_ 또는 _기록 덮어쓰기_ 옵션을 선택하세요. _Records 덮어쓰기_를 선택하면 전체 엔터티가 업데이트됩니다. _변경된 레코드 필드 업데이트_를 선택하면 가져오기 파일에 정의된 필드만 업데이트되고 나머지 기존 값은 그대로 유지됩니다.

1. 파일 설정에서 _파일 선택_을 클릭하고 가져올 개체 정의가 포함된 JSON 파일을 찾습니다.

   ![Select the JSON file that contains the object definitions to import.](./data-migration-center/images/04.png)

1. 가져오기 매핑에서 소스 파일 필드 아래의 드롭다운 목록을 선택하여 원하는 대로 매핑을 변경합니다.

   ![Make any mapping changes under the import mappings section.](./data-migration-center/images/05.png)

1. 나중에 사용할 수 있도록 내보내기 설정을 저장하려면 _템플릿으로 저장_을 클릭하세요. 템플릿 이름을 지정하고 _저장_을 클릭하세요.

1. 가져오기를 계속하려면 _다음_을 클릭하세요. 팝업 창에서 _가져오기 시작_을 클릭하세요.

1. 팝업 창에 가져오기 진행 상황이 표시됩니다. 완료되면 _닫기_를 클릭하세요. 가져오기 과정에서 오류가 발생하면 기본 데이터 마이그레이션 페이지로 돌아가서 _옵션_(![옵션 아이콘](../../images/icon-options.png))을 클릭하여 오류 보고서를 다운로드하세요.

1. _Global Menu_ (![Global Menu](../../images/icon-applications-menu.png)) &rarr; _Control Panel_ &rarr; _Objects_로 이동하여 가져온 개체 정의를 확인합니다.

## 개체 항목 가져오기

개체 항목을 가져오려면

1. _추가_(![아이콘 추가](../../images/icon-add.png))를 클릭하고 _파일 가져오기_를 선택합니다.

```{note}
항목을 가져오기 전에 개체가 존재하는지 확인하십시오.
```

1. 다음 페이지에서 새 가져오기 작업의 이름을 입력합니다.

1. (선택 사항) 이전에 저장한 템플릿을 사용하는 경우 가져오기 템플릿을 선택합니다.

1. 엔터티 유형에서 작업하려는 개체를 선택합니다.

1. 오류 발생 시 가져오기 작업을 중지할지 아니면 계속할지 선택하려면 확인란을 사용하세요.

1. 가져오기 전략에서 _기록 추가 또는 업데이트_ 또는 _새 기록만 추가_ 옵션을 선택하세요. _새 레코드만 추가_를 선택한 경우 엔터티가 이미 있으면 가져오기 작업이 오류와 함께 실패합니다. 데이터 마이그레이션 센터가 기존 엔터티를 덮어쓰도록 하려면 대신 _레코드 추가 또는 업데이트_를 선택하세요.

1. 업데이트 전략에서 _변경된 기록 필드 업데이트_ 또는 _기록 덮어쓰기_ 옵션을 선택하세요. _Records 덮어쓰기_를 선택하면 전체 엔터티가 업데이트됩니다. _변경된 레코드 필드 업데이트_를 선택하면 가져오기 파일에 정의된 필드만 업데이트되고 나머지 기존 값은 그대로 유지됩니다.

1. 파일 설정에서 _파일 선택_을 클릭하고 가져올 개체 항목이 포함된 JSON 파일을 찾습니다.

1. 가져오기 매핑에서 소스 파일 필드 아래의 드롭다운 목록을 선택하여 원하는 대로 매핑을 변경합니다.

1. 나중에 사용할 수 있도록 내보내기 설정을 저장하려면 _템플릿으로 저장_을 클릭하세요. 템플릿 이름을 지정하고 _저장_을 클릭하세요.

1. 가져오기를 계속하려면 _다음_을 클릭하세요. 팝업 창에서 _가져오기 시작_을 클릭하세요.

1. 팝업 창에 가져오기 진행 상황이 표시됩니다. 완료되면 _닫기_를 클릭하세요. 가져오기 과정에서 오류가 발생하면 기본 데이터 마이그레이션 페이지로 돌아가서 _옵션_(![옵션 아이콘](../../images/icon-options.png))을 클릭하여 오류 보고서를 다운로드하세요.

1. [게시된 개체](../../building-applications/objects/creating-and-managing-objects/creating-objects.md#publishing-object-drafts)에 패널 링크가 있는 경우 해당 개체로 이동하여 확인하세요. 가져온 개체 항목입니다.

## 관련 주제

* [객체 생성 및 관리](../../building-applications/objects/creating-and-managing-objects.md)
* [배치 클라이언트 확장](../../building-applications/client-extensions/batch-client-extensions.md)
* [배치 엔진 API 기본 사항 - 데이터 가져오기](./batch-engine-api-basics-importing-data.md)
* [배치 엔진 API 기본 사항 - 데이터 내보내기](./batch-engine-api-basics-exporting-data.md)
