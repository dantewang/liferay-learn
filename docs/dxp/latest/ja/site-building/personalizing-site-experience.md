---
toc:
- ./personalizing-site-experience/segmentation.md
- ./personalizing-site-experience/experience-personalization.md
- ./personalizing-site-experience/migration-from-audience-targeting.md
- ./personalizing-site-experience/enabling_automated-live-chat-systems.md
- ./personalizing-site-experience/developer-guide.md
---
# サイトエクスペリエンスのパーソナライズ

```{toctree}
:maxdepth: 3

personalizing-site-experience/segmentation.md
personalizing-site-experience/experience-personalization.md
personalizing-site-experience/migration-from-audience-targeting.md
personalizing-site-experience/enabling_automated-live-chat-systems.md
personalizing-site-experience/developer-guide.md
```

Liferay DXPは、パーソナライズされたエクスペリエンスを理解して提供するための強力なツールを備えています。 パーソナライズされた体験を提供するための最初のステップは、ユーザーの収集、つまりセグメンテーションから始まります。 [**ユーザーセグメント**](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) には、 [**コレクション**](../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md)が動的に割り当てられます。 ユーザーをコレクションに手動で割り当てる代わりに、ユーザーは共有属性または動作に基づいてセグメントに割り当てられます（詳細は、 [コレクションのパーソナライズ](./personalizing-site-experience/experience-personalization/personalizing-collections.md) を参照してください）。

<a name="segmentation" />

## セグメンテーション

セグメントビルダーを使用すると、ユーザープロファイルの属性、動作、サイトロールなどで類似したユーザーをグループ化できます。

![さまざまなユーザープロパティ値をチェックして、ユーザーセグメントを作成します。](./personalizing-site-experience/images/01.png)

開始するには、[セグメントの作成と管理](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)を参照してください。

```{note}
ユーザーセグメントは、ロールの割り当てにも使用できます。 詳細は、 [ユーザーセグメントへのロールの割り当て](../../users-and-permissions/roles-and-permissions/assigning-roles-to-user-segments.md) を参照してください。
```

<a name="tracking-behavior-of-user-segments-with-liferay-analytics-cloud" />

### Liferay Analytics Cloudを使用したユーザーセグメントの動作の追跡

Liferay DXPインスタンスをLiferay Analytics Cloudと統合して、セグメントを強化します。 Analytics Cloudは、DXPをSalesforce（tm）およびその他のデータソースと統合して、ユーザーベースをさらに理解する方法を提供します。

Analytics Cloudとの統合により、機械学習を活用した詳細なデータ分析機能が提供され、DXPサイトのすべてのページに対するユーザーの行動とエンゲージメントを理解するのに役立ちます。 Analytics Cloudを使用すると、ユーザーの行動や、標準コンテンツと対象コンテンツの両方との相互作用を確認できます。 詳細は、 [ユーザーセグメントの分析を取得する](./personalizing-site-experience/segmentation/getting-analytics-for-user-segments.md) を参照してください。

![Analytics Cloudを使用したサイトメトリクス。](./personalizing-site-experience/images/05.png)

<a name="personalization" />

## パーソナライゼーション

[ユーザーセグメントを作成](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md)したら、ユーザーセグメントに固有のサイトエクスペリエンスの調整を開始できます。 コンテンツページのパーソナライゼーションとコンテンツセットのパーソナライゼーションは、パーソナライズされたユーザーエクスペリエンスを提供するために使用できる2つの方法です。

<a name="content-pages" />

### コンテンツページ

コンテンツページのパーソナライゼーションを行うと、ページの閲覧者に基づいてページレイアウトとコンテンツが動的に変化します。 ページを表示しているユーザーのユーザーセグメント基準に基づいて、さまざまなテキスト、画像、ウィジェット、さらにはさまざまなレイアウトを提供する[コンテントページ](./creating-pages/using-content-pages.md)の **エクスペリエンス** を作成できます。 詳細は、 [コンテンツページのパーソナライゼーション](./personalizing-site-experience/experience-personalization/content-page-personalization.md) を参照してください。

![ユーザーのさまざまなセグメントに固有のエクスペリエンスを作成できます。](./personalizing-site-experience/images/02.png)

<a name="collections" />

### コンテンツセット

[コレクション](../content-authoring-and-management/collections-and-collection-pages/about-collections-and-collection-pages.md) コンテンツを整理して表示します。 [コレクションのパーソナライゼーション](./personalizing-site-experience/experience-personalization/personalizing-collections.md) ユーザーセグメントに基づいたコレクションの選択を提供します。 つまり、特定のコンテキストで表示されるコンテンツセットは、 [ユーザーセグメント](./personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) の基準によって決定されます。 例えば、コレクションを使って「特集」の記事をページの上部に表示することができます。 次に、デフォルトのコンテンツではなく、より専門的なコンテンツを受け取る必要があるユーザーを含むユーザーセグメントを作成できます。 これらのセグメントには、デフォルトのコンテンツではなく、ユーザーの興味に合わせてパーソナライズされたコンテンツが表示されます。 詳しくは、 [コレクションのパーソナライズ](./personalizing-site-experience/experience-personalization/personalizing-collections.md) をご覧ください。

![コンテンツセットをパーソナライズして、特定のユーザーセグメントのアセットを表示できます。](./personalizing-site-experience/images/03.png)

```{note}
コレクションは、Liferay DXP 7.2ではコンテンツセットと呼ばれています。
```

<a name="previewing-user-experiences" />

### ユーザーエクスペリエンスのプレビュー

ページの上部にある **シミュレーション** ボタン（![Simulation](../images/icon-simulation.png)）をクリックし、 ［**Segments**］ の選択からユーザーセグメントを選択して、そのユーザーセグメントのメンバーとしてページをプレビューすることにより、ユーザーがページで体験できるさまざまなエクスペリエンスをプレビューできます。

ユーザーセグメントのパースペクティブを表示すると、そのユーザーセグメントのコンテンツページまたはコンテンツセットのパーソナライゼーションがプレビューされます。

![プレビューパネルからさまざまなエクスペリエンスをプレビューできます。](./personalizing-site-experience/images/04.png)

<a name="related-information" />

::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} セグメンテーション
:link: ./personalizing-site-experience/segmentation.md
:::

:::{grid-item-card} エクスペリエンスのパーソナライゼーション
:link: ./personalizing-site-experience/experience-personalization.md
:::

:::{grid-item-card} オーディエンスターゲティングからの移行
:link: ./personalizing-site-experience/migration-from-audience-targeting.md
:::

:::{grid-item-card} 自動ライブチャットシステムの有効化
:link: ./personalizing-site-experience/enabling-automated-live-chat-systems.md
:::

:::{grid-item-card} 開発者ガイド
:link: ./personalizing-site-experience/developer-guide.md
:::
::::
