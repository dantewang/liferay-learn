# Liferay Commerceのアップグレード

Liferay Commerceのエクスペリエンスを向上させるために、Liferayはバグフィックスや新機能を含む定期的な商品アップグレードを提供しています。 ユーザーの皆様におかれましては、定期的に最新版へのアップデートをご検討ください。

## Commerce 4.0へのアップグレード

Liferay Commerce 3.0より、CommerceはLiferay DXPにバンドルされています。 Commerce 4.0にアップグレードするには、まずベースとなるLiferay DXPのインストールをDXP 7.4にアップグレードし、検索のインデックスの再構築を行う必要があります。

```{warning}
7.4にアップグレードした後は、Commerceの`LPKG`を再度デプロイ*しない*でください。 Commerce 4.0のモジュールは7.4にバンドルされています。  'LPKG'をデプロイすると競合が発生します。
```

DXPのアップグレード手順については、[Upgrade Basics](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/upgrading-liferay/upgrade-basics.html)を参照してください。 DXPが7.4にアップグレードされたら、インデックスの再構築を実行してください。

### Liferay Commerce 4.0にアップグレードするための前提条件

`CommerceCountry`テーブルはLiferay Commerce 4.0では廃止予定であるため、`Country`テーブルに置き換えられています。 `CommerceCountry`テーブルでは、国名だけが必要でしたが、Countryテーブルでは、国名と各国のアルファ2(a2)、アルファ3(a3)のコードが必要です。

`CommerceCountry`テーブルは、Minium Acceleratorを使用している場合や、独自の値を使用している場合に入力されることがあります。 Minium Acceleratorを使用していない場合、このテーブルは空の状態です。 Liferay DXP 7.4にアップグレードする前の前提条件として、 `CommerceCountry`テーブル内の各国にISOコードがあらかじめ入力されていることを確認する必要があります。 詳細は、 [Country Codes](https://www.iso.org/obp/ui/#search/code)を参照してください。

![CommerceCountryテーブルは、Countryテーブルよりも多くのフィールドを持っています。](./upgrading-liferay-commerce/images/01.png)

### アップグレード後のインデックスの再構築の実行

DXP 7.4にアップグレードした後、フルサーチのインデックスの再構築をを実行します。

1. **グローバルメニュー** を開き、 ［**Control Panel**］ &rarr; ［**Search**］ にいきます。

   ![［コントロールパネル］タブの［検索］に進みます。](./upgrading-liferay-commerce/images/02.png)

1. ［**アクションをインデックスする**］ タブで、 ［**すべてインデックスを再構築**］ の ［**実行**］ をクリックします。

インデックスの再構築が完了したら、グローバルメニューの ［**コマース**］ &rarr; ［**製品**］ に移動して、すべての商品が表示されていることを確認してください。

## 2.1以下のバージョンからCommerce 3.0へのアップグレード

Commerce 3.0にアップグレードするには、まずベースとなるLiferay DXPのインストールをDXP 7.3にアップグレードし、検索のインデックスの再構築を実行する必要があります。

```{warning}
7.3にアップグレードした後は、Commerceの`LPKG`を再度デプロイ*しない*でください。 Commerce 3.0のモジュールは7.3にバンドルされています。  'LPKG'をデプロイすると競合が発生します。
```

### アップグレード後のインデックスの再構築の実行

DXP 7.3にアップグレードした後、フルサーチのインデックスの再構築を実行します。

1. **グローバルメニュー** を開き、 ［**Control Panel**］ &rarr; ［**Search**］ にいきます。

   ![［コントロールパネル］タブの［検索］に進みます。](./upgrading-liferay-commerce/images/02.png)

1. ［**アクションをインデックスする**］ タブで、 ［**すべてインデックスを再構築**］ の ［**実行**］ をクリックします。

インデックスの再構築が完了したら、グローバルメニューの ［**Commerce**］ &rarr; ［**Product**］ に移動して、すべての商品が表示されていることを確認してください。

## Commerce 2.1.xへのアップグレード

Liferay Commerceでは、バージョン1.1.x、2.0.xのどちらからでも、Commerce 2.1.xへのスムーズなアップグレードプロセスを提供しています。

```{note}
1.1.xから2.1.xへのアップグレードでは、2.0.xへの増分アップグレードは**必要ありません**。
```

Commerce 2.1.xにアップグレードする前に、まずLiferay DXP 7.2の最新のフィックスパックを実行している必要があります。 たとえば、Liferay Commerce Enterprise 2.0.6にアップグレードする場合は、Liferay DXPをフィックスパック14にアップグレードする必要があります。 DXP 7.2へのアップグレードについては、[Upgrade Basics](https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/upgrading-liferay/upgrade-basics.html)を参照してください。

### 最新のフィックスパックを適用する

> サブスクリプションが必要です。

Liferayは最新のフィックスパックリリースを[ヘルプセンター](https://customer.liferay.com/downloads)からダウンロードできるように提供しています。 ダウンロードが完了したら、[Liferayパッチングツール](https://help.liferay.com/hc/articles/360018176551-Using-the-Patching-Tool)を使ってフィックスパックを適用することができます。 詳細は、[Installing Patches](https://help.liferay.com/hc/en-us/articles/360028810512-Installing-Patches)を参照してください。

Liferay DXPを[手動でインストールした場合](https://help.liferay.com/hc/articles/360017896672-Installing-Liferay-DXP-Manually-)（WebLogicなどで）は、[Installing Patches on the Liferay DXP 7.1 WAR](https://help.liferay.com/hc/articles/360018176651-Installing-patches-on-the-Liferay-DXP-7-1-WAR)を参照してください。

その後、以下の手順に従ってフィックスパックが正常にインストールされたことを確認してください。

1. `${liferay.home}/patching-tool`フォルダに移動します。

1. 以下を実行して、フィックスパックが適用されたことを確認します。
    * Linux/Unix：`./patching-tool.sh info`
    * Windows：`patching-tool info`

    ```
    Detailed patch list:
       [ -] dxp-12-7110 :: Currently not installed; Won't be installed: dxp-14 contains the fixes included in this one :: Built for LIFERAY
       [*I] dxp-14-7110 :: Installed; Will be installed. :: Built for LIFERAY
    ```

フィックスパックは本質的に累積的であり、以前にリリースされたすべてのフィックスパックが含まれています。 パッチ適用後、`${liferay.home}/work`フォルダの内容を削除して、Liferay DXPのデプロイされたコードのキャッシュを削除します。 他の古いデータを削除する方法については、次のセクションを参照してください。

### ダウンロードとデプロイ

DXP 7.2の最新フィックスパックを実行したら、以下の手順に従ってCommerce 2.1.x upgrade Commerceにアップグレードします。

1. 最新のLiferay Commerceをダウンロードしてください。

    * Commerce Enterpriseは [ヘルプセンター](https://customer.liferay.com/downloads?p **p** id=com **liferay** osb **customer** downloads **display** web **DownloadsDisplayPortlet&** com **liferay** osb **customer** downloads **display** web **DownloadsDisplayPortlet** productAssetCategoryId=118190997& **com** liferay **osb** customer **downloads** display **web** DownloadsDisplayPortlet_fileTypeAssetCategoryId=118191001)から入手できます。
    * Commerce Communityは、 [Liferay Commerce Communityダウンロードページ](https://www.liferay.com/downloads-community)から入手できます。

1. `LPKG` を`${liferay.home}/ deploy`フォルダーにデプロイします。アプリケーションをLiferay DXPにデプロイする方法の詳細は、 [アプリのインストール](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html)参照してください。

1. 以下に示すようなメッセージがアプリケーションサーバーコンソールに表示されることを確認します。

    ```
    Processing Liferay Commerce Enterprise x.x.x.lpkg
    ```

    ```
    The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20API.lpkg
    ```

    ```
    The portal instance needs to be restarted to complete the installation of file:/../../liferay-commerce-enterprise-1.1.6/osgi/marketplace/Liferay%20Commerce%20-%20Impl.lpkg
    ```

1. アプリケーションサーバーをシャットダウンします。

### 古いデータを消去し、アップグレードプロセスを確認する

1. `${liferay.home}/osgi/state`フォルダを削除します。 OSGiフォルダーの詳細は、 [アプリのインストール](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html)参照してください。
1. アプリケーションサーバーを起動します。
1. アプリケーションサーバーのコンソールログで次のようなメッセージを探して、アップグレードプロセスが開始されたことを確認します。

    ```
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupCommerceAccountRelUpgradeProcess in 24 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupRelUpgradeProcess in 8 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_2_0.CommerceAccountGroupUpgradeProcess in 12 ms
    Upgrading com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess
    Starting com.liferay.portal.kernel.upgrade.UpgradeProcess#alter
    Completed com.liferay.portal.kernel.upgrade.UpgradeProcess#alter in 40 ms
    Completed upgrade process com.liferay.commerce.account.internal.upgrade.v1_3_0.CommerceAccountNameUpgradeProcess in 60 ms
    Starting com.liferay.portal.upgrade.internal.index.updater.IndexUpdaterUtil#updateIndexes#Updating database indexes for com.liferay.commerce.account.service
    Dropping stale indexes
    Adding indexes
    ```

    ```
    Verifying com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess
    Starting com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog
    Completed com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess#verifyMasterCommerceCatalog in 2 ms
    Completed verification process com.liferay.commerce.product.internal.verify.CommerceCatalogServiceVerifyProcess in 7 ms
    1 theme for admin-theme is available for use
    1 theme for classic-theme is available for use
    1 theme for minium-theme is available for use
    ```

Liferay Commerceインスタンスがアップグレードされました。

### アップグレード後のインデックスの再構築を実行する

> Liferay Commerce 2.1以前

最新バージョンにアップグレードした後、フルサーチのインデックスの再構築を実行します。

検索インデックスの再構築を実行するには：

1. ［**コントロールパネル**］ → ［**設定**］ → ［**検索機能**］ に移動します。
1. ［**全ての検索インデクスの再構築**］ の隣にある ［**実行**］ をクリックします。
1. インデックスの再構築が完了するまで待ちます。
1. ［**コントロールパネル**］ → ［**コマース**］ → ［**商品**］ に移動します。
1. すべての商品が再び表示されることを確認します。

インデックスの再構築が完了すると、アップグレードされたLiferay Commerceインスタンスを使用する準備が整います。

## 追加情報

* [アプリのインストール](https://learn.liferay.com/dxp/latest/en/system-administration/installing-and-managing-apps/installing-apps/installing-apps.html)
* [Liferay Commerce修正プログラム配信方法](../get-help/commerce-enterprise-support/liferay-commerce-fix-delivery-method.md)
