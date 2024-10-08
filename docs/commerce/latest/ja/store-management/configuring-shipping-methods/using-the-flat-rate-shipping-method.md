# 一律料金配送方法の使用

購入者は、任意の商品を配送するための一律料金配送オプションを選択できます。 複数の一律料金オプションを作成することにより、顧客にコスト、速さ、またはセキュリティの選択肢を提供できます。

一律料金配送では、カタログ内のすべての商品に同じ費用がかかります。 ただし、商品の[［設定］](../../inventory-management/product-inventory-configuration-reference-guide.md)タブの ［**配送追加費用**］ フィールドから個々の商品について例外を作成できます。

デフォルトでは、一律料金配送方法が有効になっています。

新しい一律料金配送オプションを追加するには：

1. ［**Control Panel**］ &rarr; ［**Commerce**］ &rarr; ［**Channels**］ に移動します。

    ![［コントロールパネル］の［チャネル］に移動します。](./using-the-flat-rate-shipping-method/images/02.png)

2. 目的のチャネル（たとえば、Sahara.com）をクリックします。 （Miniumなどのアクセラレータを使用してサイトを作成した場合は、対応するチャネルがデフォルトですでに作成されています。）
3. ［**Shipment Methods**］ までスクロールします。

    ![配送方法はチャンネルで設定されます。](./using-the-flat-rate-shipping-method/images/03.png)

4. ［**Edit**］ をクリックします。
5. ［**有効**］ トグルを ［**はい**］ に切り替えます。
6. ［**Shipping Options**］ タブをクリックします。
7. 追加（![Add Icon](../../images/icon-add.png)）ボタンをクリックして、新しい配送オプションを追加します。
8. 次のように入力します：
    * **［Name**］ ：7-Day Shipping
    * **［Amount**］ ：3.95
    * **［Priority**］ ：0.0

    ![新しい配送方法オプションを追加します。](./using-the-flat-rate-shipping-method/images/04.png)

9. ［**Save**］ をクリックします。
10. ウィンドウを閉じます。

![新しい配送方法オプションが作成されていることを確認します。](./using-the-flat-rate-shipping-method/images/05.png)

新しい配送方法オプションが追加されました。

![新しい配送方法オプションが利用可能であることを確認します。](./using-the-flat-rate-shipping-method/images/06.png)

## Commerce 2.0以前

新しい一律料金配送オプションを追加するには：

1. ［**サイト管理**］ → ［**コマース**］ → ［**設定**］ に移動します。
1. ［**配送方法**］ タブをクリックします。
1. ［**一律料金**］ をクリックします。
1. ［**配送オプション**］ タブをクリックします。 （Miniumアクセラレータを使用している場合、 ［**標準配送**］ および ［**速達**］ がデフォルトで作成されます。）
1. 追加（![Add Icon](../../images/icon-add.png)）ボタンをクリックして、新しい配送オプションを追加します。
1. 次のように入力します：
    * **名前** ：7-Day Shipping
    * **総量** ：3.95
    * **重要度** ：0.0
1. ［**保存**］ をクリックします。

新しい配送オプションが追加され、精算プロセスで利用可能になりました。

## 関連トピック

* [可変レート配送方法を使う](./using-the-variable-rate-shipping-method.md)
* [FedExを運送業者の方法として使用する](./using-the-fedex-shipping-method.md)
* [配送方法の制限を適用する](./applying-shipping-method-restrictions.md) <!-- * \[Implementing a New Shipping Engine\](../../developer-guide/sales/implementing-a-new-shipping-engine.md) -->
