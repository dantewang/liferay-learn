# メンテナンスバージョン

フィックスパックは定期的にリリースされ、バグやセキュリティの修正が含まれています。 カスタムコードがデプロイされているインストールにFix Packをインストールする場合は、本番環境にインストールする前に、テスト環境にカスタムコード付きのFix Packをデプロイしてテストすることをお勧めします。

様々なパッチのタイプについては、 [Patching Liferay](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier.html) と [パッチタイプについて](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/understanding-patch-types-for-dxp-7-3-and-earlier.html) を参照してください。

パッチを適用する方法については、 [パッチのインストール](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/maintaining-a-liferay-installation/patching-dxp-7-3-and-earlier/installing-patches-for-dxp-7-3-and-earlier.html) を参照してください。

Liferay Commerce 3.0（オープンソース）のユーザーは、Liferay Portal 7.3の新しいリリースを通じて、同じバグおよびセキュリティアップデートを利用できます。

## Liferay Commerce 2.1以下のアップデートについて

Liferayは、定期的に、オープンソースとエンタープライズの両方の加入者向けにLiferay Commerceのアップデート（メンテナンスバージョン）をリリースします。 特に、メンテナンスバージョンとは、バージョン番号の3桁目の変更を指します。 各メンテナンスバージョンには最新のバグ修正が含まれており、セキュリティと信頼性のレベルが向上しています。 カスタマイゼーションは一般に安全ですが、実装の前にカスタマイゼーションを確認することを強くお勧めします。

新しいメンテナンスバージョンへのアップデートは、Liferay Commerceの新しいメジャーバージョンまたはマイナーバージョンへのアップグレードと非常に似ています。

### ロードマップ

1. [ダウンロードとデプロイ](#download-and-deploy)
1. [古いデータを消去してサーバーを再起動する](#clear-stale-data-and-restart-the-server)
1. [追加情報](#additional-information)

### ダウンロードとデプロイ

1. 最新のLiferay Commerce `LPKG`をダウンロードします。
    * エンタープライズサブスクライバーは、最新の`LPKG`を [ヘルプセンター](https://customer.liferay.com/downloads?p **p** id=com **liferay** osb **customer** downloads **display** web **DownloadsDisplayPortlet&** com **liferay** osb **customer** downloads **display** web **DownloadsDisplayPortlet** productAssetCategoryId=118190997& **com** liferay **osb** customer **downloads** display **web** DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001) からダウンロードできます。
      * サブスクライバーは、Liferay Commerceの注文番号またはアクティベーションキーも必要です。 [Activating a Marketplace App Through a Proxy Server](https://help.liferay.com/hc/ja/articles/360018427391) を参照してください。
    * 最新のオープンソース`LPKG`は、 [Liferay Commerceのコミュニティサイト](https://commerce.liferay.dev/download) から取得できます。

1. `LPKG`を`${liferay.home}/deploy`フォルダにデプロイします。
1. アプリケーションサーバーコンソールに次のメッセージが表示されることを確認します。

    ```
    2019-08-12 21:53:43.847 INFO  [com.liferay.portal.kernel.deploy.auto.AutoDeployScanner][AutoDeployDir:261] Processing Liferay Commerce Enterprise 2.0.5.lpkg
    2019-08-13 18:12:56.713 INFO  [fileinstall-/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
    2019-08-13 18:12:56.715 INFO  [fileinstall-/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace][LPKGArtifactInstaller:202] The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
    ```

1. アプリケーションサーバーをシャットダウンします。

### 古いデータを消去してサーバーを再起動する

1. `${liferay.home}/osgi/state`フォルダを削除します。 > OSGiフォルダの詳細は、 [Installing Apps Manually](https://help.liferay.com/hc/ja/articles/360017895412-Installing-Apps-Manually#using-your-file-system-to-install-apps) を参照してください。
1. アプリケーションサーバーを起動します。
1. アプリケーションサーバーのコンソールログで次のようなメッセージを探して、アップグレードプロセスが開始されたことを確認します。

    ```
    2019-08-13 18:26:26.082 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess
    2019-08-13 18:26:26.106 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess in 24 ms
    2019-08-13 18:26:26.116 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess
    2019-08-13 18:26:26.124 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess in 8 ms
    2019-08-13 18:26:26.130 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess
    2019-08-13 18:26:26.142 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess in 12 ms
    2019-08-13 18:26:26.148 INFO  [main][UpgradeProcess:93] Upgrading com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess
    2019-08-13 18:26:26.160 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.kernel.upgrade.UpgradeProcess#alter
    2019-08-13 18:26:26.200 INFO  [main][LoggingTimer:43] Completed com.liferay.portal.kernel.upgrade.UpgradeProcess#alter in 40 ms
    2019-08-13 18:26:26.208 INFO  [main][UpgradeProcess:107] Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess in 60 ms
    2019-08-13 18:26:26.246 INFO  [main][LoggingTimer:83] Starting com.liferay.portal.upgrade.internal.index.updater.IndexUpdaterUtil#updateIndexes#Updating database indexes for com.liferay.commerce.account.service
    2019-08-13 18:26:26.346 INFO  [main][BaseDB:812] Dropping stale indexes
    2019-08-13 18:26:26.400 INFO  [main][BaseDB:84] Adding indexes
    ```

    ```
    2019-08-13 18:28:19.439 INFO  [main][VerifyProcess:65] Verifying com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess
    2019-08-13 18:28:19.443 INFO  [main][LoggingTimer:83] Starting com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog
    2019-08-13 18:28:19.445 INFO  [main][LoggingTimer:43] Completed com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog in 2 ms
    2019-08-13 18:28:19.446 INFO  [main][VerifyProcess:80] Completed verification process com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess in 7 ms
    2019-08-13 18:28:32.471 INFO  [main][ThemeHotDeployListener:108] 1 theme for admin-theme is available for use
    2019-08-13 18:28:34.296 INFO  [main][ThemeHotDeployListener:108] 1 theme for classic-theme is available for use
    2019-08-13 18:28:38.667 INFO  [main][ThemeHotDeployListener:108] 1 theme for minium-theme is available for use
    ```

Liferay Commerceインスタンスが更新されました。 インデックスを再作成する必要はなく、すべてのデータは変更されません。

## 追加情報

Liferay Commerceは、Liferay Digital Experience Platform上に構築されています。 場合によっては、コアのLiferay DXPプラットフォームをアップデートする必要があります。これは、最新のメジャー、マイナー、またはメンテナンスのバージョンにアップデートするための要件です。 Liferay Commerceの修正は、Liferayから独立しています。

* [Liferay Commerce修正プログラム配信方法](../get-help/commerce-enterprise-support/liferay-commerce-fix-delivery-method.md)
* [Liferay Commerceのアップグレード](./upgrading-liferay-commerce.md)
* [サポート終了](https://www.liferay.com/subscription-services/end-of-life/commerce)
