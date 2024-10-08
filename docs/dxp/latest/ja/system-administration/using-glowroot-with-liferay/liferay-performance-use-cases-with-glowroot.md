# Glowroot による Liferay パフォーマンスの使用例

{bdg-secondary}`liferay DXP 2023.Q4+/Portal 7.4 GA100+`.

[Glowroot](https://glowroot.org/) を使用して、Liferay インストールのパフォーマンスを診断し、改善するための情報を提供します。 可能な使用例をいくつか挙げてみよう。

## 大型コレクションの返却

GlowrootのTransactionsタブを監視していると、遅いトランザクションが確認できるかもしれません。 例えば、`blog-postings`のトランザクションに非常に長い時間（例えば30秒）がかかることに気づいたとする。

この問題を手っ取り早く解決するには、`pageSize`をカスタマイズして、トランザクションあたりの投稿件数を少なくして返すことだろう。 また、フィルタを適用して、トランザクションの特定のブログ投稿のみを返すこともできます。 Glowrootを使用して、異なるトランザクションの応答時間を比較する。

## カスタムファセットの最適化

Liferayは、 [カスタムファセット](../../using-search/search-pages-and-widgets/search-facets/custom-facet.md) をサポートしているので、サイトの検索を最適化することができます。

カスタムファセットでは、複数のファセットアイテムを追加すると、ページのレスポンスタイムが遅くなることがあります。 Glowrootを使用してトランザクションを検査し、検索応答を最適化する。 例えば、アイテム数を返すことによって、速度低下が起こるかもしれない。 カウント計算の呼び出しを削除することで、パフォーマンスが向上し、ロード時間が短縮されると結論づけられるかもしれない。
