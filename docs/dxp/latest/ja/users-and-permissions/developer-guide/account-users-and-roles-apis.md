# アカウントユーザーとロールのAPI

アプリケーションメニューから [アカウントユーザー](../accounts/account-users.md) と [アカウントロール](../accounts/account-roles.md) を管理することができますが、LiferayのREST APIを利用することもできます。 これらのサービスを呼び出して、アカウントユーザーとロールの作成と管理を行います。

## アカウントユーザーの追加

1. Liferay DXPを起動します。 まだDockerコンテナがない場合は、以下を使用します。

   ```bash
   docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_DXP_DOCKER_IMAGE$]
   ```

1. [アカウントAPIの基本](./liferay-t5p9.zip) をダウンロードして解凍します。

   ```bash
   curl https://learn.liferay.com/dxp/latest/ja/users-and-permissions/developer-guide/liferay-t5p9.zip -O
   ```

   ```bash
   unzip liferay-t5p9.zip
   ```

1. アカウントIDの一覧を取得するには、 [Accounts_GET_FromInstance](./accounts-api-basics.html#get-an-account) リソースを使用します。 ユーザーを追加したいアカウントIDをメモしてください。

1. cURLスクリプトを使用して、新しいアカウントユーザーをアカウントに追加します。 コマンドラインで、 `curl` フォルダに移動します。 アカウントIDをパラメータとして、 `AccountUser_POST_ToAccount.sh` スクリプトを実行します。

   ```bash
   ./AccountUser_POST_ToAccount.sh 1234
   ```

   JSONのレスポンスには、新しいアカウントが追加されたことが示されています。

   ```bash
        {
        "accountBriefs" : [ {
            "id" : 38935,
            "name" : "Able",
            "roleBriefs" : [ ]
        } ],
        "additionalName" : "",
        "alternateName" : "dog",
        "birthDate" : "1977-01-01T00:00:00Z",
        "customFields" : [ ],
        "dashboardURL" : "",
        "dateCreated" : "2021-10-12T21:00:59Z",
        "dateModified" : "2021-10-12T21:01:01Z",
        "emailAddress" : "dog@liferay.com",
        "externalReferenceCode" : "",
        "familyName" : "Easy",
        "givenName" : "Dog",
        "id" : 39005,
        "jobTitle" : "",
        "keywords" : [ ],
        "name" : "Dog Easy",
        "organizationBriefs" : [ ],
        "profileURL" : "",
        "roleBriefs" : [ {
            "id" : 20111,
            "name" : "User"
        } ],
        "siteBriefs" : [ {
            "id" : 20125,
            "name" : "Global"
        }, {
            "id" : 20123,
            "name" : "Guest"
        } ],
        "userAccountContactInformation" : {
            "emailAddresses" : [ ],
            "facebook" : "",
            "jabber" : "",
            "postalAddresses" : [ ],
            "skype" : "",
            "sms" : "",
            "telephones" : [ ],
            "twitter" : "",
            "webUrls" : [ ]
        }
        }     
    ```

1. **グローバルメニュー** &rarr; **アプリケーション** &rarr; **アカウント** に移動します。 ユーザーを作成したアカウントをクリックします。 ［**Users**］ タブをクリックすると、作成された新しいユーザーが表示されます。

  ![新しいアカウントユーザーが追加されたことを確認します。](./account-users-and-roles-apis/images/01.png)

1. RESTサービスは、Javaクライアントを使って呼び出すこともできます。 `curl` フォルダから、 `java` フォルダに移動します。 以下のコマンドでソースファイルをコンパイルします。

    ```bash
    javac -classpath .:* *.java
    ```

2. `AccountUser_POST_ToAccount.java` クラスを以下のコマンドで実行します。 `1234` をアカウントのIDに置き換えてください。

   ```bash
   java -classpath .:* -DaccountId=1234 AccountUser_POST_ToAccount
   ```

## cURLコマンドの検証

`AccountUser_POST_ToAccount.sh` スクリプトは、cURLコマンドでRESTサービスを呼び出します。

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountUser_POST_ToAccount.sh
    :language: bash
```

ここでは、コマンドの引数を紹介します。

| 引数                                                                                                                                           | 説明                              |
|:-------------------------------------------------------------------------------------------------------------------------------------------- |:------------------------------- |
| `-H "Content-Type: application/json"`                                                                                                        | リクエストボディのフォーマットがJSONであることを示します。 |
| `-X POST`                                                                                                                                    | 指定されたエンドポイントで起動するHTTPメソッド       |
| `"http://localhost:8080/o/headless-admin-user/v1.0/accounts/${1}/user-accounts"`                                                             | RESTサービスのエンドポイント                |
| `-d "{\"alternateName\": \"Dog\", \"emailAddress\": \"dog@liferay.com\", \"familyName\": \"Easy\", \"givenName\": \"Dog\"}"` | お客様が掲載を希望するデータ                  |
| `-u "test@liferay.com:test"`                                                                                                                 | 基本的な認証情報                        |

```{note}
ここでは、デモのためにベーシック認証を使用しています。 本番環境では、 [OAuth2](./../../installation-and-upgrades/securing-liferay/configuring-sso/using-oauth2/introduction-to-using-oauth2.md)でユーザーを認証する必要があります。
```

他のcURLコマンドも同様のJSON引数を使用しています。

## Javaクラスを調べる

`Account_POST_ToInstance.java` クラスは、関連するサービスを呼び出して、アカウントユーザーを追加します。

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/Account_POST_ToInstance.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

このクラスは、わずか3行のコードでRESTサービスを呼び出します。

| 行（省略形）                                                                           | 説明                                                                    |
|:-------------------------------------------------------------------------------- |:--------------------------------------------------------------------- |
| `UserAccountResource.Builder builder = ...`                                      | ` UserAccountResource `サービスインスタンスを生成するための`Builder`を取得します。             |
| `UserAccountResource userAccountResource = builder.authentication(...).build();` | ベーシック認証を指定し、 `UserAccountResource` サービスインスタンスを生成します。                  |
| `UserAccount userAccount = userAccountResource.postAccountUserAccount(...);`     | `userAccountResource.postAccountUserAccount` メソッドを呼び出し、データをpostに渡します。 |

Note that the project includes the `com.liferay.headless.admin.user.client.jar` file as a dependency. すべてのRESTアプリケーションのクライアントJAR依存関係情報は、`/o/api`でインストール先のAPIエクスプローラーで確認できます。

```{note}
`main`メソッドのコメントでは、クラスの実行を実演しています。
```

他のJavaクラスの例は、このクラスと似ていますが、異なるメソッドを呼び出しています。

```{important}
サービスの詳細は、 [AccountResource](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/headless/headless-admin-user/headless-admin-user-client/src/main/java/com/liferay/headless/admin/user/client/resource/v1_0/AccountResource.java) を参照してください。
```

以下は、cURLとJavaを使って、関連する他のRESTサービスを呼び出す例です。

## アカウントからアカウントユーザーを取得

以下のcURLまたはJavaコマンドを実行すると、アカウントのユーザーを一覧表示できます。 上記と同様に、 `1234` をアカウントのIDに置き換えてください。

### AccountUsers **GET** FromAccount.sh

コマンド：

```bash
./AccountUsers_GET_FromAccount 1234
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountUsers_GET_FromAccount.sh
   :language: bash
```

### AccountUsers **GET** FromAccount.java

コマンド:

```bash
java -classpath .:* -DaccountId=1234 AccountUsers_GET_FromAccount
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountUsers_GET_FromAccount.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

アカウントの `UserAccountの` オブジェクトがJSONで表示されます。

## アカウントロールの投稿

特定のアカウントに対して新しいアカウントロールを作成します。 なお、 `1234` は、アカウントのIDに置き換えてください。

### AccountRole **POST** ToAccount.sh

コマンド:

```bash
./AccountRole_POST_ToAccount.sh 1234
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountRole_POST_ToAccount.sh
   :language: bash
```

### AccountRole **POST** ToAccount.java

コマンド：

```bash
java -classpath .:* -DaccountId=1234 AccountRole_POST_ToAccount
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountRole_POST_ToAccount.java
   :dedent: 1
   :language: java
   :lines: 9-25
```

## ユーザーをアカウントロールに関連付ける

ユーザーを特定のアカウントロールに関連付けることができます。 `1234` をアカウントのIDに置き換えてください。 お使いのアカウントのロールのIDを`5678` に置き換えます。 `9012` は、アカウントユーザーのIDに置き換えてください。

### AccountRole **POST** UserAssociation.sh

コマンド:

```bash
./AccountRole_POST_UserAssociation.sh 1234 5678 9012
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountRole_POST_UserAssociation.sh
   :language: bash
```

### AccountRole **POST** UserAssociation.java

コマンド:

```bash
java -classpath .:* -DaccountId=1234 -DaccountRoleId=5678 -DuserAccountId=9012 AccountRole_POST_UserAssociation
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountRole_POST_UserAssociation.java
   :dedent: 1
   :language: java
   :lines: 9-19
```

## アカウントからのアカウントロールの取得

以下のcURLまたはJavaコマンドを実行することで、アカウントのアカウントロールを一覧表示することができます。 `1234` をアカウントのIDに置き換えてください。

### AccountRoles **GET** FromAccount.sh

コマンド：

```bash
./AccountRoles_GET_FromAccount.sh 1234
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountRoles_GET_FromAccount.sh
   :language: bash
```

### AccountRoles **GET** FromAccount.java

コマンド:

```bash
java -classpath .:* -DaccountId=1234 AccountRoles_GET_FromAccount
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountRoles_GET_FromAccount.java
   :dedent: 1
   :language: java
   :lines: 11-23
```

アカウントの `AccountRoleの` オブジェクトがJSONで表示されます。

## アカウントロール・ユーザー・アソシエーションの削除

特定のアカウントユーザーからアカウントロールの関連付けを削除します。 `1234` をアカウントのIDに置き換えてください。 お使いのアカウントのロールのIDを`5678` に置き換えます。 `9012` は、アカウントユーザーのIDに置き換えてください。

### AccountRole **DELETE** UserAssociation.sh

コマンド：

```bash
./AccountRole_DELETE_UserAssociation.sh 1234 5678 9012
```

コード：

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/curl/AccountRole_DELETE_UserAssociation.sh
   :language: bash
```

### AccountRole **DELETE** UserAssociation.java

コマンド

```bash
java -classpath .:* -DaccountId=1234 -DaccountRoleId=5678 -DuserAccountId=9012 AccountRole_DELETE_UserAssociation
```

コード:

```{literalinclude} ./accounts-api-basics/resources/liferay-t5p9.zip/java/AccountRole_DELETE_UserAssociation.java
   :dedent: 1
   :language: java
   :lines: 8-19
```

[APIエクスプローラー](../../../headless-delivery/consuming-apis/consuming-rest-services.md)には、`アカウント`のすべてのサービスとスキーマが一覧表示され、各サービスを試すためのインターフェースがあります。
