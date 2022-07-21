# GraphQL APIの使用

Liferay DXPには、ほとんどのアプリケーションに対応している [GraphQL](https://graphql.org) APIが含まれています。 ここでは、それらを使用する方法を紹介します。 必要なステップはわずか3つです。

1. 使用するAPIを特定します。
1. 必要なデータを含むサイトを特定します。
1. データにアクセスできる資格情報を使用してAPI呼び出しを行います。

## 使用するサービスを特定する

GraphQL APIを呼び出すには、実行中のLiferay DXPが必要です。 Dockerを使用して取得するには、次のコマンドを実行します。

```bash
docker run -it -m 8g -p 8080:8080 [$LIFERAY_LEARN_PORTAL_DOCKER_IMAGE$]
```

Liferay DXPの初期化後、必要なサービスを見つけることができます。

1. `http：// localhost：8080` に移動し、デフォルトの認証情報を使用してサインインします： **ユーザー名：** `test@liferay.com` **パスワード：** `test`

1. 次のURLにアクセスします。
   
        http://localhost:8080/o/api

1. 表示される画面の左上で、セレクタから ［**headless-delivery**］ を選択します。 これはブログ投稿APIを含むカテゴリです。

1. 画面右上の ［**Show GraphQL**］ ボタンをクリックして、Liferayの [GraphiQL](https://github.com/graphql/graphiql) ブラウザを開きます。

1. クリックしたボタンの下にある ［**Docs**］ リンクをクリックします。 これでAPIを閲覧できます。

1. GraphQLでは、最初の操作を **query** 、2番目の操作を **mutation** と呼び、読み込みと書き込みを分離します。 まず最初にブログのエントリーを投稿したいので、 ［**mutation**］ をクリックします。

1. API全体のリストが表示されるので、上部の検索を利用するか、スクロールダウンして、 `createSiteBlogPosting`の呼び出しを見つけます。

    ```graphql
    createSiteBlogPosting(
      blogPosting: InputBlogPosting
      siteKey: String!
      ): BlogPosting
    ```

```{note}
スキーマを直接要求することで、ローカルインストールのAPIを見つけることもできます

`curl 'http://localhost:8080/o/graphql'  -H 'Content-Type: application/json' --data '{"query":"query{ __schema{ queryType{ name fields{ name args{ name } description } } } }","variables":{}}'`


   このURLは認証を必要としませんが、返されたスキーマを管理するのはかなり面倒です。 このため、付属のGraphQLクライアントを使用することをお勧めします。
   ```

![含まれているGraphQLクライアントには、スキーマドキュメントブラウザがあります。](./consuming-graphql-apis/images/01.png)

APIでは、エントリが投稿されるブログを含むサイトを把握している必要があるため、最初にサイトIDを見つける必要があります。

## データを含むサイトを特定する

ブラウザで `http://localhost:8080`にアクセスします。

ここで、デフォルトのサイトIDを見つける必要があります。

1. デフォルトの認証情報を使用してサインインします（**ユーザー名：** `test@liferay.com` **パスワード：** `test`）。
1. ［コントロールパネル］ &rarr; ［Sites］ &rarr; ［Sites］に移動します。
1. Liferayサイトの横にある［Actions］ボタンをクリックし、［**Go to Site Settings**］を選択します。

サイトIDが［Details］セクションの上部に表示されます。 `20122`のような整数になります。

## データにアクセスできる認証情報を使用してサービス呼び出しを行う

これで、呼び出しを行うために必要なものがすべて揃いました。 すべてのWebサービスには、要求しているデータにアクセスできる資格情報を使用してアクセスする必要があります。 含まれているGraphQLクライアントは、ブラウザーを使用して認証します。 スタンドアロンのクライアントを作成する場合は、[OAuth2](../using-oauth2/using-oauth2.md)経由でユーザーを認証する必要があります。

開発中は、URLで資格情報データを渡す基本認証を使用する方がはるかに簡単です。 しかし、これは安全ではないので、 **この方法をプロダクションに決して使用しないでください。**

### 基本認証を使用したGraphQL APIの呼び出し（開発中のみ）

基本認証を使用してサービスを呼び出すには、URLに資格情報を指定します。

```bash
curl --request POST --url http://localhost:8080/o/graphql \ -u test@liferay.com:test  --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20122\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

### OAuth2を使用してサービスを呼び出す

本番環境では、[OAuth2アプリケーション](../using-oauth2/creating-oauth2-applications.md)を作成し、OAuth2プロセスを使用して認証トークンを取得します。 トークンを取得したら、それをHTTPヘッダーに指定します。

```bash
curl --request POST --url http://localhost:8080/o/graphql -H "Authorization: Bearer d5571ff781dc555415c478872f0755c773fa159" --header 'content-type: application/json' --data '{"query":"query {blogPostings(filter: \"\", page: 1, pageSize: 10, search: \"\", siteKey: \"20122\", sort: \"\"){ page  items{ id articleBody headline  creator{ name }}}}"}'
```

## データの取得と投稿

GraphQLクライアントの左上のウィンドウに、すべてのブログエントリを取得する次のコードを配置します。

```graphql
query {blogPostings(filter:"",page:1,pageSize:10,search:"",siteKey:"20122",sort:"")
    {page
     items {
        id
        articleBody
        headline
        creator
            {name
            }
  }
  }
}
```

再生ボタンをクリックして実行すると、ブログエントリが表示されません。

```json
{"data":{"blogPostings":{"page":1,"items":［］}}}
```

次に、ブログエントリを投稿します。

### ブログエントリの投稿

GraphQLスキーマによって、ブログエントリを投稿するために行う必要がある呼び出しが明らかになりました。

1. 公開したいエントリを含むJSONドキュメントを作成します。

   ```json
   {
     "blog": {
         "articleBody": "This Blog entry was created by calling the GraphQL service!",
         "headline": "GraphQL Blog Entry"
     }
   }
    ```

1. スキーマドキュメンテーションに基づいてGraphQLクエリを作成します。

   ```
   mutation CreateBlog($blog: InputBlogPosting){
     createSiteBlogPosting(blogPosting: $blog, siteKey: "20122" ) {
       headline
       articleBody
       id
       friendlyUrlPath
     }

    }
    ```

1. 再度 `http://localhost:8080/o/api`にアクセスしてリクエストを行います。 ［**GraphQLを表示**］ ボタンをクリックします。

1. 左下のクエリ変数ボックスにJSONドキュメントを貼り付けます。

1. Mutationを右上のラベルのないボックスに貼り付けます。

1. 上部の再生ボタンをクリックしてクエリを実行します。

追加したブログエントリがGraphQLクライアントの右ペインに表示されます。

![GraphQLクライアントを使用すると、ブラウザから直接GraphQLサービスを簡単に呼び出すことができます。](./consuming-graphql-apis/images/02.png)

Liferay DXPは、ミューテーションでリクエストされたフィールドを含むブログエントリのJSON表現を返します。

```json
{
  "data": {
    "createSiteBlogPosting": {
      "headline": "GraphQL Blog Entry",
      "articleBody": "This Blog entry was created by calling the GraphQL service!",
      "id": 35541,
      "friendlyUrlPath": "graphql-blog-entry"
    }
  }
}
```

```{note}
これらのリクエストは、cURLなどの任意のWebクライアントで行うことができます：

`curl --request POST --url http://localhost:8080/o/graphql -u test@liferay.com:test --header 'content-type: application/json' --data '{"query":"mutation CreateBlog($blog: InputBlogPosting){   createSiteBlogPosting(blogPosting: $blog, siteKey: \"20122\" ) {    headline    articleBody    id    friendlyUrlPath  }    } ","variables":{"blog":{"articleBody":"This Blog entry was created by using cURL to call the GraphQL service!","headline":"cURL GraphQL Blog Entry"}},"operationName":"CreateBlog"}'`
```

### すべてのブログエントリを取得する

これで、最初のクエリを繰り返すことができます。

```graphql
query {blogPostings(filter:"",page:1,pageSize:10,search:"",siteKey:"20122",sort:"")
    {page
     items {
        id
        articleBody
        headline
        creator
            {name
            }
  }
  }
}
```

Liferay DXPは、投稿したブログエントリを含むJSONを返します。

```json
{
  "data": {
    "blogPostings": {
      "page": 1,
      "items": ［
        {
          "id": 35541,
          "articleBody": "This Blog entry was created by calling the GraphQL service!",
          "headline": "GraphQL Blog Entry",
          "creator": {
            "name": "Test Test"
          }
        }
      ］
    }
  }
}
```

### 単一のブログエントリを取得する

単一のブログエントリを取得するためのGraphQLスキーマからのAPI呼び出しには、パラメーターが1つしかありません。

```
blogPosting(
   blogPostingId: Long
): BlogPosting
```

上記のクエリでブログ投稿のIDが判明したため、必要な投稿のみを取得できます。

```graphql
query {blogPosting(blogPostingId: 35541)
  { id
    headline
    articleBody}
}
```

これをクライアントの左上のウィンドウに貼り付け、［**再生**］ボタンをクリックします。 同じブログエントリを返します。

```json
{
  "data": {
    "blogPosting": {
      "id": 35541,
      "headline": "GraphQL Blog Entry",
      "articleBody": "This Blog entry was created by calling the GraphQL service!"
    }
  }
}
```

### ブログエントリの削除

ブログエントリの削除は、作成と同様にミューテーションです。 その呼び出しは、単一のブログエントリを取得するのとほぼ同じです。

```
deleteBlogPosting(
  blogPostingId: Long
): Boolean
```

クライアントを使用して、次のような呼び出しを行うことができます。

```graphql
mutation {
  deleteBlogPosting(blogPostingId: 35541)
}
```

この呼び出しは、成功または失敗を示すブール値をJSONドキュメントで返します。

```json
{
  "data": {
    "deleteBlogPosting": true
  }
}
```

　 これで、LiferayDXPのGraphQLサービスを呼び出す方法を習得しました。 上記の例では基本認証を使用していることに注意してください。本番環境では、OAuth2を使用して安全な方法でサービスを呼び出します。
