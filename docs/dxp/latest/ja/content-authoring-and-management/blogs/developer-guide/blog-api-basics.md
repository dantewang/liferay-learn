# ブログAPIの基本

LiferayのREST APIは、ブログの投稿や画像を追加、変更、削除するためのサービスを提供します。

まずは、新しいブログ投稿を追加する例を見てみましょう。

## ブログ投稿の追加

```{include} /_snippets/run-liferay-portal.md
```

その後、以下の手順で操作してください：

1. [Blog API Basics](./liferay-r3g4.zip) をダウンロードし、解凍する。

   ```bash
   curl https://learn.liferay.com/dxp/latest/en/content-authoring-and-management/blogs/developer-guide/liferay-r3g4.zip -O
   ```

   ```bash
   unzip liferay-r3g4.zip
   ```

1. [サイトのIDを検索します](../../../headless-delivery/consuming-apis/consuming-rest-services.md#identify-the-site-containing-the-data) 。 これは、以下のさまざまなサービス呼び出しで使用します。

1. cURLスクリプトを使用して、サイトに新しいブログ投稿を追加します。 コマンドラインで、`curl`フォルダに移動します。 サイトIDをパラメーターとして使用して、`BlogPosting_POST_ToSite.sh`スクリプトを実行します。

    ```bash
    ./BlogPosting_POST_ToSite.sh 1234
    ```

    JSON応答では、新しいブログ投稿が追加されたことを示しています。

    ```json
    {
      "alternativeHeadline": "",
      "articleBody": "Foo",
      "creator": {
        "additionalName": "",
        "contentType": "UserAccount",
        "familyName": "Test",
        "givenName": "Test",
        "id": 20125,
        "name": "Test Test"
      },
      "customFields": [],
      "dateCreated": "2021-07-21T21:26:55Z",
      "dateModified": "2021-07-21T21:26:55Z",
      "datePublished": "2021-07-21T21:26:00Z",
      "description": "",
      "encodingFormat": "text/html",
      "friendlyUrlPath": "able",
      "headline": "Able",
      "id": 38511,
      "keywords": [],
      "numberOfComments": 0,
      "relatedContents": [],
      "siteId": 20121,
      "taxonomyCategoryBriefs": []
    }
    ```

1. ［**Administration Menu**］ &rarr; ［**Content & Data**］ &rarr; ［**ブログ**］ に移動して、ブログアプリケーションに移動します。 新しいブログ投稿が追加されたことを確認してください。

    ![新しいブログ投稿が追加されたことを確認してください。](./blog-api-basics/images/01.png)

1. RESTサービスは、Javaクラスで呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 ソースファイルをコンパイルします。

    ```bash
    javac -classpath .:* *.java
    ```

1. `BlogPosting_POST_ToSite`クラスを実行します。 `siteId`値をサイトのIDに置き換えます。

    ```bash
    java -classpath .:* -DsiteId=1234 BlogPosting_POST_ToSite
    ```

## cURLコマンドの検証

`BlogPosting_POST_ToSite.sh`スクリプトは、cURLコマンドを使用してRESTサービスを呼び出します。

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_POST_ToSite.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                          | 説明                              |
|:--------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                       | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                   | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-delivery/v1.0/sites/${1}/blog-postings"` | RESTサービスのエンドポイント                |
| `-d "{\"articleBody\": \"Foo\", \"headline\": \"Able\"}"`           | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:learn"`                                               | 基本的な認証情報                        |

```{note}
ここでは、デモのために基本的な認証を使用しています。 本番環境の場合は、[OAuth2](../../../headless-delivery/using-oauth2.md)経由でユーザーを認証する必要があります。 OAuth2を使用したReactアプリケーションのサンプルは、[OAuth2によるユーザーの認証](../../../headless-delivery/using-oauth2/using-oauth2-to-authorize-users.md)をご覧ください。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`BlogPosting_POST_ToSite.java`クラスは、ブログ投稿関連サービスを呼び出すことにより、ブログ投稿を追加します。

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_POST_ToSite.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

このクラスは、次の3行のコードのみを使用してRESTサービスを呼び出します。

| 行(省略形）                                                                           | 説明                                                              |
|:-------------------------------------------------------------------------------- |:--------------------------------------------------------------- |
| `BlogPostingResource.Builder builder = ...`                                      | `Builder`を取得し、`BlogPostingResource`サービスインスタンスを生成します。            |
| `BlogPostingResource blogPostingResource = builder.authentication(...).build();` | 基本認証を指定し、`BlogPostingResource`サービスインスタンスを生成します。                 |
| `BlogPosting blogPosting = blogPostingResource.postSiteBlogPosting(...);`        | `BlogPostingResource.postSiteBlogPosting`メソッドを呼び出し、データを投稿に渡します。 |

プロジェクトには、依存関係として`com.liferay.headless.delivery.client.jar`ファイルが含まれていることに注意してください。 すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他の例のJavaクラスはこれと類似していますが、異なる`BlogPostingResource`メソッドを呼び出します。

```{important}
サービスの詳細は、 [BlogPostingResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-delivery/headless-delivery-client/src/main/java/com/liferay/headless/delivery/client/resource/v1_0/BlogPostingResource.java) を参照してください。
```

以下は、cURLとJavaを使って、他の`BlogPosting` RESTサービスを呼び出す例です。

## サイトからブログ投稿を取得する

次のcURLまたはJavaコマンドを実行すると、サイトのブログ投稿を一覧表示できます。 上記のように、`1234`をサイトのIDに置き換えてください。

### BlogPostings_GET_FromSite.sh

コマンド:

```bash
./BlogPostings_GET_FromSite.sh 1234
```

コード:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPostings_GET_FromSite.sh
   :language: bash
```

### BlogPostings_GET_FromSite.java

コマンド：

```bash 
java -classpath .:* -DsiteId=1234 BlogPostings_GET_FromSite
```

コード：

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPostings_GET_FromSite.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

サイトの`BlogPosting`オブジェクトがJSONに一覧表示されます。

## ブログ投稿を取得する

次のcURLまたはJavaコマンドを使用して、特定のブログ投稿を取得します。 `1234`をブログ投稿のIDに置き換えてください。

```{tip}
`BlogPosting` のIDを取得するには `BlogPostings_GET_FromSite.[java|sh]` を使ってください。
```

### BlogPosting_GET_ById.sh

コマンド：

```bash
./BlogPosting_GET_ById.sh 1234
```

コード：

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_GET_ById.sh
   :language: bash
```

### BlogPosting_GET_ById.java

コマンド：

```bash
java -classpath .:* -DblogPostingId=1234 BlogPosting_GET_ById
```

コード：

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_GET_ById.java
   :dedent: 1
   :language: java
   :lines: 8-18
```

`BlogPosting`フィールドがJSONに一覧表示されます。

## ブログ投稿にパッチを適用する

次のcURLおよびJavaコマンドを使用して、既存のブログ投稿を部分的に編集します。 注： `1234`をブログ投稿のIDに置き換えてください。

### BlogPosting_PATCH_ById.sh

コマンド：

```bash
./BlogPosting_PATCH_ById.sh 1234
```

コード：

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_PATCH_ById.sh
   :language: bash
```

### BlogPosting_PATCH_ById.java

コマンド：

```bash 
java -classpath .:* -DblogPostingId=1234 BlogPosting_PATCH_ById
```

コード：

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_PATCH_ById.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

この例では、記事の本文の内容がFooからBarに変更されています。

## ブログ投稿をする

次のcURLおよびJavaコマンドを使用して、既存のブログ投稿を完全に上書きします。 注： `1234`をブログ投稿のIDに置き換えてください。

### BlogPosting_PUT_ById.sh

コマンド：

```bash
./BlogPosting_PUT_ById.sh 1234
```

コード：

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_PUT_ById.sh
   :language: bash
```

### BlogPosting_PUT_ById.java

コマンド：

```bash
java -classpath .:* -DblogPostingId=1234 BlogPosting_PUT_ById
```

コード：

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_PUT_ById.java
   :dedent: 1
   :language: java
   :lines: 9-26
```

## ブログ投稿を削除する

次のcURLおよびJavaコマンドを使用して、既存のブログ投稿を削除します。 注： `1234`をブログ投稿のIDに置き換えてください。

### BlogPosting_DELETE_ById.sh

コマンド：

```bash
./BlogPosting_DELETE_ById.sh 1234
```

コード:

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/curl/BlogPosting_DELETE_ById.sh
   :language: bash
```

### BlogPosting_DELETE_ById.java

コマンド

```bash 
java -classpath .:* -DblogPostingId=1234 BlogPosting_DELETE_ById
```

コード：

```{literalinclude} ./blog-api-basics/resources/liferay-r3g4.zip/java/BlogPosting_DELETE_ById.java
   :dedent: 1
   :language: java
   :lines: 8-17
```

## ブログ投稿画像サービス

ブログ画像のcURLコマンドとJavaクラスは、ブログ投稿と同じように機能します。

| ファイル                                         | 説明                      |
|:-------------------------------------------- |:----------------------- |
| `BlogPostingImage_DELETE_ById.[java\|sh]`   | ID別にブログ投稿画像を削除します。      |
| `BlogPostingImage_GET_ById.[java\|sh]`      | ID別に特定のブログ投稿画像を取得します。   |
| `BlogPostingImage_POST_ToSite.[java\|sh]`   | ブログ投稿画像をサイトに投稿します。      |
| `BlogPostingImages_GET_FromSite.[java\|sh]` | サイトからブログ投稿画像のリストを取得します。 |

[APIエクスプローラー](../../../headless-delivery/consuming-apis/consuming-rest-services.md)には、`BlogPosting`および`BlogPostingImage`のすべてのサービスとスキーマが一覧表示され、各サービスを試すためのインターフェースがあります。
