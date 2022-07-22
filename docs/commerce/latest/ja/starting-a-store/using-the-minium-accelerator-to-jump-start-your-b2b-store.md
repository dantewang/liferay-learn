# Minium Acceleratorを使用してB2Bストアをすぐに開始する

MiniumはLiferay Commerceの[アクセラレータ](./accelerators.md)であり、メーカーのニーズを満たすように設計された企業間取引（B2B）ストアを迅速かつ簡単にセットアップし、最新のB2Bデジタルコマースエクスペリエンスを提示します。 機能的でエレガントな要素を持つことで、可能な限りスムーズなエクスペリエンスを実現する機能を使用して設計されています。

アクセラレータは、サイトページとサイトのデザイン、サンプルデータ、およびサイト構成の基本階層を1回の操作で提供することによって、これを実現します。 また、Miniumは、Liferay CommerceのB2Bアカウント管理機能を強調し、[アカウントロール](../users-and-accounts/account-management/account-roles.md)、[アカウントグループ](../users-and-accounts/account-management/creating-a-new-account-group.md)、および[注文ワークフロー](../order-management/order-workflows/introduction-to-order-workflows.md)を使用して、合理化されたアカウント管理とセルフサービスを可能にします。

この記事は、Minium Acceleratorの主な機能について説明します。

## ページとデザイン

### ページ

Miniumは、サイトに複数のページとウィジェットを作成し、購入者に完全なユーザーエクスペリエンスを提供します。 作成されたページの完全なリストを表示するには、 ［**サイトメニュー］ → ［ページ作成設定］ → ［ページ**］ に移動します。

![Miniumページ](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/01.png)

一般に、これらのページは名前が示すとおりに機能しますが、いくつかの違いがあります。 たとえば、専用のカテゴリページを使用する代わりに、サイトのホームページにはカタログのコンテンツ全体が表示されます。 単一のカテゴリの商品を表示するには、［カテゴリーファセット］ウィジェットでチェックボックスを選択します。

![カタログページ](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/02.png)

### デザイン

Miniumアクセラレータには、ポップアップナビゲーションやカートメニュー、アカウントセレクターなど、多くの組み込み機能が含まれています。 ナビゲーションメニューには、カタログ、保留中の注文と過去の注文、アカウント管理へのリンクがあり、カートメニューには現在の注文が表示されます。 最後に、オムニ検索バーにより、ユーザーは探している商品をすばやく見つけることができます。

![Miniumテーマ](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/03.png)

Miniumは、テーマが埋め込まれたカートメニューに含まれているチェックアウトページへのリンクを使用します。

アカウントセレクターには、現在のユーザーがアクセスできるアカウントが表示されます（管理者は任意のアカウントにアクセスできます）。 アカウントが選択されると、その未処理の注文が表示されます。 複数のアカウントにサービスを提供している販売代理店と購入者は、アカウント間を簡単に切り替えることができます。

## カタログデータ

Miniumのカタログには、事前定義されたいくつかのカテゴリに分類されたさまざまなサンプル商品が含まれています。

![事前設定カテゴリ](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/04.png)

> カテゴリは **グローバル** スコープレベルで定義されていることに注意してください。 詳細は、[商品のカテゴリー](../product-management/creating-and-managing-products/products/organizing-your-catalog-with-product-categories.md)を参照してください。

サンプル商品には、あらかじめ設定された[オプション](../product-management/creating-and-managing-products/products/using-product-options.md) 、[仕様](../product-management/creating-and-managing-products/products/specifications.md) 、および画像も付属しています。

![商品仕様](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/05.png)

**サンプルデータはデモンストレーション用に追加されており、ストア管理者がストアサイトのベースとしてMiniumを使用する場合は、安全に削除できます。**

## 検索

Miniumを使用すると、購入者はカタログをすばやく簡単に検索できます。 オムニ検索バーに加えて、Miniumには検索バーを開くための特別なキーボードのショートカットがあります。 **カタログ** のメインページでスラッシュ（/）を押すと、検索バーが開き、フォーカスが移動します。

![スラッシュを使用した検索](./using-the-minium-accelerator-to-jump-start-your-b2b-store/images/06.png)

## その他の設定

Miniumは、空白のサイトにはすぐに設定されない、他の多くのサイト設定を適用します。 次の表は、B2Bストアをすぐに開始するためにMiniumが行う主な追加または設定のリストです。

| 機能                                                                                                                    | 詳細                       |
|:--------------------------------------------------------------------------------------------------------------------- |:------------------------ |
| [倉庫](../inventory-management/setting-up-commerce-warehouses.md)                                                       | イタリア、米国北東部、米国南西部         |
| [サイトの種類](../starting-a-store/sites-and-site-types.md)                                                                 | B2B                      |
| [配送方法オプション](../store-management/configuring-shipping-methods/using-the-flat-rate-shipping-method.md)                  | 標準配送、速達配送                |
| チャンネル                                                                                                                 | Miniumポータル               |
| 国                                                                                                                     | フランス、中国、米国、その他245か国      |
| [通貨](../store-management/currencies/adding-a-new-currency.md)                                                         | USD、AUD、GBP、その他7通貨       |
| デフォルト画像                                                                                                               | &#10003;                 |
| [計量単位](../store-management/configuring-shipping-methods/measurement-units.md) - 寸法                                    | インチ、ミリメートル、フィート、メートル     |
| [計量単位](../store-management/configuring-shipping-methods/measurement-units.md) - 重量                                    | オンス、ポンド、キログラム、グラム        |
| [アカウントロール](../users-and-accounts/account-management/account-roles.md)                                                 | 購入者、アカウントマネージャー、販売代理店    |
| [在庫数の見積もり](../inventory-management/availability-estimates.md)                                                         | 3～5日、5～7日、7～14日          |
| [関連商品タイプ](../product-management/creating-and-managing-products/products/related-products-up-sells-and-cross-sells.md) | アップセル、スペア、関連、アクセサリ、クロスセル |
