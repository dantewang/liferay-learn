# 構成の設定とアクセス

Liferayの構成フレームワークを使用して、MVCポートレットの設定UIを追加できます。

## サンプルポートレットを参照する

```{include} /_snippets/run-liferay-portal.md
```

次に、以下の手順を実行します。

1. [構成の設定とアクセス](./liferay-n2f3.zip) をダウンロードし、解凍してください。

    ```bash
    curl https://learn.liferay.com/dxp/latest/ja/building-applications/core-frameworks/configuration-framework/liferay-n2f3.zip -O
    ```

    ```bash
    unzip liferay-n2f3.zip
    ```

1. モジュールのルートから、ビルドおよびデプロイします。

    ```bash
    ./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
    ```

    ```{note}
    このコマンドは、デプロイされたjarをDockerコンテナの`/opt/liferay/osgi/modules`にコピーするのと同じです。
    ```

1. Liferay Dockerコンテナコンソールでデプロイを確認します。

    ```
    STARTED com.acme.n2f3.web.0.0 [1650]
    ```

1. サンプルのモジュールが機能していることを確認します。 ブラウザで`https://localhost:8080`を開きます。

1. N2F3ポートレットをページに追加します。 サンプルポートレットは、サンプルウィジェットの下にあります。

    ![N2F3ポートレットをページに追加します。](./setting-and-accessing-configurations/images/01.png)

    UIには、フォントの色、フォントファミリー、フォントサイズの3つの設定可能な属性とともにウェルカムメッセージが表示されます。

1. 構成を変更するには、 ［**コントロールパネル**］ &rarr; ［**設定**］ &rarr; ［**System Settings**］ に移動します。 ［Other］の下の **category.n2f3** をクリックします。

    ![［Other］カテゴリーの下にあるcategory.n2f3をクリックします。](./setting-and-accessing-configurations/images/02.png)

    別のフォントの色、フォントファミリー、およびフォントサイズを入力してみてください。 ［**アップデート**］ ボタンをクリックして、公開されたウィジェットのあるページに戻ります。 属性が変更されたことを確認します。

構成フレームワークの仕組みは次のとおりです。

## 構成インターフェイスを作成する

構成インターフェイスで構成可能な属性を定義するだけで、[システム設定](../../../system-administration/configuring-liferay/system-settings.md)で構成UIを生成できます。

サンプルプロジェクトでは、`N2F3WebConfiguration.java`ファイルが構成インターフェイスです。

```{literalinclude} ./scoping-configurations/resources/liferay-n2f3.zip/n2f3-web/src/main/java/com/acme/n2f3/web/internal/configuration/N2F3WebConfiguration.java
:language: java
:lines: 5-17
```

このサンプルインターフェイスでは、スコープが`Scope.COMPANY`に設定されていることに注意してください。 詳細については、 [スコープ設定](./scoping-configurations.md)を参照してください。

インターフェイスには、フォントの色、フォントファミリー、フォントサイズの3つの設定可能な属性があります。 色とファミリーは`string`型であり、サイズは`int`型であることに注意してください。

`Meta.OCD`は、このクラスを特定のIDを持つ構成として登録します。

```{important}
IDには、構成インターフェイスの完全修飾クラス名（FQCN）を指定する必要があることに注意してください。
```

`Meta.AD`は、デフォルト値や属性が必須項目であるかどうかなど、属性に関する [オプションのメタデータ](http://bnd.bndtools.org/chapters/210-metatype.html) を指定します。 属性値が必要であるがデフォルトが設定されていない場合、管理者はアプリケーションが正しく機能するように設定で値を設定する必要があることに注意してください。

次に、MVCポートレットによって構成がどのように読み取られるかを確認します。

## アプリケーションから構成を読み取る

1. `@Component`アノテーションでは、構成インターフェイスクラスは`configurationPid`で指定されます。

    ```java
    configurationPid = "com.acme.n2f3.web.internal.configuration.N2F3WebConfiguration"
    ```

1. 構成にアクセスするために、`render()`メソッドは`ConfigurationProvider`を利用します。 構成プロバイダーAPIは、さまざまなレベルのスコープで構成を取得するためのメソッドを提供します。 サンプルプロジェクトの構成はインスタンススコープであり、`getCompanyConfiguration()`メソッドを使用して構成を取得します。

    ```{literalinclude} ./scoping-configurations/resources/liferay-n2f3.zip/n2f3-web/src/main/java/com/acme/n2f3/web/internal/portlet/N2F3Portlet.java
    :dedent: 1
    :language: java
    :lines: 44-51
    ```

    構成オブジェクトがリクエストオブジェクトに追加され、アプリケーションのJSPのリクエストから読み取ることができるようになりました。

## JSPから構成にアクセスする

1. 次のimportステートメントは、構成インターフェイスをJSPに追加します。

    ```markup
    <%@ page import="com.acme.n2f3.web.internal.configuration.N2F3WebConfiguration" %>
    ```

1. リクエストオブジェクトから構成オブジェクトが取得され、構成値が読み取られます。

    ```markup
    <%
    N2F3WebConfiguration n2f3WebConfiguration = (N2F3WebConfiguration)request.getAttribute(N2F3WebConfiguration.class.getName());
    %>
    ```

1. 属性`fontColor()`、`fontFamily()`、`fontSize()`をJSPで使用できるようになりました。

## ドロップダウン選択UIを実装する

サンプルプロジェクトには、構成可能な3つの属性があります。 現在、属性はテキスト入力フィールドに手動で入力する必要がありますが、これはさらにカスタマイズできます。

たとえば、入力フィールドの代わりに、フォントファミリー属性のドロップダウンリストを使用できます。 プロジェクトの構成インターフェイスで、`@Meta.AD`アノテーションを次のように置き換えます。

```java
@Meta.AD(
    optionLabels = {"Arial", "Georgia", "Helvetica", "Tahoma", "Verdana"},
    optionValues = {"arial", "georgia", "helvetica", "tahoma", "verdana"},
required = false)
```

サンプルモジュールを再デプロイします。

![フォントファミリーがドロップダウン選択になりました。](./setting-and-accessing-configurations/images/03.png)

これで、フォントファミリー属性はドロップダウン選択になります。

## Liferay の以前のバージョンでの ConfigurationBeanDeclaration。

```{important}
Liferay DXP 7.4 U51+ と Liferay Portal 7.4 GA51+ では、`ConfigurationBeanDeclaration`クラスは必要ありません。 Configuration Provider API には、configration インターフェースが自動的に登録される。
```

Liferay 7.4 Update/GA 51 以前のバージョンでは、Configuration Provider API で使用するために `ConfigurationBeanDeclaration`で設定クラスを登録する必要があります。 `ConfigurationBeanDeclaration` クラスには、構成インターフェースクラスを返すメソッドが1つあります。 これは、システムが設定の変更を随時把握するのに役立ちます。 例えば、N2F3ポートレットの場合、以下のようなクラスを作成します。

```java
@Component(service = ConfigurationBeanDeclaration.class)
public class N2F3WebConfigurationBeanDeclaration
    implements ConfigurationBeanDeclaration {

    @Override
    public Class<?> getConfigurationBeanClass() {
        return N2F3WebConfiguration.class;
    }

}
```

この例では、クラスを `com.acme.n2f3.web.internal.settings.definition` パッケージに配置します。

## さらなるカスタマイゼーション

* [構成の分類](./categorizing-a-configuration.md)
* [スコープ設定](./scoping-configurations)
* [フィールドオプションプロバイダー](./field-options-provider.md)
