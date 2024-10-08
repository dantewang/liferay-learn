# フィールドタブへのカテゴリー設定の追加

{bdg-secondary}`Liferay 7.4 U31+/GA31+`

[フィールドタブ](./designing-object-layouts.md#fields-tabs) にカテゴリー設定ブロックを追加することで、エンドユーザーがオブジェクトエントリーにタグやカテゴリーを適用できるようになります。 次の手順を実行します：

1. **グローバルメニュー**（![Global Menu](../../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. 目的のオブジェクト定義の編集を開始します。

   ```{note}
   システムオブジェクトは、カスタムレイアウトに対応していません。 詳しくは、[システムオブジェクトの拡張](../extending-system-objects.md)を参照してください。
   ```

1. ［Details］タブで、カテゴリー設定を有効にし、 ［**Save**］ をクリックします。

   ![カテゴリー設定を有効にします。](./adding-categorization-to-fields-tabs/images/01.png)

1. ［**Layouts**］ タブをクリックし、目的のレイアウトを選択します。

1. ［**Layout**］ タブを開き、目的の [フィールドタブ](./designing-object-layouts.md#fields-tabs) の **アクション** ボタン (![Actions Button](../../../../images/icon-actions.png))をクリックし、 ［**Add Categorization**］ を選択します。

   ![アクションボタンをクリックし、［カテゴリー設定を追加］を選択します。](./adding-categorization-to-fields-tabs/images/02.png)

   これにより、カテゴリー設定ツールにアクセスするためのタブに新しいブロックが追加されます。

   ```{important}
   カテゴリー設定ブロックは、レイアウトごとに1つのタブにのみ追加できます。
   ```

1. ブロックが **折りたたみ可能** かどうかを判断します。

   ![ブロックが折りたたみ可能かどうかを判断します。](./adding-categorization-to-fields-tabs/images/03.png)

1. ［**Save**］ をクリックします。

オブジェクトのエントリーを作成または編集する際に、ユーザーはタグやカテゴリーにアクセスし、適用できるようになりました。

![オブジェクトのエントリーにアクセスし、タグやカテゴリーを適用します。](./adding-categorization-to-fields-tabs/images/04.png)

```{note}
可視性と権限はカテゴリ設定ブロックの表示に影響します。
```

## 関連トピック

* [オブジェクトの作成](../creating-objects.md)
* [オブジェクトレイアウトの設計](./designing-object-layouts.md)
