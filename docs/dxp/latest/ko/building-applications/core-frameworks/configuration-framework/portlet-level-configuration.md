# 포틀릿 레벨 구성

구성 프레임워크를 사용하면 [애플리케이션의 구성을 다양한 범위 수준(](./scoping-configurations.md))으로 설정할 수 있습니다. 여기서 인스턴스 및 사이트 범위 구성은 `ConfigurationProvider`, 포틀릿 범위 구성은 아래 예시와 같이 `PortletDisplay` 를 사용합니다.

구성 프레임워크는 포틀릿 환경 설정과 함께 사용하여 앱이 시스템 설정의 구성 UI와 포틀릿의 설정 탭에 환경 설정 UI를 모두 가질 수 있도록 할 수 있습니다.

사용자가 포틀릿 환경설정을 구현하고 설정한 경우 애플리케이션의 구성이 재정의된다는 점에 유의하세요. 자세한 내용은 [포틀릿 환경설정](../../developing-a-java-web-application/using-mvc/portlet-preferences.md) 을 참조하세요.

## 예제 코드 보기

```{include} /_snippets/run-liferay-portal.md
```

그런 다음 다음 단계를 따르십시오.

1. [현지화된 메시지 공유](./liferay-x7y2.zip) 를 다운로드하고 압축을 풉니다.

    ```bash
    curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/core-frameworks/configuration-framework/liferay-x7y2.zip -O
    ```

    ```bash
    unzip liferay-x7y2.zip
    ```

1. 모듈 루트에서 빌드 및 배포합니다.

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    이 명령은 배포된 jars를 Docker 컨테이너의 /opt/liferay/osgi/modules에 복사하는 것과 동일합니다.
    ```

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

    ```bash
    STARTED com.acme.x7y2.web_1.0.0 [1651]
    ```

1. 예제 모듈이 작동하는지 확인합니다. 브라우저를 열어 `https://localhost:8080`

1. X7Y2 포틀릿을 페이지에 배포합니다. 샘플 위젯에서 예제 포틀릿을 찾을 수 있습니다. 기본 색상이 녹색으로 설정되어 있음을 알 수 있습니다.

1. **제어판** &rarr; **구성** &rarr; **시스템 설정** 으로 이동합니다. 기타 섹션 아래 하단에서 X7Y2 구성을 클릭합니다.

    ![시스템 설정에서 애플리케이션의 구성으로 이동합니다.](./portlet-level-configuration/images/01.png)

    다른 기본 색상을 선택하여 저장합니다. 배포된 위젯이 있는 페이지로 다시 이동합니다. 이제 색상 변수가 업데이트됩니다.

1. 포틀릿의 옵션 아이콘(![options icon](../../../images/icon-options.png))을 클릭하고 **구성** 을 클릭합니다. 포틀릿의 환경설정 창이 열립니다.

    ![구성을 클릭하여 포틀릿의 환경설정을 엽니다.](./portlet-level-configuration/images/02.png)

    다른 색상을 선택하여 저장합니다. 창을 닫으면 이제 포틀릿 환경설정이 나타납니다. 포틀릿 환경설정을 선택한 후에는 시스템 설정에 설정된 애플리케이션 구성이 더 이상 표시되지 않는다는 점에 유의하세요.

애플리케이션의 구성이 포틀릿 환경 설정과 함께 어떻게 작동하는지 살펴 보겠습니다.

## 구성 인터페이스 만들기

먼저 시스템 설정에서 구성 UI를 자동 생성하는 구성 인터페이스 파일을 생성합니다.

```{literalinclude} ./portlet-level-configuration/resources/liferay-x7y2.zip/x7y2-web/src/main/java/com/acme/x7y2/web/internal/configuration/X7Y2PortletInstanceConfiguration.java
:language: java
:lines: 7-24
```

이 예제에서는 범위가 `PORTLET_INSTANCE`로 설정되어 있습니다. 인터페이스는 드롭다운 목록에서 사용할 수 있는 구성 옵션도 정의합니다.

이 예제는 범위를 더 높은 수준으로 설정한 경우에도 작동합니다(예 사이트, 인스턴스, 시스템 범위). 모범 사례는 포틀릿 환경 설정에서 사용하려는 애플리케이션을 포틀릿 범위로 표시하는 것입니다.

자세한 내용은 [구성 인터페이스 만들기](./setting-and-accessing-configurations.md#Creating-the-Configuration-Interface) 를 참조하세요.

```{note}
DXP 7.4 U51 또는 Portal 7.4 GA51 이전 Liferay 버전에는 `ConfigurationBeanDeclaration`이 필요합니다. 이전 버전의 Liferay를 사용한 구성 빈 선언](./설정-및-액세스-구성.md#configurationbeandeclaration-with-previous-versions-of-liferay)을 참조하세요.
```

## 포틀릿디스플레이로 구성 읽기

[구성 공급자 API](./setting-and-accessing-configurations.md#Reading-the-Configuration-from-the-Application) 에서 구성 값을 읽는 것과 유사하게, 포틀릿 디스플레이 API를 사용하여 애플리케이션의 구성 값에 액세스할 수 있습니다.

```{literalinclude} ./portlet-level-configuration/resources/liferay-x7y2.zip/x7y2-web/src/main/java/com/acme/x7y2/web/internal/portlet/X7Y2Portlet.java
:language: java
:lines: 20-63
```

`X7Y2PortletInstanceConfiguration` 메서드는 `PortletDisplay` 를 사용하여 포틀릿 인스턴스 구성을 가져옵니다. `render()` 메서드는 요청 객체에 구성을 추가하여 JSP 파일의 요청에서 읽을 수 있도록 합니다.

## 포틀릿 환경 설정

포틀릿에 포틀릿 기본 설정을 적용하려면 애플리케이션에 구성 JSP 파일 및 구성 작업도 추가해야 합니다. 포틀릿에서 이러한 파일이 작동하는 방식에 대해 자세히 알아보려면 [포틀릿 기본 설정](../../developing-a-java-web-application/using-mvc/portlet-preferences.md)을 참조하세요.

## 관련 정보

* [범위 설정 구성](./scoping-configurations.md)
* [Portlet특혜](../../developing-a-java-web-application/using-mvc/portlet-preferences.md)
