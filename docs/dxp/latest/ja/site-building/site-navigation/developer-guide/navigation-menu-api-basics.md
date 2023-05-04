# ナビゲーションメニューAPIの基本

LiferayのREST APIは、Liferayのナビゲーションメニューにサービスを提供します。 APIを使用してナビゲーションメニューを作成および編集できます。 まずは、新しいナビゲーションメニューを追加する例を見てみましょう。

## ナビゲーションメニューの追加

```{include} /_snippets/run-liferay-dxp.md
```

その後、以下の手順で操作してください：

1. [Categories and Vocabulary API Basics](./liferay-p7s4.zip) をダウンロードし、解凍してください。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/site-building/site-navigation/developer-guide/liferay-p7s4.zip -O
   ```

   ```bash
   unzip liferay-p7s4.zip
   ```

2. [サイトのIDを検索します](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) 。 これは、以下のさまざまなサービス呼び出しで使用します。

3. cURLスクリプトを使用して、サイトに新しいナビゲーションメニューを追加します。 コマンドラインで、`curl`フォルダに移動します。 サイトIDをパラメーターとして使用して、`NavigationMenu_POST_ToSite.sh`スクリプトを実行します。

   ```bash
   ./NavigationMenu_POST_ToSite.sh 1234
   ```

   JSONのレスポンスには、新しいナビゲーションメニューが追加されたことが示されています。

   ```json
   {
     "creator" : {
       "additionalName" : "",
       "contentType" : "UserAccount",
       "familyName" : "Test",
       "givenName" : "Test",
       "id" : 20129,
       "name" : "Test Test"
     },
     "dateCreated" : "2021-09-09T21:41:31Z",
     "dateModified" : "2021-09-09T21:41:31Z",
     "id" : 40131,
     "name" : "Foo",
     "navigationMenuItems" : [ ],
     "siteId" : 20125
   }
   ```

4. ［**Administration Menu**］ &rarr; ［**サイトビルダー**］ &rarr; ［**Navigation Menus**］ に移動して、ナビゲーションメニューアプリケーションに移動します。 新しいナビゲーションメニューが追加されたことを確認してください。

    ![新しいナビゲーションメニューが追加されたことを確認してください。](./navigation-menu-api-basics/images/01.png)

5. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

    ```bash
    javac -classpath .:* *.java
    ```

6. 以下のコマンドを使用して`NavigationMenu_POST_ToSite`クラスを実行します。 `siteId`値をサイトのIDに置き換えます。

    ```bash
    java -classpath .:* -DsiteId=1234 NavigationMenu_POST_ToSite
    ```

## cURLコマンドの検証

`NavigationMenu_POST_ToSite.sh`スクリプトは、cURLコマンドを使用してRESTサービスを呼び出します。

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenu_POST_ToSite.sh
    :language: bash
```

コマンドの引数は次のとおりです。

| 引数                                                                             | 説明                              |
|:------------------------------------------------------------------------------ |:------------------------------- |
| `-H "Content-Type: application/json"`                                          | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                      | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/navigation-menus"` | RESTサービスのエンドポイント                |
| `-d "{\"name\": \"Foo\"}"`                                                 | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                                  | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境の場合は、[OAuth2](../../../headless-delivery/using-oauth2.md)経由でユーザーを認証する必要があります。 OAuth2を使用したReactアプリケーションのサンプルは、[OAuth2によるユーザーの認証](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用します。

## Javaクラスを調べる

`NavigationMenu_POST_ToSite.java`クラスは、ナビゲーションメニュー関連サービスを呼び出すことによってナビゲーションメニューを追加します。

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenu_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                                 | 説明                                                                     |
|:-------------------------------------------------------------------------------------- |:---------------------------------------------------------------------- |
| `NavigationMenuResource.Builder builder = ...`                                         | `Builder`を取得し、`NavigationMenuResource`サービスインスタンスを生成します。                |
| `NavigationMenuResource navigationMenuResource = builder.authentication(...).build();` | 基本認証を指定し、`NavigationMenuResource`サービスインスタンスを生成します。                     |
| `NavigationMenu navigationMenu = navigationMenuResource.postSiteNavigationMenu(...);`  | `navigationMenuResource.postSiteNavigationMenu`メソッドを呼び出し、投稿するデータを渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.delivery.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
main``メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと類似していますが、異なる`NavigationMenuResource`メソッドを呼び出します。

```{important}
サービスの詳細は、 [NavigationMenuResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/NavigationMenuResource.java) を参照してください。
```

以下は、cURLとJavaを使って、他の`NavigationMenu` RESTサービスを呼び出す例です。

## サイトからナビゲーションメニューを取得する

次のcURLまたはJavaコマンドを実行すると、サイトのナビゲーションメニューを一覧表示できます。 上記のように、`1234`をサイトのIDに置き換えてください。

### NavigationMenus_GET_FromSite.sh

コマンド：

```bash
./NavigationMenus_GET_FromSite.sh 1234
```

コード：

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenus_GET_FromSite.sh
   :language: bash
```

### NavigationMenus_GET_FromSite.java

コマンド：

```bash
java -classpath .:* -DsiteId=1234 NavigationMenus_GET_FromSite
```

コード：

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenus_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-25
```

サイトの`NavigationMenu`オブジェクトがJSONに一覧表示されます。

## ナビゲーションメニューを取得する

以下のcURLまたはJavaコマンドで特定のナビゲーションメニューを取得します。 `1234` をナビゲーションメニューのIDに置き換えてください。

```{tip}
``NavigationMenus_GET_FromSite.[java|sh]``を使用して、``NavigationMenu``  IDを取得します。
```

### NavigationMenu_GET_ById.sh

コマンド:

```bash
./NavigationMenu_GET_ById.sh 1234
```

コード:

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenu_GET_ById.sh
   :language: bash
```

### NavigationMenu_GET_ById.java

コマンド：

```bash
java -classpath .:* -DnavigationMenuId=1234 NavigationMenu_GET_ById
```

コード：

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenu_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

`NavigationMenu`フィールドがJSONに一覧表示されます。

## ナビゲーションメニューを配置する

次のcURLおよびJavaコマンドを使用して、既存のナビゲーションメニューを完全に上書きします。 なお、 `1234` は、ナビゲーションメニューのIDに置き換えてください。

### NavigationMenu_PUT_ById.sh

コマンド：

```bash
./NavigationMenu_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenu_PUT_ById.sh
   :language: bash
```

### NavigationMenu_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DnavigationMenuId=1234 NavigationMenu_PUT_ById
```

コード：

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenu_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-27
```

## ナビゲーションメニューを削除する

以下のcURLおよびJavaコマンドで既存のナビゲーションメニューを削除します。 なお、 `1234` は、ナビゲーションメニューのIDに置き換えてください。

### NavigationMenu_DELETE_ById.sh

コマンド：

```bash
./NavigationMenu_DELETE_ById.sh 1234
```

コード：

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/curl/NavigationMenu_DELETE_ById.sh
   :language: bash
```

### NavigationMenu_DELETE_ById.java

コマンド

```bash
java -classpath .:* -DnavigationMenuId=1234 NavigationMenu_DELETE_ById
```

コード：

```{literalinclude} ./navigation-menu-api-basics/resources/liferay-p7s4.zip/java/NavigationMenu_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

[APIエクスプローラー](../../../headless-delivery/consuming-apis/consuming-rest-services.md)には、`NavigationMenu`のすべてのサービスとスキーマが一覧表示され、各サービスを試すためのインターフェイスがあります。
