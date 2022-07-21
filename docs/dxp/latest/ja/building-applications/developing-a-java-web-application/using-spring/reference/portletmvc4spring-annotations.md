# PortletMVC4Springアノテーション

PortletMVC4Springは、要求をコントローラークラスおよびコントローラーメソッドにマッピングするためのいくつかのアノテーションを提供します。

## `@RenderMapping`アノテーションの例

次の表に、`@RenderMapping`アノテーションの例をいくつか示します。

| 例                                                         | Description                                                                                                         |
|:--------------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------- |
| `@RenderMapping`                                          | 他のハンドラーメソッドが描画リクエストに一致しない場合は、プライマリ描画リクエストを処理します。                                                                    |
| `@RenderMapping(params = "javax.portlet.action=success")` | パラメーター設定`javax.portlet.action=success`がある場合は、描画リクエストを処理します。                                                         |
| `@RenderMapping(param = "foo")`                           | 値に関係なく、`foo`という名前のパラメーターがある場合は、そのリクエストを処理します。                                                                       |
| `@RenderMapping(param = "!bar")`                          | `bar`という名前のパラメーターがない限り、そのリクエストを処理します。                                                                               |
| `@RenderMapping(windowState = "MAXIMIZED")`               | ウィンドウの状態が`MAXIMIZED`の場合は、そのリクエストを処理します。 サポートされているポートレットウィンドウの状態は、`NORMAL`、`MAXIMIZED`、および`MINIMIZED`であることに注意してください。 |

## `@ActionMapping`アノテーションの例

次の表に、`@ActionMapping`アノテーションの例をいくつか示します。

| 例                                                | 説明                                                             |
|:------------------------------------------------ |:-------------------------------------------------------------- |
| `@ActionMapping`                                 | 他のハンドラーメソッドがアクションリクエストに一致しない場合は、プライマリアクションリクエストを処理します。         |
| `@ActionMapping(params = some.param=yourValue")` | パラメーター設定`javax.portlet.action=success`がある場合は、アクションリクエストを処理します。 |
| `@ActionMapping(param = "foo")`                  | 値に関係なく、`foo`という名前のパラメーターがある場合は、そのリクエストを処理します。                  |
| `@ActionMapping(param = "!bar")`                 | `bar`という名前のパラメーターがない限り、そのリクエストを処理します。                          |