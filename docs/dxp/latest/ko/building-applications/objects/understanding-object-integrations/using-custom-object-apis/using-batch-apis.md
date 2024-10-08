# 배치 API 사용

객체를 게시하면 Liferay가 해당 객체에 대한 REST API를 자동으로 생성합니다. 여기에는 대량 POST, PUT 및 DELETE 작업을 위한 배치 API가 포함됩니다. 여기서는 cURL 명령을 사용하여 사용자 정의 개체에 대한 이러한 배치 API를 호출합니다.

계속하기 전에 [설정](#setting-up-a-liferay-instance) Liferay DXP/Portal 7.4 인스턴스를 설정하고 [제공된 튜토리얼 코드](#preparing-the-sample-code) 준비합니다.

```{tip}
사이트 및 회사 개체 모두에 대해 생성된 API의 전체 목록은 개체의 헤드리스 프레임워크 통합 [객체의 헤드리스 프레임워크 통합](../using-custom-object-apis.md) 참조하세요. `[서버]:[포트]/o/api`(예: `localhost:8080/o/api`)에서 Liferay API 탐색기를 통해 사용자 정의 개체 API를 보고 테스트할 수 있습니다. *REST 응용 프로그램* 아래에 나타납니다.
```

## Liferay 인스턴스 설정

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계에 따라 이 튜토리얼에 대한 기본 [를](../../creating-and-managing-objects/creating-objects.md) .

1. **전역 메뉴**(![전역 메뉴](../../../../images/icon-applications-menu.png))를 열고 **제어판** 탭으로 이동한 후 **개체를 클릭합니다** .

1. **추가** 버튼(![추가 버튼](../../../../images/icon-add.png))을 클릭하고 다음 값을 입력합니다.

   | 분야    | 가치      |
   | :---- | :------ |
   | 라벨    | `Able`  |
   | 복수 라벨 | `Ables` |
   | 이름    | `Able`  |

1. 새 **개체** 초안을 선택하고 **필드** 탭으로 이동하여 단일 텍스트 **필드** 를 추가합니다.

   | 라벨 | 필드 이름 | 유형 | 요구하는 |
   | :- | :---- | :- | :--- |
   | 이름 | 이름    | 원본 | ✔    |

1. **세부정보** 탭으로 이동하여 **게시** 를 클릭하세요.

   ```{important}
   이 튜토리얼에서는 위의 값을 사용해야 합니다.
   ```

[객체 게시](../../creating-and-managing-objects/creating-objects.md#publishing-object-drafts) 은 데이터 수신 및 저장을 위한 새 애플리케이션을 생성하고 활성화합니다. 이제 Headless API를 통해 액세스할 수 있습니다.

## 샘플 코드 준비

다음 명령을 실행하여 제공된 샘플 코드를 다운로드하고 압축을 풉니다.

```bash
curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/objects/understanding-object-integrations/using-custom-object-apis/liferay-t4r3.zip -O
```

```bash
unzip liferay-t4r3.zip
```

이러한 스크립트에는 다음 배치 API가 포함됩니다.

| HTTP 방법 | HTTP 엔드포인트 | 묘사                                     |
| :------ | :--------- | :------------------------------------- |
| 삭제      | `/batch`   | 여러 개체 항목을 삭제합니다.                       |
| 우편      | `/batch`   | API 호출에 제공된 세부정보를 사용하여 여러 개체 항목을 만듭니다. |
| 놓다      | `/batch`   | API 호출에 제공된 세부정보를 사용하여 여러 개체 항목을 바꿉니다. |

```{note}
GET 메소드는 데모 목적으로 포함되었습니다. Liferay 인스턴스의 전체 개체 항목 목록이 반환됩니다.
```

## 사용자 정의 개체의 API 호출

1. 샘플 코드를 다운로드한 후 `liferay-t4r3` 프로젝트의 `curl` 폴더로 이동합니다.

   ```bash
   cd liferay-t4r3/curl
   ```

1. `Ables_POST_Batch`를 실행합니다. 이렇게 하면 여러 개체 항목이 생성됩니다.

   ```bash
   ./Ables_POST_Batch.sh
   ```

   터미널에도 비슷한 출력이 표시됩니다.

   ```json
   {
     "className" : "com.liferay.object.rest.dto.v1_0.ObjectEntry",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "INITIAL",
     "externalReferenceCode" : "",
     "failedItems" : [ ],
     "id" : 4,
     "importStrategy" : "ON_ERROR_FAIL",
     "operation" : "CREATE",
     "processedItemsCount" : 0,
     "startTime" : "2022-04-07T22:51:37Z",
     "totalItemsCount" : 0
   }
   ```

1. `Ables_GET_FromCompany`를 실행하여 항목이 생성되었는지 확인하세요. 그러면 모든 개체 항목의 목록이 반환됩니다.

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

   다음 PUT 및 DELETE 메소드와 함께 사용할 각 항목의 ID를 복사하십시오.

   ```json
   {
     ...
     "items" : [ {
       ...
       "id" : 41985,
       ...
       "name" : "Able 1"
     }, {
       ...
       "id" : 41987,
       ...
       "name" : "Able 2"
     }, {
       ...
       "id" : 41989,
       ...
       "name" : "Able 3"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 20,
     "totalCount" : 3
   }
   ```

1. 각 항목 ID를 매개변수로 `Ables_PUT_Batch`를 실행합니다. 그러면 지정된 항목의 세부 정보가 API 호출에 제공된 세부 정보로 대체됩니다.

   ```bash
   ./Ables_PUT_Batch.sh {first-entry-id} {second-entry-id} {third-entry-id}
   ```

   ```json
   {
     "className" : "com.liferay.object.rest.dto.v1_0.ObjectEntry",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "INITIAL",
     "externalReferenceCode" : "",
     "failedItems" : [ ],
     "id" : 6,
     "importStrategy" : "ON_ERROR_FAIL",
     "operation" : "UPDATE",
     "processedItemsCount" : 0,
     "startTime" : "2022-04-07T23:02:17Z",
     "totalItemsCount" : 0
   }
   ```

1. `Ables_GET_FromCompany`를 실행하여 항목이 업데이트되었는지 확인하세요.

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

   ```json
   {
     ...
     "items" : [ {
       ...
       "id" : 41985,
       ...
       "name" : "Able One"
     }, {
       ...
       "id" : 41987,
       ...
       "name" : "Able Two"
     }, {
       ...
       "id" : 41989,
       ...
       "name" : "Able Three"
     } ],
     "lastPage" : 1,
     "page" : 1,
     "pageSize" : 20,
     "totalCount" : 3
   }
   ```

1. 각 항목 ID를 매개변수로 `Ables_DELETE_Batch`를 실행합니다. 그러면 지정된 항목이 삭제됩니다.

   ```bash
   ./Ables_DELETE_Batch.sh {first-entry-id} {second-entry-id} {third-entry-id}
   ```

1. `Ables_GET_FromCompany`를 실행하여 항목이 삭제되었는지 확인하세요.

   ```bash
   ./Ables_GET_FromCompany.sh
   ```

   이전 단계에서 항목을 삭제했으므로 `NOT FOUND` 항목 오류가 반환됩니다.

## 샘플 cURL 스크립트 검사

### `Ables_POST_Batch.sh`

```{literalinclude} ./using-batch-apis/resources/liferay-t4r3.zip/curl/Ables_POST_Batch.sh
   :language: bash
```

### `Ables_PUT_Batch.sh`

```{literalinclude} ./using-batch-apis/resources/liferay-t4r3.zip/curl/Ables_PUT_Batch.sh
   :language: bash
```

### `Ables_DELETE_Batch.sh`

```{literalinclude} ./using-batch-apis/resources/liferay-t4r3.zip/curl/Ables_DELETE_Batch.sh
   :language: bash
```

## 관련 주제

* [객체 API 기초](./object-api-basics.md)
* [NestedFields를 사용하여 관련 항목 쿼리](./using-nestedfields-to-query-related-entries.md)
* [REST API와 함께 집계 용어 사용](./using-aggregation-terms-with-rest-apis.md)
