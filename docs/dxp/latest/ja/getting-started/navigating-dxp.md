# DXPのナビゲート

Liferay DXPのすぐに使えるナビゲーションは、 _個人用メニュー_ 、 _グローバルメニュー_、 _サイトメニュー_ の3つの主要な領域に編成されています。

## サイトメニュー

画面の左側にあるDXP_サイトメニュー_には、現在表示されている特定のサイトを対象とするアクション、コンテンツ、および構成が含まれています。 アプリケーションバーのサイトメニューアイコン（![Site Menu](../images/icon-menu.png)）をクリックすると、サイトメニューの表示・非表示を切り替えることができます。

![サイトメニューを展開して、すべてのオプションを表示します。](./navigating-dxp/images/05.png)

*サイトメニュー*は選択したサイトを示します。 上記の例では、サイトは `Liferay`です。 サイトメニューのコンパスアイコン（ ![Compass Icon](../images/icon-compass.png) ）をクリックすると、作業しているサイトを変更することができます。

次の一般的なサイト構築および管理アクティビティは、_サイトメニュー_ で実行できます。

* [ページの追加](../site-building/creating-pages/adding-pages/adding-a-page-to-a-site.md)
* [コンテンツを作成する](../content-authoring-and-management.md)
* [サイトメンバーシップの管理](../site-building/sites/site-membership/adding-members-to-sites.md)
* [サイトの動作と機能の設定と最適化](../site_building.html)
* など・・・

## アプリケーションバー

_アプリケーションバー_ は、各ページの上部に表示され、アプリケーションは [サイトメニュー](#site-menu) に一覧表示されます。 アプリケーションバーには、現在開いているアプリケーションに応じて、さまざまなオプションが含まれるアクション（![Actions](../images/icon-actions.png)）メニューが表示されます。

![アプリケーションバーで使用できるアクションは、現在開いているアプリケーションによって異なります。](./navigating-dxp/images/07.png)

閲覧モードでページを開くと、アプリケーションバーで使用できるツールはページのタイプによって異なります。

![コンテンツページとウィジェットページには、アプリケーションバーに異なるツールセットが表示されます。](./navigating-dxp/images/08.png)

[コンテントページ](../site-building/creating-pages/using-content-pages.md)（A）の場合、使用可能なツールは次のとおりです。

* 編集（![Edit](../images/icon-edit.png)）
* ページ設定（![Configure Page](../images/icon-settings.png)）
* シミュレーション（![Simulation](../images/icon-simulation.png)）
* コンテンツパフォーマンス（![Performance](../images/icon-analytics.png)）
* A/Bテスト（![A/B Test](../images/icon-ab-testing.png)）
* ページ監査（![Page Audit](../images/icon-information.png)）

[ウィジェットページ](../site-building/creating-pages/using-widget-pages/adding-widgets-to-a-page.md)（B）の場合、使用可能なオプションは次のとおりです。

* ページ設定（![Configure Page](../images/icon-settings.png)）
* トグルコントロール（![Toggle Controls](../images/icon-preview.png)）
* 追加 (![Add](../images/icon-plus.png))
* シミュレーション（![Simulation](../images/icon-simulation.png)）
* コンテンツパフォーマンス（![Performance](../images/icon-analytics.png)）
* ページ監査（![Page Audit](../images/icon-information.png)）

```{note}
コンテンツページとウィジェットページのアプリケーションバーオプションは、Lifera yDXPのバージョンによって異なります。 [コンテンツパフォーマンス](../content-authoring-and-management/page-performance-and-accessibility/about-the-content-performance-tool.md) は Liferay DXP 7.3 からコンテンツページで、Liferay DXP 7.4 からウィジェットページで使用できるようになりました。 ページ監査は、Liferay DXP7.4以降で利用できます。 トグルコントロールオプションは、Liferay DXP7.3以降で使用できます。
```

## 個人用メニュー

パーソナルメニューは、ログインしているユーザーの情報とアクティビティのハブです。

![Liferay DXPのパーソナルメニューは、右上のアバターアイコンをクリックすると利用できます。](./navigating-dxp/images/01.png)

ユーザーはパーソナルメニューを使用して次のことができます。

* [アカウント情報を変更する](./introduction-to-the-admin-account.md#changing-account-information) （名前、パスワードなど）
* [メンバーとなっているサイトを確認する](../site-building/sites/site-membership/adding-members-to-sites.md)
* [サイト通知を確認する](../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md)
* [サインアウトする](./introduction-to-the-admin-account.md#signing-out)
* など・・・

## グローバルメニュー

DXPの_グローバルメニュー_には、_ アプリケーションメニュー_と_コントロールパネル_が含まれています。 画面上部の_アプリケーションメニュー_アイコン（![Applications Menu icon](../images/icon-applications-menu.png)）をクリックしてアクセスします。

```{note}
デフォルトでは、*ゲスト*または*ユーザー*のロールを持つユーザーは、グローバルメニューにアクセスできません。
```

インターフェイスの右側の_グローバルメニュー_の_［Applications］_タブまたは_［Control Panel］_ タブから、利用可能な他のサイトに移動することもできます。

### アプリケーションメニュー

_アプリケーションメニュー_ には、Liferay DXPサーバー内のさまざまなアプリケーションを管理するためのさまざまなリンクが含まれています。

![アプリケーションメニューには、すべてのサイトに適用できる多くのグローバル設定と重要な機能が含まれています。](./navigating-dxp/images/02.png)

_アプリケーションメニュー_ から管理できるアプリケーションの一部を次に示します。

* [コンテンツダッシュボード](../content-authoring-and-management/content-dashboard.md)
* [ワークフロー](../process-automation/workflow/introduction-to-workflow.md)
* [リモートアプリケーション](../building-applications/remote-apps.md)

### コマースメニュー

Liferay 7.3 CE GA6およびLiferay DXP 7.3 GA1以降、Liferay Commerce 3.0はLiferay Portal 7.3 CE GA6およびLiferay DXP 7.3 GA1にバンドルされるようになりました。

![コマースメニューには、すべてのストア機能が含まれています。](./navigating-dxp/images/03.png)

_コマース_ メニューから管理できる機能は次のとおりです。

* [新しいカタログを作成する](https://learn.liferay.com/commerce/latest/ja/product-management/catalogs/creating-a-new-catalog.html)
* [新しいチャンネルを作成する](https://learn.liferay.com/commerce/latest/ja/starting-a-store/channels/managing-channels.html)
* [在庫を管理する](https://learn.liferay.com/commerce/latest/en/product-management/managing-inventory/introduction-to-managing-inventory.html)
* [注文を処理する](https://learn.liferay.com/commerce/latest/ja/order-management/orders/processing-an-order.html)
* その他

Liferay Commerceの詳細については、 [Liferay Commerceの概要](https://learn.liferay.com/commerce/latest/ja/starting-a-store/introduction-to-liferay-commerce.html) を参照してください。

### コントロールパネル

_コントロールパネル_には、Liferay DXPインストールまたは特定のインスタンスに_ グローバル_にスコープできる一般的な管理アクションと構成が含まれています。

![これで、コントロールパネルがグローバルメニューの一部になりました。](./navigating-dxp/images/04.png)

コントロールパネルでは、次の一般的な管理アクティビティを実行できます。

* [ユーザー、権限、ロールを管理する](../users-and-permissions/users/adding-and-managing-users.md)
* [ユーザーのログイン方法を変更する](../installation-and-upgrades/securing-liferay/authentication-basics.md)
* [新しいサイトを作成する](../site-building/sites/adding-a-site.md)
* サイト上のアプリケーションに新規カスタムフィールドを追加する
* など・・・

## DXP7.1および7.2

Liferay DXP 7.3以前のバージョンでは、グローバルメニューの内容は、画面の左側のサイトメニューの上にあるコントロールパネルの中にあります。

![DXP 7.1および7.2のコントロールパネルは、サイトメニューの上にあります。](./navigating-dxp/images/06.png)

## 次のステップ

引き続きスタートガイドを進め、[最初のサイトを作成する](./creating-your-first-site.md)方法について紹介します。

## 関連情報

* [最初のサイトを作成する](./creating-your-first-site.md)
* [サイトの外観を変更する](./changing-your-sites-appearance.md)
