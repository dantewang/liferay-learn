# マスターページテンプレートの作成

> 対応可能：Liferay DXP/Portal 7.3以降

ポータルには、サイトのページのヘッダーとフッターのルック＆フィールを定義するために使用できるデフォルトのマスターページテンプレートが含まれていますが、さらにカスタムソリューションが必要になる場合があります。 このためのカスタムマスターページテンプレートを作成できます。

マスターページテンプレートを作成するには、次の手順に従います。

1. プロダクトメニューを開き、［サイト］ &rarr; ［**デザイン**］ &rarr; ［**ページテンプレート**］ に移動します。
1. ［マスター］タブで、 **追加**(![Add](./../../../images/icon-add.png) をクリックして、新しいマスターページテンプレートを作成します。
1. 新しいマスターページテンプレートの **名前** を入力します。
1. サイドバーの ［**Fragments and Widgets**］(![Fragments and Widgets](./../../../images/icon-add-widget.png))をクリックして、必要な共通要素のフラグメントを追加してください。

    ![マスターページテンプレートの共通要素をフッターおよびナビゲーションバーセクションから追加します。](./creating-a-master-page-template/images/02.png) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

1. 必要に応じて、ドロップゾーンをレイアウト内の新しい場所にドラッグ＆ドロップします。 例えば、2つのモジュールからなるグリッドを追加し、ドロップゾーンを1つのモジュールに移動すると、ユーザーはグリッドのその部分にのみページフラグメントを追加することができます。

    ![ドロップゾーンを移動して、ユーザーがページフラグメントを追加できる場所をコントロールできます。](./creating-a-master-page-template/images/03.gif) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

1. 必要に応じて、 ［**Configure Allowed Fragments**］ ボタンをクリックして、ドロップゾーンに追加できるページフラグメントを指定します。

    - このマスターページテンプレートで許可するページフラグメントにチェックを入れます。
    - ［**Select New Fragments Automatically**］ にチェックを入れると、新しいフラグメントタイプが許可されるリストに含まれるようになります。

    ![許可されたフラグメントダイアログのフラグメントをオンまたはオフにして、このマスターページテンプレートを使用するページに追加できるかどうかを指定します。](./creating-a-master-page-template/images/04.png) <!--TASK: UPDATE IMG FOR LRDOCS-10856-->

1. ［**保存**］ をクリックして、 ［**Allowed Fragments**］ のダイアログを閉じます。
1. コンテントページをプレビューするには、 **プレビュー** ボタン (![Preview](../../../images/icon-preview.png)) をクリックしてください。
1. ［**Publish Master**］ をクリックし、マスターページテンプレートを作成します。

**元に戻す**(![Preview](../../../images/icon-undo.png)) や **やり直す**(![Preview](../../../images/icon-redo.png)) ボタンで任意の操作を元に戻したり、 **履歴**(![Preview](../../../images/icon-time.png))で以前のバージョンの編集に戻ったりすることができます。

```{note}
カスタムマスターページテンプレートを使用している場合、そのページのテーマはマスターページテンプレートで定義され、ページの設定から変更することはできません。 詳しくは、 [Changing a Master Page Template's Theme](./managing-master-page-templates.md#changing-a-master-page-template-s-theme) をご覧ください。
```

## 追加情報

- [マスターページテンプレートの管理](./managing-master-page-templates.md)
- [マスターページテンプレート](./master-page-templates.md)
