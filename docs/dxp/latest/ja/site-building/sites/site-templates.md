---
toc:
  - ./site-templates/creating-site-templates.md
  - ./site-templates/propagating-template-changes.md
  - ./site-templates/configuring-site-template-propagation.md
  - ./site-templates/exporting-importing-site-templates.md
---
# サイトテンプレート

```{toctree}
:maxdepth: 4

site-templates/creating-site-templates.md
site-templates/propagating-template-changes.md
site-templates/configuring-site-template-propagation.md
site-templates/exporting-importing-site-templates.md
```

Liferayは、サイト作成時に使用できる構造とコンテンツを設計するためのサイトテンプレートを提供します。 各テンプレートには、ページ、スタイルブック、ウェブコンテンツなどを追加するためのほとんどの標準的なサイトアプリケーションが含まれています。 テンプレートで作成されたサイトは、そのテンプレートのすべてのデータを継承します。 詳しくは、 [サイトテンプレートの作成](./site-templates/creating-site-templates.md) をご覧ください。

```{note}
サイトテンプレートは、ステージング、ワークフロー、メンバーシップ、チーム、セグメントを除くすべてのサイトアプリケーションをサポートします。
```

テンプレートを使ってサイトを作成したら、テンプレートのページに変更を加え、その変更を接続されているサイトに自動的に反映させることができます。 詳しくは、 [テンプレートの変更を伝播する](./site-templates/propagating-template-changes.md) を参照してください。

```{important}
サイトテンプレートは、主に複数のサイトでページを管理するためのものです。 サイト間でウェブコンテンツやその他のアセットを作成・管理する必要がある場合は、[asset libraries](../../content-authoring-and-management/asset-libraries/asset-libraries-overview.md) を使用してください。
```

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} サイトテンプレートの作成
:link: ./site-templates/creating-site-templates.md
:::

:::{grid-item-card} テンプレートの変更の伝播
:link: ./site-templates/propagating-template-changes.md
:::

:::{grid-item-card} サイトテンプレート伝搬の設定
:link: ./site-templates/configuring-site-template-propagation.md
:::

:::{grid-item-card} サイトテンプレートのエクスポートとインポート
:link: ./site-templates/exporting-importing-site-templates.md
:::
::::
