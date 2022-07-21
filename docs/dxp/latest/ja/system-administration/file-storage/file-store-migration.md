# ファイルストアの移行

ファイルは、あるファイルストアタイプから別のタイプに移行できます。 次に、いくつかの移行シナリオを示します。

* 簡易ファイルシステムストアから高度なファイルシステムストアに移行すると、パフォーマンスとスケーラビリティが向上します。
* トランザクションロールバックの脆弱性を回避するには、Simple、Advanced、またはS3からDBStoreに移行します。
* 1ギガバイトを超えるファイルに対応するには、DBStoreから高度なファイルシステムストアに移行します。

[サーバー管理](../using-the-server-administration-panel.md) のデータ移行ユーティリティは、移行を容易にします。

```{warning}
移行する前に、**必ず**ファイルストアとデータベースを [バックアップ](../../installation-and-upgrades/maintaining-a-liferay-installation/backing-up.md)してください。 バックアップコピーで移行プロセスをテストすることをお勧めします。
```

## ファイルの移行

移行手順は次のとおりです。

1. *システム設定* &rarr; *ファイルストレージ*で新しいファイルストアを設定します。
1. *［サーバー管理］* &rarr; *［データ移行］*で、［リポジトリフック］（ストアの実装クラス）を選択し、 *実行*をクリックします。

    ![データ移行ユーティリティ](./file-store-migration/images/01.png)

1. データが正しく移行されたことを確認します。

1. 次のいずれかの設定を使用して、[`portal-ext.properties`](../../installation-and-upgrades/reference/portal-properties.md)をターゲットファイルのストアタイプに設定します。

    ```properties
    dl.store.impl=com.liferay.portal.store.db.DBStore
    dl.store.impl=com.liferay.portal.store.file.system.AdvancedFileSystemStore
    dl.store.impl=com.liferay.portal.store.file.system.FileSystemStore
    dl.store.impl=com.liferay.portal.store.s3.S3Store
    ```

1. DXPを再起動します。

DXPインスタンスが、新しく設定されたファイルストア上に移行されたファイルを使用するようになりました。

```{warning}
システム設定で新しいストア構成を必ず保存してください。 そうしないと、新しいストアを使用できず、次の例外が発生します：`java.lang.IllegalStateException: Store is not available`
```

## 追加情報

* [ファイル ストレージ](../file-storage.md)
* [Amazon S3 Store](./other-file-store-types/amazon-s3-store.md)
* [DBStore](./other-file-store-types/dbstore.md)