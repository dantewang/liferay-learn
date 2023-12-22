---
toc:
  - ./layouts/designing-object-layouts.md
  - ./layouts/adding-categorization-to-fields-tabs.md
---
# レイアウト

```{toctree}
:maxdepth: 3

layouts/designing-object-layouts.md
layouts/adding-categorization-to-fields-tabs.md
```

{bdg-secondary}`Liferay 7.4+`

オブジェクトレイアウトは、エントリーを作成または編集するときにフィールドと関連がどのように表示されるかを定義します。 すべての公開済みオブジェクトには、オブジェクトのフィールドをアルファベット順に並べた1つのタブを持つ自動生成されたレイアウトが含まれています。 カスタムオブジェクト用に[独自のレイアウトを設計](./layouts/designing-object-layouts.md)し、そのフィールドや関連をどのように表示するかを決定することができます。 7.4 U31+とGA31+では、 [カテゴリー設定ツール](./layouts/adding-categorization-to-fields-tabs.md) をタブに追加し、エンドユーザーがオブジェクトエントリーにタグとカテゴリーを適用できるようにすることもできます。

```{important}
自動生成されたレイアウトには、オブジェクトリレーションは表示されません。 リレーションを表示するには、カスタムレイアウトを作成する必要があります。
```

![カスタムオブジェクトにレイアウトを追加し、エントリー作成時のフィールドや関連の表示方法を定義することができます。](./layouts/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトレイアウトの設計
:link: ./layouts/designing-object-layouts.md
:::

:::{grid-item-card} フィールドタブへのカテゴリー設定の追加
:link: ./layouts/adding-categorization-to-fields-tabs.md
:::
::::
