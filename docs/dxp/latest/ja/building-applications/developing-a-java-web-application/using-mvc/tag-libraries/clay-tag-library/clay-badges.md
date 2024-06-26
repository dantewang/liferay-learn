# Clayバッジ

バッジは、通知や新しい未読メールなどの重要な情報を強調するのに役立ちます。 バッジには円形の枠線があり、数字を指定するためにのみ使用されます。 ここでは、アプリに追加できるさまざまな種類のClayバッジについて説明します。

## バッジの種類

次のバッジスタイルを使用できます。

プライマリバッジ：

```jsp
<div class="col-md-1">
    <clay:badge label="8" />

    <div>Primary</div>
</div>
```

![プライマリバッジは明るい青色で、フォームのプライマリボタンのように注目を集めます。](./clay-badges/images/01.png)

セカンダリーバッジ：

```jsp
<div class="col-md-1">
    <clay:badge displayType="secondary" label="87" />

    <div>Secondary</div>
</div>
```

![セカンダリバッジは薄い灰色で、プライマリボタンほどは注目されません。](./clay-badges/images/02.png)

情報バッジ：

```jsp
<div class="col-md-1">
    <clay:badge displayType="info" label="91" />

    <div>Info</div>
</div>
```

![情報バッジは紺色で、一般的な情報に関連する数字に使用されます。](./clay-badges/images/03.png)

エラーバッジ：

```jsp
<div class="col-md-1">
    <clay:badge displayType="danger" label="130" />

    <div>Error</div>
</div>
```

![エラーバッジには、エラーに関連する数字が表示されます。](./clay-badges/images/04.png)

成功バッジ：

```jsp
<div class="col-md-1">
    <clay:badge displayType="success" label="1111" />

    <div>Success</div>
</div>
```

![成功バッジには、成功したアクションに関連する数字が表示されます。](./clay-badges/images/05.png)

注意バッジ：

```jsp
<div class="col-md-1">
    <clay:badge displayType="warning" label="21" />

    <div>Warning</div>
</div>
```

![注意バッジには、対処する必要のある警告に関連する数字が表示されます。](./clay-badges/images/06.png)

これで、バッジを使用してアプリの値を追跡する方法がわかりました。

## 関連トピック

* [Clayラベルとリンク](./clay-links-and-labels.md)
* [Clayカード](./clay-cards.md)
* [Clayステッカー](./clay-stickers.md)