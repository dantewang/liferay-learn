# MVCポートレットを使用したアクションの呼び出し

ポートレットの[*アクションフェーズ*](../reference/portlets.md#portlet-phases)は、状態の変更を適用します。 *ポートレットのアクションURL*を使用して、ポートレットのアクション処理メソッドをUIコンポーネントにバインドできます。 これらは、ユーザーの要求をアクションを実行するためのポートレットメソッドにマッピングする`portlet:actionURL`JSPタグです。

ここでは、アクションURLを3つの異なる方法で使用するサンプルポートレットを呼び出して調べる方法を学習します。

## アクションを処理するMVCポートレットをデプロイする

サンプルのMVCポートレットには、個別のポートレットメソッドにマッピングする3つのポートレットアクションURLがあります。

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順に従ってポートレットを配置し、そのアクションをトリガーしてください：

1. サンプルをダウンロードし、解凍します。

   ```bash
   curl https://resources.learn.liferay.com/dxp/latest/en/building-applications/developing-a-java-web-application/using-mvc/liferay-u8t2.zip -O
   ```

   ```bash
   unzip liferay-u8t2.zip
   ```

1. サンプルをビルドしてデプロイします。

    ```bash
    cd liferay-u8t2
    ```

    ```bash
     ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    このコマンドは、モジュールJARをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。
    ```

1. Dockerコンテナコンソールでデプロイを確認します。

    ```bash
    STARTED com.acme.u8t2.web_1.0.0
    ```

1. *［U8T2ポートレット］* ウィジェットを *［サンプル］*カテゴリからウィジェットページに追加します。 U8T2ポートレットが表示されます。

   ![U8T2ポートレットをページに追加しました。](./invoking-actions-with-mvc-portlet/images/01.png)

   ポートレットには3つのリンクがあります。

   * *［Do Something］*
   * *［Do Something Else］*
   * *［Do Something More］*

    各リンクをクリックすると、異なるアクション処理メソッドが呼び出されます。 学習の目的で、各メソッドはそれ自体を識別するメッセージをログに記録します。

1. *［Do Something］* をクリックします。 ポートレットは`doSomething`メソッドの呼び出しをログに記録します。

    ```bash
    [U8T2Portlet:28] Invoke #doSomething(ActionRequest, ActionResponse)
    ```

1. *［Do Something Else］* をクリックします。 ポートレットは`doSomethingElse`メソッドの呼び出しをログに記録します。

    ```bash
    [U8T2Portlet:36] Invoke #doSomethingElse(ActionRequest, ActionResponse)
    ```

1. *［Do Something More］* をクリックします。 ポートレットは`doSomethingMore`メソッドの呼び出しをログに記録します。

    ```bash
    [U8T2Portlet:45] Invoke #doSomethingMore(ActionRequest, ActionResponse)
    ```

これらのアクションは簡単ですが、UIコンポーネントをポートレットのアクション処理メソッドにマッピングするさまざまな方法を示しています。 次に、それらがどのように機能するかを学びます。

## ポートレットのアクション処理メソッドを調べる

`U8T2Portlet`クラスは、3つのアクション処理メソッドを持つ標準の[`MVCPortlet`](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/portal-kernel/src/com/liferay/portal/kernel/portlet/bridges/mvc/MVCPortlet.java)です。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/java/com/acme/u8t2/web/internal/portlet/U8T2Portlet.java
:language: java
:lines: 14-53
```

このクラスは、[`@Component`](https://osgi.org/javadoc/r6/residential/org/osgi/service/component/annotations/Component.html) アノテーションにより、[`Portlet`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/Portlet.html) サービスを提供する OSGi Declarative Services Component としてマークされます。プロパティでは、ポートレットを *Sample* ウィジェットカテゴリで利用できるようにし、ポートレットに *U8T2 Portlet* という名前を付け、ポートレットのデフォルトのビューテンプレートを `/view.jsp` に設定します。

各メソッドは、[`ActionRequest`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ActionRequest.html)および[`ActionResponse`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ActionResponse.html)パラメーターを取ります。 `ActionRequest`はメソッド情報を提供し、`ActionResponse`はメソッドが情報を渡すための手段を提供します。 各サンプルメソッドは、ログメッセージで自身を識別します。

JSP（以下で説明）は、ポートレットアクションURLを使用してサンプルメソッドにマッピングします。 最初の2つのメソッドは、名前を除いて同じです。 最後のメソッドで注目すべき点は、`@ProcessAction(name = "nameForTheDoSomethingMoreMethod")`アノテーションがあることです。 ポートレットアクションURLは、メソッド名の代わりに[`@ProcessAction`](https://docs.liferay.com/portlet-api/3.0/javadocs/javax/portlet/ProcessAction.html)アノテーション名を介してメソッドにマッピングできます。 たとえば、`ProcessAction`名を使用すると、ポートレットアクションURLを壊すことなく、メソッド名を変更したり、別のメソッドにアノテーションを割り当てたりできます。 JSPのポートレットアクションURLを調べることで理解しやすくなります。

## JSPを調べる

`view.jsp`は、ポートレットアクションURLを使用して、UIコンポーネントをポートレットのアクション処理メソッドにバインドします。 `view.jsp`コードは次のとおりです。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:language: javascript
```

最初の行は、`portlet`のプレフィックスを介してポートレット2.0タグライブラリを使用できるようにしています。 このJSPは、タグライブラリの`portlet:actionURL`タグを使用してアクションをUIコンポーネントにバインドします。 各アクションURLを調べます。

## 例1：変数によるアクションURLの参照

`view.jsp`は、次のポートレットアクションURLを宣言します。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:language: javascript
:lines: 3
```

`portlet:actionURL`の`name`属性は、`doSomething`ポートレットメソッドにマッピングされます。 `var`属性は、ポートレットアクションURLを任意の変数に割り当てます。 このJSPは、`actionURL`変数を参照することにより、アクションURLを`DoSomething`というラベルの付いたハイパーリンクにバインドします。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 8
```

このリンクをクリックすると、ポートレットの`doSomething`メソッドが呼び出されます。 アクションURLの変数を参照することにより、アクションURLを複数のUIコンポーネントにバインドできます。

## 例2：UIコンポーネントでアクションURLを宣言する

JSPは、アンカーコンポーネントで別のアクションURLを直接宣言します。

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 12
```

コンポーネントは、アクションをポートレットの`doSomethingElse`メソッドにバインドするアクションURLを宣言します。 これは、アクションURLをマッピングするためのよりコンパクトな方法です。

## 例3：ポートレットアクション名の参照

最後のアンカーで、JSPは、`nameForTheDoSomethingMoreMethod`ポートレットアクション名に関連付けられたアクション処理メソッドにマッピングするアクションURLを宣言します。

JSPアクションURL：

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/resources/META-INF/resources/view.jsp
:dedent: 1
:language: javascript
:lines: 16
```

ポートレットメソッド：

```{literalinclude} ./invoking-actions-with-mvc-portlet/resources/liferay-u8t2.zip/u8t2-web/src/main/java/com/acme/u8t2/web/internal/portlet/U8T2Portlet.java
:dedent: 1
:language: java
:lines: 41-49
```

`nameForTheDoSomethingMoreMethod`と呼ばれるポートレットパラメーターは、アクションURLとメソッド間の結合をより緩やかにします。 たとえば、メソッド名を変更したり、`@ProcessAction(name = "nameForTheDoSomethingMoreMethod")`アノテーションを別のメソッドに割り当てたりすることができます。

## 次のステップ

アクションURLの使用方法がわかったので、アクションメソッドの作成に集中できます。 または、[MVCActionCommandクラス](./mvc-action-command.md)を使用して調査することもできます。 または、他のポートレットフェーズの処理を検討する準備ができている場合は、[MVCRenderCommand](./mvc-render-command.md)クラスと[MVCResourceCommand](./mvc-resource-command.md)クラスの使用を検討してください。

## 関連トピック

* [MVC Action Command](./mvc-action-command.md)
* [MVC Render Command](./mvc-render-command.md)
* [MVC Resource Command](./mvc-resource-command.md)
* [MVCポートレットでのローカライズされたメッセージの使用](./using-localized-messages-in-an-mvc-portlet.md)
