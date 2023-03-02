# データベースアップグレードツールの使用

Liferayデータベースアップグレードツールは、Liferay DXPデータベースおよびLiferay Portalデータベースをオフラインでアップグレードするためのクライアントプログラムです。

```{important}
アップグレードする前に、**必ず**データとインストールを[バックアップ](../../maintaining-a-liferay-installation/backing-up.md)してください。 バックアップコピーでアップグレードプロセスをテストすることをお勧めします。
```

```{important}
6.2以前からアップグレードする場合は、ファイルストアの構成を更新します。 詳細については、[Updating the File Store](../reference/file-store-updates.md) を参照してください。
```

Liferayインスタンスから切り離された状態でデータベースを変更すると、[データベースをアップグレード操作用に調整](../upgrade-stability-and-performance/database-tuning-for-upgrades.md)し、[不要なデータ（Webコンテンツ、ドキュメントなどの不要なバージョンなど）を削除](../upgrade-stability-and-performance/database-tuning-for-upgrades.md)して、アップグレードのパフォーマンスを向上させ、アップグレードの問題を解決できます。  これらのアクティビティは、DXPをはじめとする大規模で重要なポータル環境を安全かつ迅速にアップグレードするために特に重要です。 データベースの調整と削除を考慮し、 [アップグレードの基本](../upgrade-basics.md) で説明されている関連タスクを完了すると、新しいインストールをセットアップし、アップグレードツールを使用してデータベースをアップグレードする準備が整います。

[新しいLiferay Dockerイメージにアップグレード](../../installing-liferay/using-liferay-docker-images/upgrading-to-a-new-docker-image.md)していて、アップグレードツールを使用する場合は、新しいLiferayバージョンの[Liferay Tomcat Bundle](../../installing-liferay/installing-a-liferay-tomcat-bundle.md)からそのツールを使用します。 このツールは、バンドルの`tools/portal-tools-db-upgrade-client`フォルダにあります。

新しいLiferayリリースをアプリケーションサーバーにインストールした場合は、`[Liferay Home]/tools/portal-tools-db-upgrade-client`フォルダを作成し、アップグレードツールをダウンロードして、ツールを新しいフォルダにインストールします。

| 編集                     | ダウンロード手順                                                                                                                                                                                                                                    |
|:---------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Liferay DXP（サブスクリプション） | [［**Downloads**］ ページ](https://customer.liferay.com/group/customer/downloads) に移動し、DXPバージョンと ［**製品/サービスパック**］ のファイルタイプを選択します。 表示されるリストで、 **Liferay DXPアップグレードクライアント** 用の ［**Download**］ をクリックします。                                                            |
| Liferay Portal         | [［**Downloads**］ ページ](https://www.liferay.com/downloads-community) に移動します。 ［**Liferay Portal**］ ダウンロードメニューで、 ［**Other files**］ を選択して、 ［**ダウンロード**］ をクリックします。 最新のLiferay PortalのリリースアセットのGitHubページが表示されます。 `liferay-ce-portal-tools-[version].zip`をクリックします。 |

## 新規インストール時の設定

1. 新しいLiferayインストールの`[Liferay Home]/data`フォルダを[バックアップ](../../maintaining-a-liferay-installation/backing-up.md)の`[Liferay Home]/data`フォルダに置き換えます。

1. DXPアクティベーションキー（サブスクリプション）と[OSGi設定ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)を[バックアップ](../../maintaining-a-liferay-installation/backing-up.md#liferay-home)から新しいインストールにコピーしてください。

1. 7.2 にアップグレードする場合、新しいインストールの `[Liferay Home]/files/osgi/configs/` フォルダ内の [configuration file](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) でサーチインデックスを無効化することができます。例えば

    ```bash
    cd liferay-home
    ```

    ```bash
    mkdir -p osgi/configs
    ```

    ```bash
    echo "indexReadOnly=\"true\"" >> osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
    ```

    ```{note}
    DXP/Portal 7.3以降は、検索インデックスが自動的に無効/再有効化されます。
    ```

1. [コマース](https://learn.liferay.com/commerce/latest/ja/index.html) を使用している場合は、コマースをアップグレードする準備をしてください。  詳細については、 [Liferay Commerceのアップグレード](https://learn.liferay.com/commerce/latest/ja/installation-and-upgrades/upgrading-liferay-commerce.html) を参照してください。

1. Liferayデータベースのアップグレードと一緒にマーケットプレイスアプリのデータをアップグレードする場合は、新しいLiferayバージョンの対象となる各アプリの最新バージョンを[ダウンロード](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md)して、`[Liferay Home]/deploy`フォルダにコピーします。 それ以外の場合は、 [アップグレード後の考慮事項](./post-upgrade-considerations.md) で説明されているように、データベースのアップグレード後にアプリをインストールし、データをアップグレードできます。 

1. [高度なファイルシステムストア](../../../system-administration/file-storage.md)または[簡易ファイルシステムストア](../../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md)を使用していて、保存場所を変更している場合は、ファイルストアの設定を [`.config`ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md#creating-configuration-files) にエクスポートして、新しい`[Liferay Home]/osgi/configs/`フォルダにコピーします。 

    ```{important}
    [高度なファイルシステムストア](../../../system-administration/file-storage.md)を使用している場合は、データベースをアップグレードする前に、新しいインストールで `.config`ファイルを使って設定する必要があります。

    以下に例を示します。
必要な`rootDir`パラメーターを含む`com.liferay.portal.store.file.system.configuration.AdvancedFileSystemStoreConfiguration.config`ファイル： 

    `rootDir="data/document_library"`
    ```

1. データベースベンダーの推奨するJDBCドライバーを使用してください。 たとえば、MySQLを使用している場合は、[`portal-ext.properties`](../../reference/portal-properties.md)ファイルで`jdbc.default.driverClassName=com.mysql.cj.jdbc.Driver`を設定し、アプリケーションサーバーが使用するMySQL JDBCドライバーのJARを置き換えます。 詳細は、 [Database Drivers](../migrating-configurations-and-properties.md#database-drivers) を参照してください。
   
   アップグレードツールのプロンプトに応答するか、 [アップグレードプロパティファイルを使用](../reference/database-upgrade-tool-reference.md#manual-configuration) して、アップグレードを構成できます。 

    ```{note}
    [新しいLiferay Dockerイメージにアップグレードする](../../installing-liferay/using-liferay-docker-images/upgrading-to-a-new-docker-image.md)場合は、Docker環境変数の代わりに[ポータルプロパティ](../../reference/portal-properties.md)ファイルを使用してデータベース接続を指定してください。 [ポータルプロパティリファレンス](https://docs.liferay.com/dxp/portal/7.3-latest/propertiesdoc/portal.properties.html) には、各Liferay環境変数に対応するポータルプロパティが一覧表示されています。
    ```

1. (Optional) Enable [upgrade reporting](../reference/upgrade-reports.md) to log environment, changes, and more to report. 

    ```bash
    echo "upgrade.report.enabled=\"true\"" << tools/portal-tools-db-upgrade-client/portal-upgrade-ext.properties
    ```

### 一括挿入のプロパティ

`portal-upgrade-database.properties` ファイルで、JDBC 構成のバッチ挿入プロパティを有効にすることができます。 これは、挿入文を一括して高速に実行することにより、パフォーマンスを向上させるものです。 ベンダーのプロパティパラメータについては、以下の表を参照してください。 この機能は、DB2およびOracleデータベースでは使用できません。

| データベースプロバイダー | プロパティ                            |
|:------------ |:-------------------------------- |
| MariaDB      | `rewriteBatchedStatements=true`  |
| MySQL        | `rewriteBatchedStatements=true`  |
| PostgreSQL   | `reWriteBatchedInserts=true`     |
| SQLサーバー      | `useBulkCopyForBatchInsert=true` |


```{note}
バッチ挿入プロパティは、Liferay 7.4 U60+/GA60+ の [`portal-upgrade-database.properties`](https://github.com/liferay/liferay-portal/blob/master/modules/util/portal-tools-db-upgrade-client/properties/portal-upgrade-database.properties) ファイルに含まれています。
```

## アップグレードツールの実行

アップグレードツールの設定は、コマンドラインインターフェイスで行うか、 [プロパティファイル](../reference/database-upgrade-tool-reference.md#manual-configuration) を使って行います。

`［Liferay Home］/tools/portal-tools-db-upgrade-client`フォルダにある`db_upgrade.sh`スクリプトは、アップグレードツールを呼び出します。 `--help`オプションは、ツールの使用状況を説明します。

```bash
./db_upgrade.sh --help
```

ここでは、アップグレードツールを使ってデータベースをアップグレードする方法を説明しています。

1. アップグレードツールを起動します。 次にコマンドの例を示します。 

    ```bash
    cd liferay-home/tools/portal-tools-db-upgrade-client
    ```

    ```bash
    ./db_upgrade.sh -j "-Dfile.encoding=UTF-8 -Duser.timezone=GMT -Xmx4096m"
    ```
  
    上記のコマンドは、アプリケーションサーバーに推奨されるのと同じJVMオプションで、アップグレードツールを実行します。ファイルエンコーディング (`UTF-8`)、タイムゾーン (`GMT`)、国、言語、およびメモリ設定 (`-Xmx value`) はすべてアプリケーションサーバーの設定と一致させる必要があります。データが 10 GB を超えるデータベースでは、`-Xmx` オプションを使用して追加のメモリを割り当てます。
    
    [アップグレードのプロパティファイル](../reference/database-upgrade-tool-reference.md#manual-configuration) を使ってアップグレードの設定をしていない場合、アップグレードツールは設定値の入力を求め、括弧の中にデフォルト値を表示します。以下は、対話の例です。
    
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

    プロンプトに表示されるデフォルト値を使用する場合は、Enterキーを押してください。
    
    設定が完了すると、アップグレードが開始されます。アップグレードの開始と完了のログはツールに記録されます。

1. アップグレードが完了したら、データベースのアップグレードの失敗、エラー、または警告がないか、[アップグレードレポート](../reference/upgrade-reports.md)を確認してください。 [Gogo Shellコマンド](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md)を使用して、それらの問題をトラブルシューティングし、アップグレードを完了できます。

データベースのアップグレードが完了し、問題が解決されました。

## アップグレードされたデータベースのテスト

データベースのアップグレードが完了したので、テストしてみましょう。

1. 新しいLiferay Dockerイメージにアップグレードしている場合は、イメージをアップグレードされたデータベースに指定し、Liferayをデータベースで検証します。 詳しくは、[Configuring Liferay Containers](../../installing-liferay/using-liferay-docker-images/configuring-containers.md)を参照してください。

1. [アップグレード後の検討事項](./post-upgrade-considerations.md)を調べます。

1. カスタム [Liferay Homeのファイル](../../maintaining-a-liferay-installation/backing-up.md#liferay-home) と [アプリケーションサーバーのファイル](../../maintaining-a-liferay-installation/backing-up.md#application-server) をバックアップから新規インストールにコピーしてマージします。 ファイルには次のものが含まれる場合がありますが、これらに限定されません。

    * `/license/*`：アクティベーションキー。 (サブスクリプション)
    * `/log/*`：ログファイル。
    * `/osgi/configs/*.config`：OSGi設定ファイル。
    * `portal-*.properties`：`portal-ext.properties`のようなポータルプロパティファイル。
    * アプリケーションサーバーファイル：変更されたスクリプトと設定ファイル。
    * `web.xml`：ポータルWebアプリケーション記述子。

1. 新しいインストール先で [ポータルのプロパティを更新](../migrating-configurations-and-properties.md#migrating-portal-properties) します。

1. サーバーを起動し、アップグレードしたデータベースでLiferayを検証します。
   
   ![これがLiferay DXPのランディング画面です。](./using-the-database-upgrade-tool/images/01.png)

データベースアップグレードツールを使用してLiferayデータベースをアップグレードしました。

これが試用版のアップグレードで、アップグレード時間を短縮したい場合は、データベースをアップグレード用に調整し（まだ行っていない場合）、データベースから[不要なデータを削除](../upgrade-stability-and-performance/database-pruning-for-faster-upgrades.md)してください。 必要に応じてこの記事の手順を繰り返してください。

問題が発生した場合は、[アップグレードレポート](../reference/upgrade-reports.md)を確認し、 [アップグレードのトラブルシューティング](../reference/troubleshooting-upgrades.md) を参照してください。

## 次のステップ

[アップグレードの基本](../upgrade-basics.md) を再確認して、アップグレードに必要な残りの作業について確認してください。
