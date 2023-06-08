# Batch Engine API 기본 사항 - 데이터 내보내기

Liferay의 헤드리스 배치 엔진은 데이터를 가져오고 내보내는 REST API를 제공합니다. Liferay에서 데이터를 내보내려면 이러한 서비스를 호출하십시오.

<!-- TASK: Link to Batch Engine Overview in the introduction once it is ready !-->

## 데이터 내보내기

```{include} /_snippets/run-liferay-dxp.md
```

그런 다음 다음 단계를 따르십시오.

1. [Batch Engine API 기본 사항](./liferay-g4j2.zip) 을 다운로드하고 압축을 풉니다.

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/headless-delivery/consuming-apis/liferay-g4j2.zip -O
   ```

   ```bash
   unzip liferay-g4j2.zip
   ```

1. 데이터를 내보내려면 내보내는 엔터티의 정규화된 클래스 이름이 있어야 합니다. `/o/api`에 설치된 API 탐색기에서 클래스 이름을 얻을 수 있습니다. **Schemas** 섹션까지 아래로 스크롤하고 내보낼 엔티티의 `x-class-name` 필드를 기록해 둡니다.

1. 다음 cURL 스크립트를 사용하여 Liferay 인스턴스에서 계정을 내보냅니다. 명령줄에서 `curl` 폴더로 이동합니다. **계정** 및 `json` 의 정규화된 클래스 이름을 매개 변수로 사용하여 `ExportTask_POST_ToInstance.sh` 스크립트를 실행합니다. `json` 매개변수는 내보낸 데이터의 형식을 나타냅니다. 또한 `jsonl` 및 `csv` 형식을 지원합니다.

   ```bash
   ./ExportTask_POST_ToInstance.sh com.liferay.headless.admin.user.dto.v1_0.Account json
   ```

   JSON 응답은 새 내보내기 작업 생성을 보여줍니다. 작업의 `id` 에 유의하십시오.

   ```json
   {
     "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
     "contentType" : "JSON",
     "errorMessage" : "",
     "executeStatus" : "INITIAL",
     "externalReferenceCode" : "6c5286a2-aa28-175b-041e-eacca4a54d3b",
     "id" : 1234,
     "processedItemsCount" : 0,
     "totalItemsCount" : 0
   }
   ```

   ```{important}
   `json` 또는 `jsonl`을 출력 형식으로 사용하면 기본적으로 모든 필드가 내보내집니다. 필드를 지정하려면 내보낼 필드와 함께 추가 쿼리 매개변수(`fieldNames`)를 제공해야 합니다. 각 필드는 쉼표(,)로 구분해야 합니다. 내보내기 형식으로 `csv`를 사용하는 경우 필수 쿼리 매개변수입니다.
   ```

1. 현재 `인 executeStatus` `INITIAL`입니다. 배치 엔진에 대한 작업 제출을 나타냅니다. 데이터를 다운로드하려면 이것이 `COMPLETED` 이 될 때까지 기다려야 합니다. 명령줄에서 `ExportTask_GET_ById.sh` 스크립트를 실행하고 `1234` 내보내기 작업의 ID로 바꿉니다.

   ```bash
   ./ExportTask_GET_ById.sh 1234
   ```

   ```json
   {
     "className" : "com.liferay.headless.admin.user.dto.v1_0.Account",
     "contentType" : "JSON",
     "endTime" : "2022-10-19T14:13:58Z",
     "errorMessage" : "",
     "executeStatus" : "COMPLETED",
     "externalReferenceCode" : "6c5286a2-aa28-175b-041e-eacca4a54d3b",
     "id" : 1234,
     "processedItemsCount" : 8,
     "startTime" : "2022-10-19T14:13:58Z",
     "totalItemsCount" : 8
   }
   ```

   `executeStatus` 이 `COMPLETED`이면 내보낸 데이터를 다운로드할 수 있습니다. 그렇지 않은 경우 명령을 다시 실행하여 태스크 실행이 완료되었는지 확인하십시오. `executeStatus` `FAILED`표시되면 `errorMessage` 필드를 확인하여 무엇이 잘못되었는지 확인하십시오.

1. `executeStatus` `COMPLETED`이면 `ExportTaskContent_GET_ById.sh` 스크립트를 실행하고 `1234` 내보내기 작업의 ID로 바꿔 내보낸 데이터를 다운로드할 수 있습니다.

   ```bash
   ./ExportTaskContent_GET_ById.sh 1234
   ```

   이렇게 하면 내보낸 데이터가 현재 디렉터리에 `.zip` 파일로 다운로드됩니다. 압축을 풀고 적절한 응용 프로그램을 사용하여 데이터를 봅니다.

1. Java 클라이언트를 사용하여 REST 서비스를 호출할 수도 있습니다. `curl` 폴더에서 `java` 폴더로 이동합니다. 소스 파일을 컴파일합니다.

   ```bash
   javac -classpath .:* *.java
   ```

1. `ExportTask_POST_ToInstance` 클래스를 실행합니다. `가능` 클래스의 정규화된 이름으로 바꿉니다.

   ```bash
   java -classpath .:* -DclassName=able ExportTask_POST_ToInstance
   ```

   예를 들어 `계정` 데이터를 내보내십시오.

   ```bash
   java -classpath .:* -DclassName=com.liferay.headless.admin.user.dto.v1_0.Account ExportTask_POST_ToInstance
   ```

   JSON 응답에서 내보내기 작업의 `id` 에 유의하십시오.

1. 다음 명령을 사용하여 `ExportTask_GET_ById` 클래스를 실행합니다. `1234` 내보내기 작업의 ID로 바꿉니다.

   ```bash
   java -classpath .:* -DexportTaskId=1234 ExportTask_GET_ById
   ```

1. `executeStatus` `COMPLETED`표시되면 `ExportTaskContent_GET_ById` 클래스를 실행하여 데이터를 다운로드할 수 있습니다. `1234` 내보내기 작업의 ID로 바꿉니다.

   ```bash
   java -classpath .:* -DexportTaskId=1234 ExportTaskContent_GET_ById
   ```

## cURL 명령 검사

`ExportTask_POST_ToInstance.sh` 스크립트는 cURL 명령으로 REST 서비스를 호출합니다.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_POST_ToInstance.sh
    :language: bash
```

명령의 인수는 다음과 같습니다.

| 인수                                                                           | 묘사                      |
|:---------------------------------------------------------------------------- |:----------------------- |
| `-H "Content-Type: application/json"`                                        | 요청 본문 형식이 JSON임을 나타냅니다. |
| `-X POST`                                                                    | 지정된 끝점에서 호출할 HTTP 메서드   |
| `"http://localhost:8080/o/headless-batch-engine/v1.0/export-task/${1}/${2}"` | REST 서비스 끝점             |
| `-u "test@liferay.com:learn"`                                                | 기본 인증 자격 증명             |

```{note}
여기서는 데모용으로 기본 인증이 사용됩니다. 프로덕션의 경우 [OAuth 2.0 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/using-oauth2.html) 을 통해 사용자를 인증해야 합니다. Oauth2를 사용하는 샘플 React 애플리케이션은 [OAuth2를 사용하여 사용자 인증하기](../using-oauth2/using-oauth2-to-authorize-users.md)를 참조하세요.
```

## Java 클래스 검토

`ExportTask_POST_ToInstance.java` 클래스는 Batch Engine 관련 서비스를 호출하여 데이터를 내보냅니다.

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-21
```

이 클래스는 세 줄의 코드만 사용하여 REST 서비스를 호출합니다.

| 라인(약칭)                                                                         | 묘사                                                            |
|:------------------------------------------------------------------------------ |:------------------------------------------------------------- |
| `ExportTaskResource.Builder builder = ...`                                     | `ExportTaskResource` 서비스 인스턴스를 생성하기 위한 `빌더` 가져옵니다.            |
| `ExportTaskResource exportTaskResource = builder.authentication(...).build();` | 기본 인증을 지정하고 `ExportTaskResource` 서비스 인스턴스를 생성합니다.             |
| `exportTaskResource.postExportTask(...);`                                      | `exportTaskResource.postExportTask` 메서드를 호출하고 데이터를 게시에 전달합니다. |

프로젝트에는 `com.liferay.headless.batch.engine.client.jar` 파일이 종속성으로 포함되어 있습니다. `/o/api`에 설치된 API 탐색기에서 모든 REST 애플리케이션에 대한 클라이언트 JAR 종속성 정보를 찾을 수 있습니다.

```{note}
`main` 메서드의 주석은 클래스 실행을 보여줍니다.
```

다른 예제 Java 클래스는 이 클래스와 유사하지만 다른 `ExportTaskResource` 메서드를 호출합니다.

```{important}
[ExportTaskResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-batch-engine/headless-batch-engine-client/src/main/java/com/liferay/headless/batch/engine/client/resource/v1_0/ExportTaskResource.java) 를 참조하십시오.
```

다음은 cURL 및 Java를 사용하여 다른 Batch Engine 내보내기 REST 서비스를 호출하는 예입니다.

## ExportTask 상태 가져오기

다음 cURL 또는 Java 명령을 실행하여 내보내기 작업의 상태를 가져올 수 있습니다. `1234` 내보내기 작업의 ID로 바꿉니다.

### ExportTask_GET_ById.sh

명령:

```bash
./ExportTask_GET_ById.sh 1234
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_GET_ById.sh
   :language: bash
```

### ExportTask_GET_ById.java

`ExportTask_GET_ById` 클래스를 실행합니다. `1234` 내보내기 작업의 ID로 바꿉니다.

명령:

```bash
java -classpath .:* -DexportTaskId=1234 ExportTask_GET_ById
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

## 사이트에서 데이터 내보내기

다음 cURL 또는 Java 명령을 실행하여 사이트에서 데이터를 내보낼 수 있습니다. 아래 예는 사이트에서 블로그 게시물을 내보냅니다. [REST 서비스 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/consuming-rest-services.html#identify-the-site-containing-the-data) 을 찾아 `1234` 으로 바꿉니다. 다른 엔터티를 사용하는 경우 cURL 스크립트에서 정규화된 클래스 이름 매개 변수도 업데이트해야 합니다.

### ExportTask_POST_ToSite.sh

명령:

```bash
./ExportTask_POST_ToSite.sh com.liferay.headless.delivery.dto.v1_0.BlogPosting json 1234
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTask_POST_ToSite.sh
   :language: bash
```

### ExportTask_POST_ToSite.java

'ExportTask_POST_ToSite' 클래스를 실행합니다. `1234`를 사이트 ID로 바꾸고 `able`을 내보내려는 클래스의 정규화된 이름으로 바꿉니다.

```bash
java -classpath .:* -DsiteId=1234 -DclassName=able ExportTask_POST_ToSite
```

예를 들어 `BlogPosting` 데이터를 내보냅니다.

```bash
java -classpath .:* -DsiteId=1234 -DclassName=com.liferay.headless.delivery.dto.v1_0.BlogPosting ExportTask_POST_ToSite
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTask_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-23
```

```{note}
두 번째 매개변수는 `json`이며 내보낸 데이터의 출력 형식을 나타냅니다. 여기서 `jsonl` 및 `csv`를 사용할 수도 있습니다. CSV를 사용하는 경우 내보낼 필드를 쉼표로 구분된 문자열로 지정하고 `exportTaskResource.postExportTask()` 메서드의 다섯 번째 매개 변수로 전달하는 것이 필수입니다.
```

JSON 응답은 새로 생성된 내보내기 작업의 정보를 표시합니다. `executeStatus`을 추적하려면 `id` 에 유의하십시오. 완료되면 내보내기 작업 ID로 `ExportTaskContent_GET_ById.[java|sh]` 실행하여 데이터를 다운로드할 수 있습니다.

## 내보낸 데이터의 내용 가져오기

다음 cURL 및 Java 명령을 사용하여 내보낸 데이터를 다운로드할 수 있습니다. `1234` 내보내기 작업의 ID로 바꿉니다. 그런 다음 현재 디렉터리에 `.zip` 파일로 다운로드됩니다.

### ExportTaskContent_GET_ById.sh

명령:

```bash
./ExportTaskContent_GET_ById.sh 1234
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/curl/ExportTaskContent_GET_ById.sh
   :language: bash
```

### ExportTaskContent_GET_ById.java

명령

```bash
java -classpath .:* -DexportTaskId=1234 ExportTaskContent_GET_ById
```

부호:

```{literalinclude} ./batch-engine-api-basics/resources/liferay-g4j2.zip/java/ExportTaskContent_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 11-27
```

[REST 서비스 사용](https://learn.liferay.com/dxp/latest/ko/headless-delivery/consuming-apis/consuming-rest-services.html) 은 모든 헤드리스 배치 엔진 서비스 및 스키마를 나열하고 각 서비스를 시도할 수 있는 인터페이스가 있습니다.

## 추가 정보

* [Batch Engine API 기본 사항 - 데이터 가져오기](./batch-engine-api-basics-importing-data.md)
