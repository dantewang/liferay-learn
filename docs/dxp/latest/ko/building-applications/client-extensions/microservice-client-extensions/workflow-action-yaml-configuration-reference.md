# 워크플로 작업 YAML 구성 참조

`client-extension.yaml` 파일을 사용하여 워크플로 작업 클라이언트 확장을 정의할 수 있습니다.

## 사용내역

이 `client-extension.yaml` 파일은 워크플로 작업 및 OAuth 사용자 에이전트를 정의합니다.

```yaml
easy-workflow-action-1:
    name: Easy Workflow Action 1
    oAuth2ApplicationExternalReferenceCode: easy-oauth-application-user-agent
    resourcePath: /easy-workflow/action/1
    type: workflowAction

easy-oauth-application-user-agent:
    scopes:
        - Liferay.Headless.Admin.Workflow.everything
    type: oAuthApplicationUserAgent
```

필수 `resourcePath` 속성은 워크플로 작업 처리기의 사이트를 정의합니다. 외부 애플리케이션(예: Java Spring Boot 애플리케이션)으로 액세스할 수 있는 워크플로 작업 핸들러의 구현을 가리킵니다. 이 값은 OAuth2 애플리케이션 프로필의 `homePageURL` 값과 결합되어 완전한 URL을 형성합니다.

워크플로 작업 클라이언트 확장에는 Liferay의 워크플로 작업에 의해 트리거된 요청을 보호하기 위해 OAuth2 애플리케이션 프로필이 필요합니다. 위의 예는 이 프로필에 대한 추가 [OAuth 사용자 에이전트 클라이언트 확장](../configuration-client-extensions/oauth-user-agent-yaml-configuration-reference.md) 을 정의하고 `oAuth2ApplicationExternalReferenceCode` 속성은 해당 클라이언트 확장의 `키` 값을 참조합니다.

[샘플 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace/client-extensions/liferay-sample-etc-spring-boot) 워크플로 작업 클라이언트 확장을 추가하는 방법을 보여줍니다.

## YAML 속성

이러한 속성은 워크플로 작업 클라이언트 확장에만 적용됩니다.

| 이름                                       | 데이터 유형      | 묘사                                                                                   |
|:---------------------------------------- |:----------- |:------------------------------------------------------------------------------------ |
| `resourcePath`                           | 문자열(부분 URL) | (필수) 워크플로 작업 핸들러의 경로입니다. 이 값은 전체 URL에 대한 OAauth2 애플리케이션 프로필의 `homePageURL` 값과 결합됩니다. |
| `oAuth2ApplicationExternalReferenceCode` | 끈           | (필수) 요청 보안에 필요한 OAuth2 애플리케이션 프로필의 외부 참조 코드입니다.                                      |

## 관련 항목

* [마이크로서비스 클라이언트 확장](../microservice-client-extensions.md)
* [클라이언트 확장 작업](../working-with-client-extensions.md)
* [개체 작업 YAML 구성 참조](./object-action-yaml-configuration-reference.md)
