# ローカルでサービスを呼び出す

DXP/Portalにデプロイされたサービスビルダーサービスは、同じJVM内の他のクラスから呼び出すことができます。 これらのサービスはクラスに対して **ローカル** です。

サービスビルダーサービスは、宣言型サービス（DS）コンポーネントです。つまり、コンテナで管理されます。 コンシューマはコンテナにコンポーネントを要求し、コンテナは一致するコンポーネントインスタンスを提供します。

クラスをDSコンポーネントとして実装する利点は、クラスが依存する他のコンポーネントが使用可能でなければ、そのクラスが有効にならない点です。 コンポーネントの依存関係が満たされていないためにコンポーネントをアクティブ化できない場合、ランタイムフレームワークがその問題を報告します。

ここでは、[portlet](../../../developing-a-java-web-application/reference/portlets.md)DSコンポーネントからサービスビルダーサービスを呼び出します。  新しいエントリーを追加するためのフォームがあるポートレットアプリケーションの例を使用します。 フォームはJavaServer Page（JSP）にあります。 フォームを送信すると、ポートレットがトリガーされ、エントリを作成して永続化するためのサービスが呼び出されます。

## ポートレットからサービスを呼び出す

```{include} /_snippets/run-liferay-dxp.md
```

次に、以下の手順を実行します。

1. サンプルをダウンロードし、解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/data-frameworks/service-builder/service-builder-basics/liferay-t2p5.zip -O
   ```

   ```bash
   unzip liferay-t2p5.zip
   ```

1. サンプルをビルドしてデプロイします。

    ```bash
    cd liferay-t2p5
    ```

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    このコマンドは、モジュールJARをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。
    ```

1. Dockerコンテナコンソールでデプロイを確認します。

    ```bash
    STARTED com.acme.t2p5.api_1.0.0
    STARTED com.acme.t2p5.service_1.0.0
    STARTED com.acme.t2p5.web_1.0.0
    ```

1. **T2P5ポートレット** ウィジェットを ［**サンプル**］ カテゴリからウィジェットページに追加します。 T2P5ポートレットが表示されます。

   ![T2P5ポートレットをページに追加しました。](./invoking-a-service-locally/images/01.png)

1. テキストフィールドにエントリ名と説明を入力し、 ［**Submit**］ をクリックします。 例:

    ［**Name**］ : `Trim the Hedges`

    ［**Description］:** `Use hedge clippers to trim the hedges into a nice shape.`

![T2P5ポートレットをページに追加しました。](./invoking-a-service-locally/images/02.png)

名前と説明を含む新しいエントリーが ［**T2P5 Entry**］ リストに表示されます。

ポートレットからサービスビルダーサービスを呼び出しました。 その仕組みを、サービスAPIから見ていきましょう。

## サービスAPIを調べる

`t2p5-api`モジュールプロジェクトの`T2P5EntryLocalService`クラスには、`addT2P5Entry(String description, String name)`というメソッドがあります。

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-api/src/main/java/com/acme/t2p5/service/T2P5EntryLocalService.java
   :dedent: 1
   :language: java
   :lines: 65-66
```

`addT2P5Entry`メソッドは、指定された説明と名前で`T2P5Entry`を作成し、エントリーを永続化します。

```{note}
`t2p5-service`モジュールプロジェクトの` T2P5EntryLocalServiceImpl`クラスは、 `T2P5EntryLocalService`インターフェイスを実装します。
```

`t2p5-api`モジュールの`bnd.bnd`ファイルは、`com.acme.t2p5.service`パッケージ、`com.acme.t2p5.model`パッケージ、およびコンシューマが使用するその他のパッケージのエクスポートを宣言します。 `bnd.bnd`ファイルは次のとおりです。

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-api/bnd.bnd
```

`t2p5-web` モジュールのポートレットアプリケーションは `T2P5EntryLocalService` クラスに依存している。web モジュールの `build.gradle` ファイルは `t2p5-api` プロジェクトへの依存を宣言している。

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-web/build.gradle
```

```{note}
アーティファクトの検索と依存関係の指定については、[依存関係の構成](../../../../liferay-internals/fundamentals/configuring-dependencies.md)を参照してください。
```

## ポートレットを調べる

`t2p5-web`モジュールの`T2P5Portlet`クラスは、`T2P5Entry`インスタンスを追加する要求を処理します。 `T2P5Portlet`クラスは次のとおりです。

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-web/src/main/java/com/acme/t2p5/web/internal/portlet/T2P5Portlet.java
:language: java
:lines: 16-38
```

`T2P5Portlet`は[`MVCPortlet`](../../../developing-a-java-web-application/using-mvc.md)です。 `_t2p5EntryLocalService`と呼ばれる`T2P5EntryLocalService`フィールドと、`addT2P5Entry`と呼ばれるアクション処理メソッドがあります。

`_t2p5EntryLocalService`フィールドの`@Reference`アノテーションは、`T2P5EntryLocalService`コンポーネントインスタンスをフィールドに挿入するようにランタイムフレームワークにシグナルを送信します。

```{note}
`@Reference`アノテーションの使用に関する詳細と、他の方法でサービスにアクセスする詳細については、[コアフレームワーク](../../../core-frameworks.md)の*依存性注入*を参照してください。
```

`addT2P5Entry`メソッドは、`T2P5EntryLocalService`'の`addT2P5Entry`メソッドを呼び出し、`ActionRequest`から取得した説明と名前のパラメーターを渡します。

ポートレットの`view.jsp`テンプレート（次で説明）は、`ActionRequests`を`T2P5Portlet`に送信します。

## JSPを調べる

`view.jsp`は、エントリを追加するためのフォームを提供し、現在のすべてのエントリを表示します。

```{literalinclude} ./invoking-a-service-locally/resources/liferay-t2p5.zip/t2p5-web/src/main/resources/META-INF/resources/view.jsp
:language: jsp
```

JSPは、次のタグライブラリのタグを使用します。

* コアJSTL
* ポートレット
* LiferayのAlloy UI（`aui`）

次のクラスをインポートします。

* `T2P5Entry`
* `T2P5EntryLocalServiceUtil`
* `java.util.List`

ページの ［**Add T2P5 Entry**］ セクションには、エントリーを追加するためのフォームがあります。 `<portlet:defineObjects />`タグは、標準のポートレットオブジェクトをテンプレートで使用できるようにします。 `aui`タグは、これらのオブジェクトを使用します。

`<portlet:actionURL name="addT2P5Entry" var="addT2P5EntryURL" />`タグは、`addT2P5EntryURL`変数を`addT2P5Entry`という名前のポートレットアクションにマッピングします。 この`actionURL`を使用して`ActionRequest`を送信すると、ポートレットのメソッド`addT2P5Entry`が呼び出されます。これは、このメソッドが`actionUrl`名`addT2P5Entry`にマッピングされるためです。

`<aui:form>`は、エントリーの名前と説明のテキストフィールドをレンダリングします。 フォームを送信すると、その値が`ActionRequest`とともにポートレットメソッドに渡されます。

```{note}
ポートレットアクションの詳細については、[MVCポートレットを使用したアクションの呼び出し](../../../developing-a-java-web-application/using-mvc/invoking-actions-with-mvc-portlet.md)を参照してください。 
```

ページの ［**エントリ**］ セクションには、すべてのエントリーが一覧表示されます。  `T2P5EntryLocalServiceUtil.getT2P5Entries(-1, -1)`を呼び出すことにより、すべてのエントリーを取得します。最小値と最大値の範囲の値`-1`は、すべてのエントリーを返すようにメソッドに指示します。

ポートレットアプリケーションからサービスビルダーサービスを呼び出しました。 これらのサービスは、MVCポートレットで簡単に使用できます。

## 次のステップ

サービスビルダーの基本を理解したので、[エンティティの定義](../defining-entities.md)を調べて、エンティティ間の関係を作成したり、エンティティをローカライズしたり、クエリをサポートしたりできます。  または、[サービスビルダーによるビジネスロジック](../business-logic-with-service-builder.md)を学ぶこともできます。

## 関連トピック

* [ポートレット](../../../developing-a-java-web-application/reference/portlets.md)
* [MVCの使用](../../../developing-a-java-web-application/using-mvc.md)
* [JSPおよびMVCポートレットの使用](../../../developing-a-java-web-application/using-mvc/using-a-jsp-and-mvc-portlet.md)
* [MVCアクションコマンド](../../../developing-a-java-web-application/using-mvc/mvc-action-command.md)
