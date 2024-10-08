# タグ ファセット

タグファセットは、検索キーワードに一致するタグを持つアセットの検索結果を絞り込みます。 各一致はファセット用語として表示されます。

![タグ ファセットの結果の例。](./tag-facet/images/01.png)

## タグファセットを設定する

タグファセットを設定するには、ファセットのオプションメニュー(![Options](../../../images/icon-app-options.png))を開き、 **設定** をクリックします。

![［設定］オプションをクリックします。](./tag-facet/images/03.png)

**ディスプレイの設定：****デフォルト** 、 **コンパクトレイアウト** 、 **ラベルレイアウト** の中から選択します。 デフォルトのレイアウトでは、各用語の横にチェックボックスが表示されますが、コンパクトレイアウトでは表示されません。 ラベルレイアウトでは、用語ごとにクリック可能な小さなラベルが表示されます。

［詳細設定］セクションには、追加のオプションが含まれています。

**Tag Parameter Name（タグ・パラメーター名）。** FacetのURLのパラメータ名を変更します。 デフォルトは、 **タグ** です。

**最大ターム数：** ファセットに一致する用語がいくつ見つかったかに関係なく、表示するファセット用語の最大数を設定します。

**頻度の閾値：** 用語がファセット用語のリストに表示されるために必要な最小頻度を設定します。 たとえば、ファセットの頻度の閾値が3に設定されている場合、一致する結果が2つの用語は用語結果リストに表示されません。

**表示頻度：** 用語頻度を表示するかどうかを選択します。

**Order Terms By:** Liferay 7.4 U53+/GA53+ では、ファセットのタームソート戦略を選択することができます。Term Frequency Descending (デフォルト)、Term Frequency Ascending、Term Value Ascending、Term Value Descendingのいずれかを選択できます。 デフォルトのソートでは、ファセット用語のマッチ数が多いものから少ないものへと並べ替えられます。 用語値オプションは、ファセット用語をアルファベット順に並べる。
