# 테마 스프라이트 맵 클라이언트 확장 사용

{bdg-secondary}`사용 가능한 Liferay 7.4 U45+/GA45+`

테마 스프라이트 맵 클라이언트 확장을 사용하면 페이지의 아이콘에 사용되는 기본 [Clay](https://clayui.com/docs/components/icon.html) 스프라이트 맵을 재정의할 수 있습니다. [샘플 작업 공간](https://github.com/liferay/liferay-portal/tree/master/workspaces/liferay-sample-workspace) 로 시작하여 클라이언트 확장을 빌드하고 배치하십시오.

```{note}
SVG 스프라이트 맵은 각각 고유한 ID를 가진 함께 그룹화된 여러 아이콘을 포함하는 이미지입니다. SVG를 로드하고 ID로 개별 아이콘을 참조할 수 있습니다. 이렇게 하면 모든 사이트 아이콘을 표시하기 위해 스프라이트 맵을 한 번 다운로드하고 캐시할 수 있으므로 성능이 약간 향상됩니다.
```

## 전제 조건

클라이언트 확장 프로그램 개발을 시작하려면

1. Java(JDK 8 또는 JDK 11)를 설치합니다.

    ```{note}
    지원되는 JDK, 데이터베이스 및 환경에 대한 [호환성 매트릭스](https://help.liferay.com/hc/en-us/articles/4411310034829-Liferay-DXP-7-4-Compatibility-Matrix)를 확인하세요. 권장 JVM 설정은 [JVM 구성](../../../../installation-and-upgrades/reference/jvm-configuration.md)을 참조하십시오. 
    ```

1. 샘플 작업 공간을 다운로드하고 압축을 풉니다.

   ```bash
   curl -o com.liferay.sample.workspace-latest.zip https://repository.liferay.com/nexus/service/local/artifact/maven/content\?r\=liferay-public-releases\&g\=com.liferay.workspace\&a\=com.liferay.sample.workspace\&\v\=LATEST\&p\=zip 
   ```

   ```bash
   unzip com.liferay.sample.workspace-latest.zip
   ```

이제 첫 번째 테마 스프라이트 맵 클라이언트 확장을 배포할 수 있는 도구가 있습니다.

## 테마 스프라이트 맵 프로젝트 검토

테마 스프라이트 맵 클라이언트 확장은 샘플 작업 공간의 `client-extensions/liferay-sample-theme-spritemap-1/` 폴더에 있습니다. `client-extension.yaml` 파일에 정의되어 있습니다.

```yaml
liferay-sample-theme-spritemap-1:
    name: Liferay Sample Theme Spritemap 1
    type: themeSpritemap
    url: spritemap.svg
```

클라이언트 확장은 ID `liferay-sample-theme-spritemap-1` 가지며 유형 및 추가할 스프라이트 맵 파일을 포함하여 테마 스프라이트 맵 클라이언트 확장에 대한 주요 구성을 포함합니다. 사용 가능한 속성에 대한 자세한 내용은 [테마 스프라이트 맵 YAML 구성 참조](../theme-sprite-map-yaml-configuration-reference.md) 을 참조하십시오.

또한 `조립` YAML 블록도 포함합니다.

```yaml
assemble:
    - from: assets
      into: static
```

이는 `assets/` 폴더의 모든 항목이 빌드된 클라이언트 확장 `.zip` 파일에 정적 리소스로 포함되어야 함을 지정합니다. 테마 스프라이트 맵 클라이언트 확장의 SVG 스프라이트 맵은 Liferay에서 정적 리소스로 사용됩니다.

```{important}
샘플 프로젝트의 `assets/spritemap.svg`는 Liferay에서 사용되는 [Clay 아이콘](https://clayui.com/docs/components/icon.html) 스프라이트 맵의 사본입니다. Liferay에서 사용되는 모든 아이콘이 예제 스프라이트 맵에 있으므로 UI의 변경 사항을 알 수 없습니다. 

스프라이트 맵 클라이언트 확장은 선택한 페이지의 전체 스프라이트 맵을 대체하므로 아이콘이 누락되지 않도록 해당 ID가 있는 필요한 모든 아이콘이 있는지 확인하십시오. 
```

## 스프라이트 맵 수정

특정 아이콘을 변경하려면 해당 아이콘의 ID를 찾아야 합니다. 이를 찾기 위해 HTML 요소를 검사할 수 있습니다.

![탐색 모음에는 9개의 아이콘이 있습니다.](./using-a-theme-spritemap-client-extension/images/01.png)

다음은 상단 navbar에서 사용되는 아이콘의 ID입니다.

| 숫자 | 아이콘                                                                  | ID          |
|:-- |:-------------------------------------------------------------------- |:----------- |
| 1  | ![편집 아이콘](../../../../images/icon-edit-pencil.png)                   | 연필          |
| 2  | ![장부 아이콘](../../../../images/icon-cog.png)                           | 장부          |
| 삼  | ![시뮬레이션 아이콘](../../../../images/icon-simulation.png)                 | 시뮬레이션-메뉴-닫힘 |
| 4  | ![분석 아이콘](../../../../images/icon-analytics.png)                     | 해석학         |
| 5  | ![AB 테스트 아이콘](../../../../images/icon-ab-testing.png)                | 시험          |
| 6  | ![정보 아이콘](./using-a-theme-spritemap-client-extension/images/02.png)  | 인포서클        |
| 7  | ![글로벌 메뉴 아이콘](../../../../images/icon-applications-menu.png)         | grid        |
| 8  | ![검색 아이콘](./using-a-theme-spritemap-client-extension/images/03.png)  | 검색          |
| 9  | ![사용자 아이콘](./using-a-theme-spritemap-client-extension/images/04.png) | 사용자         |

연필 아이콘을 물고기로 바꾸려면

1. `assets/spritemap.svg`내에서 `pencil` 의 ID에 해당하는 `<symbol>` 태그를 찾습니다. 이것을 보려면 텍스트 편집기에서 SVG 파일을 열어야 합니다.

   ```html
   <symbol id="pencil" viewBox="0 0 512 512">
      <path class="lexicon-icon-body" d="M490.9,363.4l-2.8-5.1C468.3,322.4,359.9,304,358.9,304l-2.4-0.1l-10.8,1.5c-16.9,3.9-31,15.7-50.5,33.8c-25.2-14.7-52.4-37.6-68.7-54.3c-16.7-17.1-39.9-47.7-52.4-71.6c22-21.6,37.4-38.7,38.4-61.7c0-1-13.8-110.1-48.9-131.7l0,0l-5.1-3.1c-9.6-5.7-27.5-16.4-49.3-16.4c-5.4,0-10.8,0.7-17,2.3c-6.9,2-13.3,4.8-20,9.1C55.9,23,26.2,46.7,11.7,78c-13.5,30.8-4.4,187.9,113.4,311c111.6,116.8,241.2,122.7,266.1,122.7c6.4,0,15.1-0.3,22.4-1.6l2.8-0.1l6.7-2.5c32.2-13.2,56.9-41.7,68.4-57.2C518.4,415.5,497.8,376.6,490.9,363.4L490.9,363.4z" fill="none"></path>
      <path class="lexicon-icon-outline" d="M490.9,363.4l-2.8-5.1C468.3,322.4,359.9,304,358.9,304l-2.4-0.1l-10.8,1.5c-16.9,3.9-31,15.7-50.5,33.8c-25.2-14.7-52.4-37.6-68.7-54.3c-16.7-17.1-39.9-47.7-52.4-71.6c22-21.6,37.4-38.7,38.4-61.7c0-1-13.8-110.1-48.9-131.7l0,0l-5.1-3.1c-9.6-5.7-27.5-16.4-49.3-16.4c-5.4,0-10.8,0.7-17,2.3c-6.9,2-13.3,4.8-20,9.1C55.9,23,26.2,46.7,11.7,78c-13.5,30.8-4.4,187.9,113.4,311c111.6,116.8,241.2,122.7,266.1,122.7c6.4,0,15.1-0.3,22.4-1.6l2.8-0.1l6.7-2.5c32.2-13.2,56.9-41.7,68.4-57.2C518.4,415.5,497.8,376.6,490.9,363.4L490.9,363.4z M445.4,415.1c-10.5,14-27.3,31.3-42.6,38c-1.5,0.2-5.4,0.6-11.6,0.6c-20.7,0-128.8-5.1-224.1-104.8C67,244.3,62.6,119,65.5,100c6.6-12.7,21.2-27.7,38.7-39.8c0.5-0.3,1.9-1.1,3.4-1.6c5.5-1.4,15.6,4.6,21,7.8l2.4,1.5c8.1,13.5,20.6,63.6,23.3,81.2c-3.8,6.4-19.2,21.4-27.7,29.8l-1,1.1c-11.9,12.8-15.5,31.2-8.9,47.3c14.2,32.9,45.9,75.3,68.4,98.3c22.1,22.8,59.4,53.4,93.2,70.6c16.3,8.1,36.3,4.8,49.1-7.5c10.1-9.4,25-23.4,30.6-26.3c17.6,3.4,67.7,18.2,80.8,26.7l1.1,2C446.9,404.3,448.5,411,445.4,415.1L445.4,415.1z"></path>
   </symbol>
   ```

2. 이를 사용자 지정 아이콘으로 바꾸고 동일한 ID(`연필`)를 지정합니다. 물고기 아이콘에 아래 `기호` 사용하십시오.

   ```html
   <symbol id="pencil" viewBox="0 26 100 48">
      <path d="M98.5,47.5C96.5,45.5,81,35,62,35c-2.1,0-4.2,0.1-6.2,0.3L39,26c0,4.5,1.3,9,2.4,12.1C31.7,40.7,23.3,44,16,44L0,34
      c0,8,4,16,4,16s-4,8-4,16l16-10c7.3,0,15.7,3.3,25.4,5.9C40.3,65,39,69.5,39,74l16.8-9.3c2,0.2,4.1,0.3,6.2,0.3
      c19,0,34.5-10.5,36.5-12.5S100.5,49.5,98.5,47.5z M85.5,50c-1.4,0-2.5-1.1-2.5-2.5s1.1-2.5,2.5-2.5s2.5,1.1,2.5,2.5
      C88,48.9,86.9,50,85.5,50z"/>
   </symbol>
   ```

## 스프라이트 맵 클라이언트 확장 배포
```{include} /_snippets/run-liferay-portal.md
```

Next, run this command from the client extension project's folder in the sample workspace:

```bash
../../gradlew clean deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

이렇게 하면 클라이언트 확장이 빌드되고 zip이 Liferay의 `deploy/` 폴더에 배포됩니다.

```{note}
클라이언트 확장을 Liferay Experience Cloud에 배포하려면 Liferay Cloud [명령줄 도구](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool)를 사용하여 [`lcp 배포`](https://learn.liferay.com/w/liferay-cloud/reference/command-line-tool#deploying-to-your-liferay-cloud-environment).
```

```{tip}
작업 공간의 모든 클라이언트 확장을 동시에 배포하려면 `client-extensions/` 폴더에서 명령을 실행합니다.
```

Liferay 인스턴스의 콘솔에서 배포를 확인합니다.

```bash
STARTED liferay-sample-theme-spritemap-1_1.0.0
```

## 페이지에서 새 스프라이트 맵 사용

```{note}
테마 스프라이트 맵 클라이언트 확장은 현재 [릴리스 기능 플래그](../../../../system-administration/configuring-liferay/feature-flags.md#release-feature-flags) 뒤에 있습니다. 사용을 시작하기 전에 기능 플래그를 활성화해야 합니다.
```

배포된 클라이언트 확장을 사용하도록 페이지를 구성합니다.

1. 페이지로 이동한 다음 상단의 _편집_ (![Edit icon](../../../../images/icon-edit-pencil.png))을 클릭합니다.

1. 사이드바에서 페이지 디자인 옵션 메뉴(![Page Design Options icon](../../../../images/icon-format.png))로 이동하고 메뉴 상단에서 _구성_ (![Configuration icon](../../../../images/icon-cog3.png))를 클릭합니다.

1. 테마 스프라이트 맵 클라이언트 확장 섹션에서 _추가_ (![Add](../../../../images/icon-duplicate.png))을 클릭합니다.

1. 새로 배포된 스프라이트 맵인 _Liferay Sample Theme Spritemap 1_을 선택합니다.

   ![Liferay 샘플 테마 Spritemap 1 클라이언트 확장을 선택하고 저장을 클릭합니다.](./using-a-theme-spritemap-client-extension/images/05.gif)

1. 아래로 스크롤하여 _저장_클릭합니다.

1. 페이지로 돌아갑니다. 탐색 모음에서 편집 기능을 위해 물고기 아이콘이 연필(![Edit icon](../../../../images/icon-edit-pencil.png))을 대체했습니다.

![스프라이트 맵의 새 아이콘이 탐색 모음에 나타납니다.](./using-a-theme-spritemap-client-extension/images/06.png)

## 다음 단계

테마 스프라이트 맵 클라이언트 확장을 성공적으로 사용했습니다. 그런 다음 다른 클라이언트 확장 유형을 배포해 보십시오.

* [CSS 클라이언트 확장 사용](./using-a-css-client-extension.md)
* [JS 클라이언트 확장 사용](./using-a-javascript-client-extension.md)
* [테마 Favicon 클라이언트 확장 사용](./using-a-theme-favicon-client-extension.md)
