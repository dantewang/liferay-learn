# コマース倉庫のセットアップ

コマース倉庫は、商品の在庫が保管されている物理的な場所を表します。 各倉庫は複数のチャネルにリンクすることができ、有効にするには位置情報が設定されている必要があります。 これらの位置情報は、Fedexの配送方法で顧客への送料を計算する際に使用されます。

[Accelerator](../starting-a-store/accelerators.md)を使用してコマースサイトを作成する場合、3つのサンプル倉庫が作成されます。

```{note}
コマース倉庫を設定するとき、ユーザーは最初に倉庫の該当する国および地域の場所（州または県）を有効にする必要がある場合があります。 詳しくは、 [リージョンの追加](../store-management/adding-regions.md) をご覧ください。
```

## 倉庫の追加

次の手順に従って、新しい倉庫を追加します：

1. **グローバルメニュー**(![Global Menu](../images/icon-applications-menu.png))を開き、 ［**コマース**］ タブをクリックして、 ［**Warehouses**］ に移動します。

1. **追加** ボタン（![Add Button](../images/icon-add.png)）をクリックします。

   ![追加ボタンをクリックして、新しい倉庫を作成します。](./setting-up-commerce-warehouses/images/01.png)

1. 新しい倉庫の ［**名前**］ と ［**説明**］（オプショナル）を入力します。

1. トグルを ［**有効**］ に切り替えます。 倉庫を有効にするには、位置情報が必要です。

1. どの **チャネル** が倉庫に関連付けられているかを選択します。

   チャネルの商品在庫は、関連する倉庫によって決定されます。

1. 倉庫の **住所** を入力します。

1. 倉庫の **位置情報**（有効化が必須です）を入力します。

   または、Bingジオコーダを使用して、倉庫の位置情報を自動的に生成することもできます。 この機能を使用するには、倉庫に住所がある必要があります。 詳細は [下記](#using-bing-geocoder-to-set-a-warehouses-geolocation) を参照してください。

1. ［**保存**］ をクリックします。

倉庫を有効にすると、 倉庫に[商品在庫を追加する](./setting-inventory-by-warehouse.md)ことができます。

## Bingジオコーダを使用して倉庫の位置情報を設定する

Commerceでは、Bing Maps APIとの連携により、倉庫の位置情報を自動的に生成します。 この機能を利用するには、 [Bing Maps アカウント](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/creating-a-bing-maps-account) と [Bing Maps キー](https://docs.microsoft.com/en-us/bingmaps/getting-started/bing-maps-dev-center-help/getting-a-bing-maps-key) が必要です。

その後、以下の手順に従ってインスタンスにBingジオコーダを設定します:

1. **グローバルメニュー**（![Global Menu](../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ &rarr; ［**システム設定**］ &rarr; ［**コマース**］ &rarr; ［**Shipping**］ &rarr; ［**Bing Geocoder**］ に移動します。

1. ［**API Key**］ を入力します。

   ![APIキーを入力します](./setting-up-commerce-warehouses/images/02.png)

1. ［**Save**］ をクリックします。

ジオコーダを設定すると、住所が設定されている倉庫に対して倉庫の位置情報を生成することができます。 倉庫のページに移動し、目的の倉庫の **アクション** ボタン（![Actions Button](../images/icon-actions.png)）をクリックし、 ［**Geolocate**］ を選択します。 ジオコーダは、住所を緯度と経度の座標に変換します。

![［ジオロケーション］を選択します](./setting-up-commerce-warehouses/images/03.png)

## Commerce 2.1以前

**コントロールパネル** に倉庫を追加するには：

1. ［**コントロールパネル**］ → ［**コマース**］ → ［**設定**］ に移動します。
1. ［**倉庫**］ タブをクリックします。
1. **倉庫の追加**（![Add Icon](../images/icon-add.png)）ボタンをクリックします。
1. 次のように入力します：
   ****名前：***倉庫の名前**（例：ノースラスベガスの倉庫）
   ****説明：***倉庫の説明**（例：ノースラスベガスの処理センター）
1. トグルを ［**有効**］ に切り替えます。
1. 倉庫の住所を入力します。
1. チャネルを選択します。 チャネルの商品在庫は、関連する倉庫に基づいています。
1. 地理位置情報データを入力します（必須）：
    ****緯度** ：36.282974
    ****経度** : -115.136

    ![コマース倉庫のセットアップ](./setting-up-commerce-warehouses/images/04.png)

1. 完了したら、 ［**保存**］ をクリックします。

新しい倉庫がアクティブになり、 ［**出荷**］ タブでオプションとして利用可能になりました。

## 追加情報

* [リージョンの追加](../store-management/adding-regions.md)
* [請求先または出荷先として国を無効にする](../store-management/deactivating-a-country-for-billing-or-shipping.md)
* [チャネルについて](../store-management/channels/introduction-to-channels.md)
