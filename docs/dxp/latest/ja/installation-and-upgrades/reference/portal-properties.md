# ポータルプロパティ

構成オプションは、サーバーの起動時に **ポータルプロパティ** 、プロパティファイルから読み取られた名前と値のペアのセット、およびDocker環境変数を使用して指定されます。 [デフォルト値](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html) は`portal-impl.jar/portal.properties`ファイルで指定されています。

一部のプロパティはユーザーインターフェイス（UI）を介して変更できますが、その他のプロパティはプロパティファイルまたはDocker環境変数でのみ変更できます。 これには、データベースへの接続、 [Liferay Home](./liferay-home.md) フォルダの場所の宣言、 [ユーザー認証方法の変更](../securing-liferay/authentication-basics.md#configuring-authentication-type-using-properties) （メールアドレスではなくスクリーンネームで）などがあります。

Liferayのインストールでは、プロパティファイルを使用します。 慣例により、`portal-ext.properties`は、デフォルトのプロパティ値を上書きするために、[`[Liferay Home]`](./liferay-home.md)フォルダまたは`[USER_HOME]`フォルダに作成する必要があります。  新規または変更されたプロパティファイルを適用するには、DXPを再起動する必要があります。

```{warning}
`portal-impl.jar/portal.properties`ファイルを直接変更しないでください。代わりに、変更したいプロパティを上書きするために別のファイルを作成してください。 `portal-ext.properties`ファイルはこの目的のために定義されています。
```

`portal-ext.properties`ファイルを使用してデフォルトのプロパティをオーバーライドすると、以下の利点があります。

* ファイルを他のLiferay DXP環境およびサーバーノードにコピーできます。
* 構成をバージョン管理システムに保存して、構成管理を簡素化できます。
* 最初の起動前にファイルにプロパティを設定することは、Liferayを構成する最も簡単な方法です。

ポータルプロパティは、環境変数（Env変数）とプロパティファイルとともにLiferay Dockerコンテナに適用されます。 ポータルプロパティを使用してDockerコンテナを構成するには、 [Configuring Containers](../installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables) を参照してください。

**内容：**

* [ポータルプロパティの使用](#using-portal-properties)
* [ポータルプロパティの優先度](#portal-property-priority)
* [システム設定と構成ファイルの使用](#using-system-settings-and-configuration-files)

```{note}
DXP 7.3以降、仮想インスタンスごとのポータルプロパティファイル機能は削除されました。 DXPは、`portal-[companyId].properties`形式のファイルから取得したインスタンスごとのプロパティを会社IDと一致するインスタンスに適用しなくなりました。
```

## ポータルプロパティの使用

`［Liferay Home］ /portal-ext.properties`を作成する場合、ベストプラクティスは、関連するセクションを `portal-impl.jar/portal.properties` から `portal-ext.properties` ファイルにコピーし、次に変更することですあなたが望むものへの価値。

```{note}
[セットアップウィザード](../installing-liferay/running-liferay-for-the-first-time.md)を使用する場合、DXPはこれらのプロパティを`[Liferay Home]`の`portal-setup-wizard.properties`というファイルに設定します。
```

以下は設定例です。

### データベース接続の設定

データベース接続プロパティは通常、`portal-ext.properties`ファイルに設定されます。 たとえば、データベース接続を変更する場合は、`portal-ext.properties`ファイルを作成し、[データベース接続プロパティ](./database-templates.md)を必要な値に設定します。

```properties
jdbc.default.driverClassName=org.mariadb.jdbc.Driver
jdbc.default.url=jdbc:mariadb://localhost/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false
jdbc.default.username=joe.bloggs
jdbc.default.password=123456
```

データベース構成の詳細は、[Database Configurations](./database-configurations.md)および [データベーステンプレート](./database-templates.md) を参照してください 。

### Liferay Homeの場所の設定

一部のアプリケーションサーバー(WebLogicなど)では、DXP WARファイルをデプロイする前に
Liferay Homeの場所をカスタマイズする必要があります。  [`liferay.home`](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Liferay%20Home) プロパティは場所を設定します。</p> 



```properties
liferay.home=/home/jbloggs/liferay
```




### ユーザーの認証方法の変更

ユーザの認証方法を変更するには、次の `company.security.auth.type` プロパティ値のいずれかを追加してください。



```properties
company.security.auth.type=emailAddress
```




```properties
company.security.auth.type=screenName
```




```properties
company.security.auth.type=userId
```




## ポータルプロパティの優先度

ポータルプロパティは、次の3つのソースから設定されます。

* `portal-impl.jar`にバンドルされている`portal.properties`
* 拡張プロパティファイル（例： `portal-ext.properties`）
* [環境変数](../installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables)

特定のプロパティでは、最後に読み取られた値が優先されます。 プロパティソースは、`include-and-override`と呼ばれるプロパティを介して構成可能な [決定論的な順序](#configuration-processing) で読み取られます。 



### 構成処理

デフォルトでは、プロパティは次の順序で読み取られます。



```properties
portal-impl.jar/portal.properties
include-and-override=portal-bundle.properties
include-and-override=${liferay.home}/portal-bundle.properties
include-and-override=portal-ext.properties
include-and-override=${liferay.home}/portal-ext.properties
include-and-override=portal-setup-wizard.properties
include-and-override=${liferay.home}/portal-setup-wizard.properties
include-and-override=${external-properties}
include-and-override=${liferay.home}/${external-properties}
[Added `include-and-override` files]
[Liferay Docker Env variables]
```


`portal-impl.jar/portal.properties`ファイルは上記の`include-and-override`定義を指定します。 他の有効なプロパティソースが追加または競合する`include-and-override`プロパティ値を定義している場合、これらはデフォルトをオーバーライドするために使用されます。

![DXPサーバーが使用しているインクルード拡張ファイルのリストは、コントロールパネルの［構成］セクションの［サーバー管理］ページにあります。](./portal-properties/images/01.png)

`${external-properties}` 定義は、DXPのJavaプロパティ `外部プロパティ` （たとえば、 `-Dexternal-properties = some.properties`）に割り当てられたプロパティファイルを表します。

Liferay Dockerコンテナは、Liferay環境変数を、リストに追加されたポータルプロパティソースに集約します。



```{important}
複数のファイルのプロパティをオーバーライドすると、**最後**に定義されたプロパティソースが優先されます。 他のすべては無視されます。
```




### ポータルプロパティの優先度の例

次の例は、プロパティソースと特定のプロパティがDXPを構成する方法を示しています。



#### 例1： `portal-ext.properties` を使用してプロパティをオーバーライドする

アプリケーションサーバーにメールセッションを設定し、デフォルトの`portal-impl.jar/portalとは異なる名前の場合。 roperties`(`mail.session.jndi.name=mail/MailSession`)、`portal-ext.properties`ファイルでメールセッション名を指定します。

`portal-ext.properties`の新しい値：



```properties
mail.session.jndi.name=mail/SomeMailSession
```


結果のプロパティソースの順序：

1. `portal-impl.jar/portal.properties`
1. `[Liferay Home]/portal-ext.properties`

`mail.session.jndi.name`に定義された最後の値は、`［Liferay Home］/portal-ext.properties`にあります。

結果の構成：



```properties
mail.session.jndi.name=mail/SomeMailSession
```




#### 例2：プロパティファイルの追加

開発環境など、特定の環境のプロパティファイルを追加できます。 その後、共通のプロパティには単一の `portal-ext.properties` を、他には環境固有の設定を使用することができます。

1. 環境に応じて任意の拡張ファイル（例： `portal-developer.properties`）を作成し、環境固有のプロパティを追加します。 
   
   

    ```properties
    mail.session.jndi.name=mail/DevMailSession
    ```


1. `include-and-override` プロパティを `portal-ext.properties` ファイルの先頭に追加して、新しい拡張ファイルをプロパティソースとして含みます。 
   
   

    ```properties
    include-and-override=portal-developer.properties
    ```


結果のプロパティソースの順序：

1. `portal-impl.jar/portal.properties`
1. `[Liferay Home]/portal-ext.properties`
1. `[Liferay Home]/portal-developer.properties`

`mail.session.jndi.name`に定義された最後の値は、`［Liferay Home］/portal-developer.properties`にあります。

結果の構成：



```properties
mail.session.jndi.name=mail/DevMailSession
```




```{tip}
必要な数のプロパティファイルを使用することで、DXPの設定管理を簡素化することができます。
```




## システム設定と構成ファイルの使用

一部のプロパティは[システム設定](../../system-administration/configuring-liferay/system-settings.md)と[設定ファイル](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)を使用して設定できます。 たとえば、SAML認証プロパティは、システム設定で使用できるプロパティです。

DXPデータベースに格納されているプロパティは、ポータルプロパティファイルで設定されているプロパティよりも優先されます。

［**設定**］ &rarr; ［**システム設定**］ の ［**コントロールパネル**］ に移動して、［システム設定］を見つけます。 システム設定は`.config`ファイルとしてエクスポートし、ソースコントロールに保存し、分散DXPインストールで使用できます。 システム設定を介して設定されたポータルプロパティと構成ファイルは、データベースに保存されます。 すぐに適用されるプロパティもあれば、サーバーの再起動が必要なプロパティもあります。



## 追加情報

* [ポータルプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html)
* [ポータル開発者プロパティ](../../liferay-internals/reference/portal-developer-properties.md)
* [コンテナの設定](../installing-liferay/using-liferay-docker-images/configuring-containers.md)
* [システム設定](../../system-administration/configuring-liferay/system-settings.md)
* [構成ファイルについて](../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)