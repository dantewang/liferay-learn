# バックアップ

DXPインストールを実行したら、予期しないイベントを考慮した包括的なバックアップ計画を実装する必要があります。 バックアップコピーは、アップデートのテスト（DXPアップグレード、新しいプラグインなど）にも役立ちます。

Liferay DXPのバックアップ計画を検討するときは、次の領域をバックアップすることをお勧めします。

* [Liferayホームディレクトリ](#liferay-home)
* [アプリケーションサーバー](#application-server)
* [データベース](#database)
* [検索インデクス](#search-indexes)
* [ソースコード](#source-code)

```{note}
Liferay Cloudは、ドキュメントライブラリやLiferay DXPデータベースのバックアップを作成・管理するプロセスを自動化・簡略化します。 Liferay CloudはGitベースのDevOpsパイプラインを使用しているため、Liferayのすべての設定も同様に自動的にバックアップされます。 詳しくは、 [Liferay Cloud Backup Service Overview](https://learn.liferay.com/liferay-cloud/latest/ja/platform-services/backup-service/backup-service-overview.html) をご覧ください。
```

## Liferay Home

Liferay Homeフォルダーには次のファイルが含まれているため、バックアップすることが重要です。

* **ポータルのプロパティとシステムのプロパティ:** Liferay Homeフォルダには、DXP[ポータルのプロパティファイル](../reference/portal-properties.md)(例:`portal-ext.properties`、`portal-setup-wizard.properties`など)とDXP[システムのプロパティファイル](../reference/system-properties.md)が格納されています(例:`system-ext.properties`)。

* **`/データ`フォルダ:** DXPは、Liferay Homeの`/データ`フォルダに設定ファイル、検索インデックス、キャッシュ情報を保存します。 `/ data / document_library` フォルダは、 [簡易ファイルシステムストア](../../system-administration/file-storage/other-file-store-types/simple-file-system-store.md)のデフォルトのストレージ構成場所であることに注意してください。 [高度なファイルシステムストア](../../system-administration/file-storage.md)では、保存場所を明示的に設定する必要があります。

* **`/ライセンス`フォルダ(サブスクリプション):** Liferayエンタープライズサブスクリプションのアクティベーションキーを保持します。

* **`/osgi`フォルダ:** DXPのOSGiランタイムを構成するファイルは、Liferay Homeの`/osgi`フォルダに保存されます。 DXPにデプロイされたすべてのアプリとモジュールのJARファイルが含まれています。 `/osgi`フォルダには、他の必要なJARファイル、 [設定ファイル](https://help.liferay.com/hc/ja/articles/360029131651-Understanding-System-Configuration-Files) 、およびログファイルも含まれています。

* **`/logs`フォルダ:** DXPのログファイルが含まれています。 DXPで問題が発生した場合、ログファイルは、問題の原因を特定するための情報を提供します。

```{note}
Liferay Dockerイメージを使用していて、バインドマウントを介してカスタムLiferayおよびアプリケーションサーバーの構成ファイルを使用している場合は、それらのファイル（たとえば、 `[host folder]/files`フォルダ内のファイル）をバックアップします。
```

Git、BitBucket、Subversion、CVSなどのソース管理リポジトリを使用すると、Liferay Homeフォルダをバックアップできます。

```{important}
ファイルストア（ドキュメントライブラリ）を`[Liferay Home]/data`サブフォルダ以外の場所に構成した場合は、その場所をバックアップします。
```

## アプリケーションサーバー

アプリケーションサーバーには、カスタマイズした可能性のあるDXP記述子、デプロイメント、および依存関係があります。 たとえば、DXPの `web.xml` ファイルをカスタマイズした場合、DXPパッチの `web.xml` 常に既存のものを上書きするため、バックアップする必要があります。 アプリケーションサーバー全体をバックアップすることをお勧めします。

## データベース

DXPのデータベースは、ポータルのすべての情報の中央リポジトリです。 バックアップする最も重要なコンポーネントです。 データベースをライブでバックアップする（データベースで許可されている場合）か、データベースをファイルにエクスポート（ダンプ）してから、エクスポートしたファイルをバックアップします。

たとえば、 [MySQLの `mysqldump`](https://dev.mysql.com/doc/refman/5.7/en/using-mysqldump.html) ユーティリティは、データベース全体とデータを大きなSQLファイルにエクスポートします。

```bash
mysqldump --databases my-liferay-database > my-liferay-database-backup.sql
```

その後、このファイルをバックアップできます。 データベースの復元時に、このファイルをデータベースにインポートして、データベースをエクスポートしたときの状態にデータベースの状態を再作成できます。

## ファイルストア

[ファイルストア（ドキュメントライブラリ）](../../system-administration/file-storage.md)をバックアップします。  新しいバージョンのDXPにアップグレードするときは、既存のドキュメントライブラリを参照するか、ドキュメントライブラリを新しいDXP環境にコピーする必要があります。

## 検索インデクス

[検索インデクス](./../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md)は常にバックアップしてください。 ほとんどのLiferayデータは、完全なインデックスの再作成によってデータベースから復元できますが、 [一部のアプリケーションではプライマリストレージ](../../using-search/installing-and-upgrading-a-search-engine/elasticsearch/upgrading-elasticsearch/backing-up-elasticsearch.md#backing-up-and-restoring-indexes-used-for-primary-storage) として検索インデクスが使用されます。 インデックスのバックアップに失敗すると、これらのアプリケーションのデータが完全に失われる可能性があります。

さらに、データセットが大きいユーザーは、バックアップから復元するときに、すべてのコンテンツとアセットのインデックスを再作成することを回避できます。 検索インデクスを保存する別の[ElasticsearchまたはSolr](../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)環境がある場合は、検索データのバックアップが最も簡単です。 詳細については、検索エンジンのバックアップ/復元のドキュメンテーションに従ってください（たとえば、Elasticsearchの [スナップショットと復元のドキュメンテーション](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/snapshot-restore.html) を参照してください）。

## ソースコード

DXPを拡張した場合、またはプラグインを作成した場合は、GitやBitBucketなどのソースコードリポジトリに保存する必要があります。 進行中の作業を維持するために、ソースコードリポジトリを定期的にバックアップする必要があります。

## まとめ

予期しないシステム障害から回復する場合でも、定期的なアップグレードを実行する場合でも、Liferayのデータのバックアップと復元は、インストールを復活させるために不可欠です。 ここで取り上げた分野のバックアップ手順を適切に一貫して実行することで、インストールに必要な重要なデータを確実に回復できます。