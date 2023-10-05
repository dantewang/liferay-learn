# データベースアップグレードツールのリファレンス

```{important}
Liferay 7.4 U82/GA82 以降では、`db_upgrade.sh` ファイルの名前が `db_upgrade_client.sh` に変更されました。
```

ここでは、Liferayのアップグレードツールの概要について説明します。

`[LIFERAY_HOME]/tools/portal-tools-db-upgrade-client` フォルダにある `db_upgrade_client.sh` スクリプトを使用してアップグレードツールを起動します（`db_upgrade_client.bat` Windowsの場合）。

## 概要

* [アップグレードツールの使用](#database-upgrade-tool-usage)
* [アップグレードツールの設定](#configuring-the-upgrade-tool)

## データベースアップグレードツールの使用

次のコマンドは、アップグレードツールの使用状況を出力します。

```bash
db_upgrade_client.sh --help
```

次に、アップグレードツールのすべてのコマンドラインオプションを示します。

**--help**または**-h**：ツールのヘルプメッセージを出力します。

**--jvm-opts** or **-j** + **[arg]**：アップグレードプロセスのJVMオプションを設定します。

**--log-file** or **-l** + **[arg]**：ツールのログファイル名を指定します。デフォルト名は`upgrade.log`です。

**--shell** または **-s**：アップグレード作業終了後、[Gogoシェル](../../../liferay-internals/fundamentals/using-the-gogo-shell.md)に自動的に接続します。

### ログ出力

`-l`オプションは、ツールのログファイル名を指定します。

```bash
db_upgrade_client.sh -l "output.log"
```

### 推奨されるJVMオプション

必ずファイルエンコーディングを`UTF-8`に、標準時を`GMT`に設定してください。 データベースアップグレードツールはDXPデータベース上で動作するため、DXPアプリケーションサーバーで使用するものと同じJVMオプションを使用してアップグレードツールを構成する必要もあります。 国と言語のJVMオプションを使用した場合は、それらをアップグレードツールに指定してください。

また、アップグレードツール用の初期メモリ(`-Xmx value`)も割り当てます。 少なくとも2GBを使用してください。 DXPデータベースに10GBを超えるデータがある場合は、初期メモリを増やしてください。

3.2 GBのデータベースと15 GBのドキュメントライブラリを使用したテストシナリオでは、次のJavaプロセス設定が最適でした。

* Xmx 8 GBのRAM
* ファイルエンコーディングUTF-8
* ユーザーの標準時GMT

これらの設定に対応する `db_upgrade_client.sh` コマンドを以下に示す：

```bash
db_upgrade_client.sh -j "-Xmx8000m -Dfile.encoding=UTF-8 -Duser.timezone=GMT"
```

## アップグレードツールの設定

コアのアップグレードには設定が必要です。 最も簡単な方法は、アップグレードツールを使用して構成ファイルをオンザフライで作成することです。 次に、アップグレードツールのコマンドラインインターフェースとの対話の例を示します。

```
Please enter your application server (tomcat):
tomcat

Please enter your application server directory (../../tomcat-9.0.17):

Please enter your extra library directories (../../tomcat-9.0.17/bin):

Please enter your global library directory (../../tomcat-9.0.17/lib):

Please enter your portal directory (../../tomcat-9.0.17/webapps/ROOT):

[ db2 mariadb mysql oracle postgresql sqlserver sybase ]
Please enter your database (mysql):
mariadb

Please enter your database host (localhost):

(etc.)
```

```{note}
省略された値は、括弧内に表示されているデフォルトを使用します。
```

### 手動設定

また、アップグレードツールを事前設定して、ツールが生成するよりも多くの値を設定することもできます。 `［LIFERAY_HOME］/tools/portal-tools-db-upgrade-client/`にある次のファイルを使用して、コアアップグレードを手動で設定します。

* `app-server.properties`：サーバーの場所とライブラリを指定します。
* `portal-upgrade-database.properties`：データベース接続を設定します。
* `portal-upgrade-ext.properties`：アップグレードに必要な残りのポータルプロパティを設定します。 現在のDXPサーバーを複製するには、現在のポータルプロパティ（データベースプロパティを除く）をこのファイルにコピーします。 現在のプロパティを使用する前に、必ず[現在のDXPバージョンに合わせて更新してください](../migrating-configurations-and-properties.md#migrating-portal-properties)。

#### app-server.propertiesの設定

DXPのアプリケーションサーバーを設定するには、次の情報を指定します。

| プロパティ名                      | 意味                                           | メモ                                                                            |
|:--------------------------- |:-------------------------------------------- |:----------------------------------------------------------------------------- |
| `dir`                       | アプリケーションサーバーフォルダの絶対パス。                       |                                                                               |
| `extra.lib.dirs`            | クラスパスに追加するバイナリまたはリソースを含む追加のディレクトリのカンマ区切りリスト。 | `dir`に関連するパスを使用します。                                                           |
| `global.lib.dir`            | アプリケーションサーバーのグローバルライブラリディレクトリ。               | `dir`に関連するパスを使用します。                                                           |
| `portal.dir`                | アプリケーションサーバーでポータルがインストールされているディレクトリ。         | `dir`に関連するパスを使用します。                                                           |
| `server.detector.server.id` | サポートされているアプリケーションサーバーのID。                    | サポートされているID：`jboss`、`jonas`、`resin`、`tomcat`、`weblogic`、`websphere`、`wildfly` |

相対パスはUnixスタイルの形式（フォワードスラッシュ）を使用し、 `/`で始まる必要があります。 たとえば、次のプロパティはWindows用です。

```properties
dir=D:\liferay-dxp\tomcat-9.0.17
extra.lib.dirs=/bin
global.lib.dir=/lib
portal.dir=/webapps/ROOT
server.detector.server.id=tomcat
```

別の例として、次のプロパティはLinux用です。

```properties
dir=/home/user/liferay
extra.lib.dirs=/liferay-portal-master/tomcat-9.0.10/bin
global.lib.dir=/liferay-portal-master/tomcat-9.0.10/lib
portal.dir=/liferay-portal-master/tomcat-9.0.10/webapps/ROOT
server.detector.server.id=tomcat
```

#### portal-upgrade-database.propertiesの構成

次の情報を指定して、アップグレードするデータベースを構成します。 これらのプロパティは、`portal-ext.properties`ファイルで使用する[JDBCポータルプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC)に対応することに注意してください。

* `jdbc.default.driverClassName`
* `jdbc.default.url`
* `jdbc.default.username`
* `jdbc.default.password`

これらの値のリファレンスについては、最新の[ポータルプロパティリファレンス](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html)を参照してください。

#### portal-upgrade-ext.propertiesの構成

[バックアップ](../../maintaining-a-liferay-installation/backing-up.md)から、`portal-ext.properties`ファイルプロパティなどのすべての[ポータルプロパティ](../../reference/portal-properties.md)を追加します。 次のプロパティは、アップグレードを設定するために特に重要です。

* `liferay.home`：[LIFERAY_HOMEフォルダ](../../reference/liferay-home.md)

* `dl.store.impl`：ドキュメントをドキュメントライブラリストアに保持するための実装。 このプロパティは、`*FileSystemStore` 実装を使用している場合にのみ必須です。 `portal-ext.properties`でこのプロパティを更新した場合は、ここに新しい値をコピーします。 それ以外の場合は、次のいずれかの方法でプロパティを設定します。

    ```properties
    dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
    dl.store.impl=com.liferay.portal.store.db.DBStore
    dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
    dl.store.impl=com.liferay.portal.store.s3.S3Store
    ```

* `hibernate.jdbc.batch_size`：パフォーマンスを向上させるために使用されるJDBCバッチサイズ（デフォルトでは_250_に設定）。 _このプロパティを使用するとアップグレードのパフォーマンスが向上しますが、必須ではありません。_

* `upgrade.log.context.enabled`: `true`に設定すると、識別子にタグ付けされたアップグレード関連のログ行が表示されます。 可能な識別子は

    * `{upgrade.component=portal}`: ポータル関連のアップグレード処理用
    * `{upgrade.component=framework}`: アップグレードフレームワークのロジックに関連する処理用
    * `{upgrade.component=<bundleSymbolicName>}.`モジュールに関するアップグレード処理

この機能を使用するには、 [`portal-impl/src/META-INF/portal-log4j.xml`](https://github.com/liferay/liferay-portal/blob/master/portal-impl/src/META-INF/portal-log4j.xml) ファイルを `bundles/tomcat/webapps/ROOT/WEB-INF/META-INF` にコピーし、ファイル名を `portal-log4j-ext.xml`に変更する必要がある。 次に、アペンダーの定義を見つけます。

```
<Appender name="CONSOLE" type="Console">
    <Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m%n" type="PatternLayout" />
</Appender>
```

スレッドコンテキスト情報を出力するようにLog4jに指示する `%X`を含むように定義を変更します。

```
<Appender name="CONSOLE" type="Console">
    <Layout pattern="%d{yyyy-MM-dd HH:mm:ss.SSS} %-5p [%t][%c{1}:%L] %m %X%n" type="PatternLayout" />
</Appender>
```

詳しくは [アップグレードログコンテキスト](./upgrade-log-context.md) をご覧ください。

#### アップグレード構成の例

以下は、カスタマイズして`［LIFERAY_HOME］/tools/portal-tools-db-upgrade-client/`にコピーできるアップグレード構成ファイルの例です。

* `app-server.properties`：

    ```properties
    dir=../../tomcat-9.0.17
    global.lib.dir=lib
    portal.dir=webapps/ROOT
    server.detector.server.id=tomcat
    extra.lib.dirs=bin
    ```

* `portal-upgrade-database.properties`：

    ```properties
    jdbc.default.url=jdbc:mysql://lportal62?characterEncoding=UTF-8&dontTrackOpenResources=true&holdResultsOpenOverStatementClose=true&serverTimezone=GMT&useFastDateParsing=false&useUnicode=true
    jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver
    jdbc.default.username=root
    jdbc.default.password=
    ```

* `portal-upgrade-ext.properties`：

    ```properties
    liferay.home=/home/user/servers/liferay7
    module.framework.base.dir=/home/user/servers/liferay7/osgi
    dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
    ```
