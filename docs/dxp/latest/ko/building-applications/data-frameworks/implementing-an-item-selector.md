# 항목 선택기 구현

**항목 선택기** 는 문서, 비디오 또는 사용자와 같은 자산을 선택하기 위한 팝업 대화 상자입니다.

항목 선택기의 기준을 구성하고 사용법을 정의함으로써 자신의 애플리케이션에 대한 항목 선택기 대화 상자를 만들 수 있습니다.

![Item selectors pop up so users can select assets.](./implementing-an-item-selector/images/01.png)

## 샘플 모듈로 시작

항목 선택기를 구현하려면 이를 위젯용 모듈과 같은 애플리케이션에 포함해야 합니다. 이 예에서는 JSP 보기와 함께 [MVC 포틀릿](../developing-a-java-web-application/using-mvc/using-a-jsp-and-mvc-portlet.md) 사용합니다. 항목 선택기에 선택할 역할 목록이 표시됩니다.

1. 샘플 모듈을 다운로드합니다.

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/liferay-f5d5.zip -O
   ```

   ```bash
   unzip liferay-f5d5.zip
   ```

1. ```{include} ../../_snippets/run-liferay-portal.md
   ```

1. 모듈 루트에서 다음 명령을 실행하여 Docker 컨테이너를 빌드하고 배포합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

   !!! Tip
   이 명령은 배포된 jar를 Docker 컨테이너의 `/opt/liferay/osgi/modules`에 복사하는 것과 동일합니다.

1. Liferay Docker 컨테이너 콘솔에서 배포를 확인합니다.

   ```bash
   STARTED com.acme.f5d5.web_1.0.0 [1017]
   ```

   예제 포틀릿 모듈이 배포되었습니다. 페이지에 추가하면 버튼이 하나 있는 간단한 포틀릿이 됩니다.

   ![The portlet has one button that opens the Item Selector.](./implementing-an-item-selector/images/02.png)

1. _Select_를 클릭하면 항목 선택기가 나타납니다.

   ![The item selector shows items that can be selected by checking the box.](./implementing-an-item-selector/images/03.png)

1. 항목을 선택하면 해당 값이 JavaScript 경고 상자에 나타납니다. 이 항목 선택기는 역할을 선택하므로 표시되는 값은 선택한 역할의 기본 키입니다.

## 컨트롤러에서 항목 선택기 기준 설정

`F5D5Portlet.java` 클래스를 엽니다. MVC 포틀릿에서 포틀릿 클래스는 컨트롤러 클래스(MVC의 C)입니다. 다음 두 가지 작업을 수행해야 합니다.

- 선택기에 필요한 기준을 정의합니다(예: 어떤 엔터티를 선택합니까?)
- 해당 기준에 대한 URL을 만듭니다.

1. 클래스 하단에서 OSGi는 `@Reference` 주석으로 인해 [`ItemSelector` 클래스](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/item-selector/item-selector-api/src/main/java/com/liferay/item/selector/ItemSelector.java) 인스턴스를 주입합니다.

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 1
   :language: java
   :lines: 56-57
   ```

1. 포틀릿의 `render` 메소드로 스크롤하십시오.

1. 이 메서드는 항목 선택기에 표시할 원하는 엔터티를 나타내는 기준 클래스 인스턴스를 만듭니다. 기준 클래스는 [`ItemSelectorCriterion` 인터페이스](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/item-selector/com.liferay.item.selector.api/com/liferay/item/selector/ItemSelectorCriterion.html) 을 구현해야 합니다.

   이 예에서는 역할이 선택기에 표시되도록 [`RoleItemSelectorCriterion`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/roles/com.liferay.roles.item.selector.api/com/liferay/roles/item/selector/RoleItemSelectorCriterion.html) 에 대한 참조를 사용합니다. 클래스의 새 인스턴스를 생성하여 정의됩니다.

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 39-40
   ```

   !!! 팁
   필요한 엔터티 유형에 대한 기준이 없는 경우 `BaseItemSelectorCriterion`을 확장하여 고유한 `ItemSelectorCriterion` 클래스를 만들 수 있습니다.

1. 다음으로, 사용자가 엔터티를 선택할 때 엔터티가 제공하는 정보를 나타내기 위한 반환 유형 클래스가 필요합니다. 반환 유형 클래스는 [`ItemSelectorReturnType` 인터페이스](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/item-selector/com.liferay.item.selector.api/com/liferay/item/selector/ItemSelectorReturnType.html) 을 구현해야 합니다. 예를 들어 클래스는 엔터티의 URL, UUID 또는 기본 키를 반환하는 데 사용될 수 있습니다. 반환 유형 클래스는 이전에 생성된 기준 클래스에 추가됩니다.

   !!! important
   모든 기준 **must** 에는 사용 시 최소한 하나의 반환 유형이 연결되어 있습니다.

이 예에서는 [`UUIDItemSelectorReturnType`](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/modules/apps/item-selector/com.liferay.item.selector.criteria.api/com/liferay/item/selector/criteria/UUIDItemSelectorReturnType.html) 에 대한 참조를 사용하여 선택한 역할의 `UUID` 값을 반환할 데이터로 정의합니다. 여러 역할을 선택한 경우 쉼표로 구분된 목록으로 반환됩니다.

!!! note
UUID를 사용할 수 없는 경우 기본 키가 반환됩니다.

1. 항목 기준에 등록하여 반환 유형을 정의합니다.

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 42-43
   ```

   !!! 팁
   필요한 정보 유형에 대한 반환 클래스가 없으면 [ItemSelectorReturnType](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/item-selector/item-selector-api/src/main/java/com/liferay/item/selector/ItemSelectorReturnType.java) 구현을 사용하여 고유한 클래스를 정의할 수 있습니다.

   항목 선택기는 기준 및 반환 유형 클래스를 사용하여 표시할 항목의 선택 보기(탭으로 표시됨)와 각 항목을 식별하는 방법을 결정합니다.

1. 이제 기준을 사용하여 항목 선택기에 대한 URL을 생성할 수 있습니다. 이 URL은 프런트 엔드 코드에 항목 선택기 대화 상자를 만듭니다.

   [`RequestBackedPortletURLFactory` 클래스](https://resources.learn.liferay.com/reference/latest/en/dxp/javadocs/portal-kernel/com/liferay/portal/kernel/portlet/RequestBackedPortletURLFactory.html) 다음 기준을 사용하여 항목 선택기 URL을 빠르게 생성할 수 있습니다.

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 45-48
   ```

   !!! important
   URL을 생성하는 데 사용하는 문자열(이 예에서는 `selectRole`)은 대화 상자의 이벤트 이름입니다. 이는 나중에 프런트 엔드 코드에서 대화 상자를 만들 때 사용할 값과 일치해야 합니다.

1. JSP에서 사용할 수 있도록 `renderRequest`에 항목 선택기 URL을 추가합니다.

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 50-51
   ```

   `view.jsp` 파일은 프런트엔드 코드가 정의된 곳입니다. Java 클래스의 `render` 메소드에 있는 `renderRequest` 객체가 JSP 파일에 전달됩니다. 컨트롤러(포틀릿 클래스)와 보기(JSP) 모두에서 URL을 식별하려면 상수를 사용하십시오.

1. 마지막으로, 코드가 실행된 후 렌더링 프로세스를 계속하려면 `MVCPortlet`의 `render` 메서드를 호출하세요.

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/java/com/acme/f5d5/web/internal/portlet/F5D5Portlet.java
   :dedent: 2
   :language: java
   :lines: 53
   ```

컨트롤러 코드입니다. 이제 실행은 `view.jsp` 파일에 구현된 뷰 계층(MVC의 V)으로 전달됩니다.

## 보기에서 항목 선택기 사용

항목 선택기를 검색하고 이를 프런트 엔드 코드에서 사용하는 방법을 정의해야 합니다.

1. 예제에서 `view.jsp`를 엽니다.

1. [Clay 버튼](https://clayui.com/docs/components/button.html) 태그를 사용하여 항목 선택기를 여는 버튼을 만들 수 있습니다.

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/resources/META-INF/resources/view.jsp
   :language: jsp
   :lines: 11-14
   ```

   `clay:button` 태그는 ID가 `selectRoleButton`이고 위젯에 Select 라벨이 표시된 버튼을 만듭니다. 이 버튼은 문자열 `<portlet:namespace />selectRoleButton`으로 식별할 수 있습니다.

1. 항목 선택기를 여는 JavaScript를 삽입하려면 `<script>` 태그를 사용하세요.

   ```{literalinclude} ./implementing-an-item-selector/resources/liferay-f5d5.zip/f5d5-web/src/main/resources/META-INF/resources/view.jsp
   :language: jsp
   :lines: 16-34
   ```

이 JavaScript 조각은 먼저 식별자(`portlet:namespace />selectRoleButton`)를 통해 선택 버튼을 검색합니다. 그런 다음 클릭 시 항목 선택기 대화 상자를 생성하는 이벤트 리스너를 추가합니다.

`Liferay.Util.openSelectionModal` 메서드는 대화 상자를 생성합니다.

`onSelect` 필드는 클릭 시 값을 처리하는 함수를 정의해야 합니다. 사용자가 이 함수 내에서 선택할 때 대화 상자의 동작을 정의합니다. 이 구현에서는 선택한 값이 포함된 경고 상자를 표시합니다.

`selectEventName` 필드의 값은 Java 코드의 `RequestBackedPortletURLFactory`와 함께 사용한 문자열과 일치해야 합니다(이 예에서는 `selectRole`). 또한 컨트롤러가 항목을 저장한 요청에서 항목 선택기 URL을 검색해야 합니다. 이를 식별하기 위해 동일한 상수를 사용하고 이를 `url` 필드에 제공해야 합니다.

!!! 팁
항목 선택기가 여러 항목 선택을 지원하도록 하려면 `openSelectionModal` 호출에 `multiple: true`를 추가하여 다중 선택을 활성화할 수 있습니다.

`이벤트`에 저장된 아이템 선택을 사용하세요. 결과에 포함된 데이터 유형과 정보는 Java 코드에서 사용한 반환 유형 클래스에 따라 다릅니다. 이 예제에서는 `UUIDItemSelectorReturnType`을 사용하므로 데이터는 하나 이상의 선택된 항목의 UUID가 포함된 문자열 값입니다.

선택 기능 내에서 값을 사용하려는 방법을 구현합니다. 이 예에서는 간단한 JavaScript 경고를 보여줍니다.

이제 작동 방식을 살펴보았으므로 JavaScript 경고를 더 유용한 것으로 바꿀 수 있습니다.

## 양식 추가

항목 선택기를 사용할 때 선택한 값을 양식에 삽입하려고 합니다. 이를 수행하는 방법은 다음과 같습니다.

1. `view.jsp`를 엽니다.

1. `<clay:button>` 태그를 찾으세요. 다음과 같은 형식으로 둘러쌉니다.

   ```jsp
   <form name="<portlet:namespace/>form">
      <input name="role" />
      <clay:button
         id=`<%= liferayPortletResponse.getNamespace() + "selectRoleButton" %>`
         label="Select"
      />
   </form>
   ```

   이제 `역할`이라는 입력 필드가 하나 있는 양식이 생겼습니다.

1. JavaScript 경고까지 아래로 스크롤합니다. JavaScript 경고를 Liferay의 프런트 엔드 `setFormValues` 메서드 호출로 바꿉니다.

   ```jsp
   Liferay.Util.setFormValues(<portlet:namespace />form, {
          role: event.value
   });
   ```

1. 포틀릿을 재배치합니다.

   ```bash
   ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
   ```

1. 이제 이전과 마찬가지로 항목을 선택합니다. 해당 ID는 생성한 양식 필드에 삽입됩니다.

축하해요! 이제 항목 선택기를 구현하는 방법을 알았습니다!
