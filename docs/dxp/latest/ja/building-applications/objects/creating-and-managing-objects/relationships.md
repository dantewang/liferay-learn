---
toc:
  - ./relationships/defining-object-relationships.md
  - ./relationships/removing-relationships.md
---
# 関連

```{toctree}
:maxdepth: 3

relationships/defining-object-relationships.md
relationships/removing-relationships.md
```

{bdg-secondary}`Liferay 7.4 U47+/GA47+`

関連は、オブジェクト定義にフィールドとテーブルを追加し、そのエントリーを相互に関連付けるものです。 これにより、異なるアプリケーションのコンテキストでエントリーデータにアクセスすることができます。 このデータをさまざまな方法で利用することができます。 たとえば、複数のビジネスアカウントを持つシナリオでは、アカウントシステムオブジェクトとの関連を使用して、[カスタムオブジェクトデータへのアクセスをアカウントごとに制限する](../creating-and-managing-objects/using-system-objects-with-custom-objects/restricting-access-to-object-data-by-account.md)ことができます。 あるいは、 [集約フィールド](../creating-and-managing-objects/fields/aggregation-fields.md)を関連とともに使用して、基本的な計算を行うことができます。

![オブジェクトに関連を追加します。](./relationships/images/01.png)

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトリレーションシップの定義
:link: ./relationships/defining-object-relationships.md
:::

:::{grid-item-card} 関連の削除
:link: ./relationships/removing-relationships.md
:::
::::
