---
toc:
- ./product-recommendations/using-product-recommendations.md
- ./product-recommendations/understanding-recommendation-types.md
---

# 商品の推薦

{bdg-primary}`サブスクリプション`

```{toctree}
:maxdepth: 1

product-recommations/using-product-recommations.md
product-recommations/understanding-recommendation-types.md
```

Liferayは、コンテンツベースとユーザーベースの両方の商品推薦に対応しています。 Liferayインスタンスの商品と注文データを使ってこれらを表示することができます。

詳しくは、 [商品の推薦の使用](./product-recommendations/using-product-recommendations.md)をご覧ください。

商品のおすすめは5種類あります。 それぞれ異なるサイトコンテキストで使用することで、お客様のショッピング体験の各段階において、関連する商品を紹介することができます。

* **コンテンツに基づいた商品推薦：** 現在閲覧している商品と類似した商品をおすすめします。
* **ユーザー個人に合わせた推奨：** 類似顧客の購入履歴をもとに商品を推薦します。
* **コンテキストを考慮したユーザー個人に合わせた推奨：** 類似カテゴリの商品や類似顧客の購入履歴を推奨します。
* **"こちらもおすすめ "推奨：** 全顧客の購入履歴をもとに商品をおすすめします。
* **よく一緒に購入されている商品を推奨：** 閲覧中の商品と一緒によく購入されている商品をおすすめします。

```{important}
お客様の類似性は、現在、購入履歴のみで判断しています。 2人の顧客が同じ商品を購入した場合、2人は類似しています。
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} 商品推薦の使用
:link: ./product-recommendations/using-product-recommendations.md
:::

:::{grid-item-card} 推奨タイプの理解
:link: ./product-recommendations/understanding-recommendation-types.md
:::
::::
