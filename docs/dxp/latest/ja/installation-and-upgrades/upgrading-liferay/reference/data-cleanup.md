# データのクリーンアップ

{bdg-secondary}`7.3以降で利用可能`

廃止されたLiferayアプリまたは機能の使用を終えたら、そのデータを削除できます。 コントロールパネルまたは [設定ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md) を使用して、データのクリーンアップを行うことができます。

廃止された機能からデータをクリーンアップする方法は次のとおりです。

1. *コントロールパネル*で、*［システム設定］* &rarr; *［Upgrades］*（*［プラットフォーム］*カテゴリ内） &rarr; *［Data Cleanup］*に移動します。 ［Data Cleanup］画面が表示されます。

    ![［Data Cleanup］では、廃止されたLiferayアプリケーションからデータを削除するためのインターフェイスが提供されます。](./data-cleanup/images/01.png)

1. クリーンアップするモジュールを選択し、*［保存］*をクリックします。

    ```{note}
    [構成ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)にクリーンアップ設定を保存するには、*アクション*メニューをクリックして、*エクスポート*を選択します。
    ```

   データのクリーンアップが実行されます。

サーバーには古いデータの負担から解放され、すべてのモジュールでデータクリーンアップが自動的に無効になります。

```{note}
データクリーンアップを実行すると（構成ファイルを介してでも）、DXPはすべてのモジュールに対してデフォルトで自動的にデータクリーンアップを無効にします。 これにより、不要な重複するデータのクリーンアップが防止されます。

7.4より前のバージョンでは、データクリーンアップ設定は保持されます。 これらの古いバージョンでクリーンアップを無効にするには、［Data Cleanup］画面ですべてのモジュールのチェックを外して*保存*をクリックするか、 `com.liferay.data.cleanup.internal.configuration.DataCleanupConfiguration.config` [構成ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)でモジュールクリーンアップキー` false`を設定します。
```

```{note}
`com.liferay.data.cleanup.internal.configuration.DataCleanupConfiguration.config` [構成ファイル](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)を使用して、サーバーの起動時に（[Liferay Dockerコンテナ](../upgrade-basics/upgrading-via-docker.md)またはローカルマシンで）モジュールデータをクリーンアップすることもできます。 クリーンアップ後、 `osgi / configs`フォルダから構成ファイルを削除して、その後のサーバーの立ち上げ時にクリーンアップが再度実行されないようにします。
```

## 追加情報

* [データ削除](./data-removal.md)
* [構成ファイルの使用](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-configuration-files.md)
* [Docker経由のアップグレード](../upgrade-basics/upgrading-via-docker.md)
* [コンテナへのファイルの提供](../../installing-liferay/using-liferay-docker-images/providing-files-to-the-container.md)
* [Using the Upgrade Tool](../upgrade-basics/using-the-database-upgrade-tool.md)