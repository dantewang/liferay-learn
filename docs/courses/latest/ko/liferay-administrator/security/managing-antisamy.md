# AntiSamy 관리

AntiSamy 살균제는 Liferay에서 기본적으로 활성화되어 있습니다. 이 살균제는 사용자가 다양한 Liferay 애플리케이션에서 HTML 및 CSS를 사용할 때 악성 JavaScript 코드가 시스템에 주입되는 것을 방지합니다. 자세한 내용은 [안티사미](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/securing-liferay/using-antisamy) 을 참조하세요.

악의적인 활동을 방지하기 위해 Clarity Vision Solutions의 IT 부서는 JavaScript 코드가 웹 콘텐츠에 배치되는 것을 금지하기로 결정했습니다. 아래에서 실제 동작을 확인하세요.

## AntiSamy 구성

기본적으로 모든 JavaScript 코드는 삭제되어 [fragments]을 제외한 실행이 차단됩니다(https://learn.liferay.com/web/guest/w/dxp/site-building/creating-pages/page-fragments-and-widgets) /using-fragments) 및 [웹 콘텐츠](https://learn.liferay.com/web/guest/w/dxp/content-authoring-and-management/web-content) . 이는 구성의 블랙리스트 및 화이트리스트에 따라 제어됩니다. 실제로 작동하는 모습을 보려면 아래 단계를 따르세요.

1. 기본 웹 콘텐츠를 사이트 페이지에 게시합니다.

   * **제품 메뉴**(![제품 메뉴](../../images/icon-product-menu.png))를 엽니다.
   * **콘텐츠 및 데이터** 아래에서 **웹 콘텐츠** 를 클릭하세요.
   * **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하고 **기본 웹 콘텐츠** 를 선택합니다.
   * 제목에 **foo** 를 입력하세요.
   * **소스**(![코드 아이콘](../../images/icon-code.png))를 클릭하면 코드 보기로 전환됩니다.
   * 다음 JavaScript 코드 조각을 붙여넣습니다.

   ```html
   <script>
   function foo() {
   alert("Hello World!");
   }
   </script>
   <p>Click the button to see the effect.</p>

   <p><button onclick="foo()">Click me</button></p>
   ```

   * **게시** 를 클릭하세요.
   - 왼쪽 탐색 메뉴에서 **Site Builder** 아래의 **Pages** 를 클릭하세요.
   * **추가**(![아이콘 추가](../../images/icon-add.png))를 클릭하여 새 페이지를 추가하세요. **페이지** 를 선택하세요.
   * 다음 화면에서 빈 템플릿을 선택합니다. 페이지 이름으로 'Webcontent'를 입력합니다. **추가** 를 클릭하세요.
   * 왼쪽 탐색에서 조각 및 위젯 탭 아래의 **Widgets** 를 선택합니다.
   * 콘텐츠 관리에서 웹 콘텐츠 표시 위젯을 찾으세요. 페이지로 드래그하세요.
   * 위젯에서 **옵션**(![옵션 아이콘](../../images/icon-actions.png))을 클릭하고 **구성** 을 클릭하세요.
   * 팝업 창에서 방금 생성한 foo 웹 콘텐츠를 선택하세요. **저장** 을 클릭하세요.
   * 마지막으로 **게시** 를 클릭하세요.

1. 실제 스크립트를 확인하세요.

   * 생성한 사이트 페이지(예: `http://localhost:8080/webcontent`)로 이동합니다.
   * **Click me** 버튼을 클릭하세요. JavaScript 경고 상자 팝업을 확인하세요.

   ![The alert box pops up after clicking the button.](./managing-antisamy/images/01.png)

1. 웹 콘텐츠에 AntiSamy를 적용합니다.

   * **글로벌 메뉴**(![글로벌 메뉴](../../images/icon-applications-menu.png)) &rarr; **제어판** &rarr; **시스템 설정** 으로 이동합니다.
   * 보안 섹션에서 **보안 도구** 를 클릭하세요.
   * 왼쪽 탐색 메뉴에서 **AntiSamy Sanitizer** 를 클릭하세요.
   * 마이너스 버튼을 클릭하여 `com.liferay.journal.model.JournalArticle` 화이트리스트 항목을 제거합니다.
   * **저장** 을 클릭하세요.

1. 소독제 효과를 확인하세요.

   * **제품 메뉴**(![제품 메뉴](../../images/icon-product-menu.png))를 엽니다.
   * **콘텐츠 및 데이터** 아래에서 **웹 콘텐츠** 를 클릭하세요.
   * 이전에 생성한 foo 웹 콘텐츠를 클릭하세요.
   * **소스**(![코드 아이콘](../../images/icon-code.png))를 클릭하면 코드 보기로 전환됩니다.
   * 내용을 조금 변경해 보세요. 예를 들어 `Hello World!`를 `Hello Foo!`로 변경합니다.
   * **게시** 를 클릭하세요.
   * 웹 콘텐츠를 다시 클릭하세요. Javascript 코드가 제거되고 콘텐츠가 삭제되었는지 확인하세요.

   ![The web content is sanitized by AntiSamy.](./managing-antisamy/images/02.png)

이 보안 모듈을 완료하신 것을 축하합니다.

## 관련 개념

* [안티사미](https://learn.liferay.com/web/guest/w/dxp/installation-and-upgrades/securing-liferay/using-antisamy)
