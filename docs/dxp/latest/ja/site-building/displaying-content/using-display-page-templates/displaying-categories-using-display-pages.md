# 表示ページを使用したカテゴリー表示

{bdg-secondary}`Liferay DXP/Portal 7.4以降で利用可能`

表示ページテンプレートを使用すると、Webコンテンツ、ドキュメント、ブログエントリーを[表示ページ](../../../site-building/displaying-content/using-display-page-templates/publishing-content-with-display-pages.md)にレンダリングすることができます。 Liferay DXP 7.4 からは、表示ページでカテゴリーをレンダリングすることもできます。 これは、 [カテゴリーを使って整理した](../../../content-authoring-and-management/tags-and-categories/organizing-content-with-categories-and-tags.md)複数の製品やサービスを紹介したい場合に便利です。 表示ページは、要素のカタログを一貫して表示するのに適しているため、カテゴリベースの表示ページを使用して、製品やサービスのカタログを閲覧する際に、ユーザーに一貫したエクスペリエンスを提供することができます。

## 表示ページを使用したカテゴリー表示

表示ページのカテゴリーは、他のタイプの表示ページのコンテンツと同じ方法でレンダリングされます。 2つのオプションがあります。

- カテゴリ用の[表示ページテンプレートを作成](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)し、このテンプレートをデフォルトとして設定します。
- [カテゴリを作成または編集する](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)際に、お好みの表示ページテンプレートを選択してください。

また、複数のカテゴリーに一度に表示ページテンプレートを割り当てることができます。サイト管理 &rarr; **カテゴリ分け** &rarr; **カテゴリ**」で、更新したいカテゴリをチェックし、ページ（！ [ページ](../../../images/icon-page.png) ）アイコンをクリックするか、トップアクション（！ [アクション](../../.../images/icon-actions.png) ）メニューから、 **ページテンプレートの割り当て** を選んでください。

![アクションメニューで表示ページテンプレートをデフォルトに設定します。](./displaying-categories-using-display-pages/images/07.png)

## 例：表示ページでのカテゴリベースのナビゲーションの使用

このステップバイステップの例では、カテゴリと表示ページテンプレートを組み合わせて、架空の保険会社のサービスを表示する方法を説明します。

カテゴリを表示ページに表示する手順は次のとおりです。

1. [表示したいカテゴリを作成および編集します](#step-1-creating-and-editing-the-categories) 。
1. [表示ページテンプレートを作成します](#step-2-creating-the-display-page-template) 。
1. [表示ページテンプレートを編集および公開します](#step-3-edit-and-publish-the-display-page-template) 。

```{warning}
次の例は、デフォルトの表示ページテンプレートを変更する方法です。 本番用サイトでの混乱を避けるため、この手順はテスト用サイトで行ってください。
```

### ステップ1：カテゴリの作成と編集

カテゴリがまだ存在しない場合は作成し、表示ページにマッピングしたい情報を記載します。 この例では、説明と画像を含む2つの新しいカテゴリを作成します。各カテゴリは、異なるサービスに対応しています。

1. **自動車保険** という名前の [新規カテゴリーを作成します](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md#defininig-categories) 。
1. カテゴリアプリケーションで、新しいカテゴリの **Actions**(![Actions](../../../images/icon-actions.png)）メニューをクリックし、 ［**編集**］ を選択します。
1. ［**Details**］ タブをクリックし、このカテゴリの ［**Description**］ を追加します。

   ![カテゴリを編集し、説明を追加します。](./displaying-categories-using-display-pages/images/01.png)

1. ［**画像**］ タブをクリックし、 ［**画像の追加**］(![Add Image](../../../images/icon-add.png)) ボタンを使用して、カテゴリの画像を追加します。
1. ［**Details**］ タブを再度クリックし、 ［**保存**］ をクリックします。

### ステップ２：表示ページテンプレートの作成

Liferay DXP 7.4から、表示ページテンプレートにコンテンツの種類としてカテゴリを使用するオプションが追加されました。

1. **プロダクトメニュー** &rarr; ［**デザイン**］ &rarr; ［**ページテンプレート**］ を開きます。
1. ［**表示ページテンプレート**］ をクリックし、 **追加**(![Add Image](../../../images/icon-add.png)) ボタンをクリックします。
1. この表示ページテンプレートに使用するマスターページテンプレートを選択します。

    ```{tip}
    すべてのページやページテンプレートは、マスターページテンプレートを必要とします。 詳細については、[マスターページテンプレート](../../creating-pages/defining-headers-and-footers/master-page-templates.md)を参照してください。
    ```

1. 表示ページテンプレートの **Name** を入力し、 ［**Content Type**］ のドロップダウンメニューで、 ［**Category**］ を選択してください。

    ![新しい表示ページテンプレートのコンテンツタイプとして、［ナビゲーション］を選択します。](./displaying-categories-using-display-pages/images/02.png)

1. ［**Save**］ をクリックします。

### ステップ３：表示ページテンプレートの編集と公開

表示ページテンプレートを作成した後、コンポーネントマッピングとレイアウトを編集できます。

```{tip}
表示ページテンプレートエディタは、コンテントページエディタのように機能します。 詳細については、[コンテンツページへの要素の追加](../../creating-pages/using-content-pages/adding-elements-to-content-pages.md)を参照してください。
```

この例では、 [カードフラグメント](../../creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md)を使用してカテゴリフィールドをマッピングする方法を示しています。

1. コンテナフラグメントをデフォルトのドロップゾーンにドラッグアンドドロップします。
1. コンテナフラグメントの上に、新しいカードフラグメントをドラッグアンドドロップします。
1. **ブラウザ**(![Browser](../../../images/icon-hierarchy.png))ボタンをクリックし、カードのタイトルをクリックすると、マッピングのオプションが表示されます。
1. マッピングタブで、 ［**ソース**］ ドロップダウンメニューをクリックし、 ［**カテゴリ**］ を選択します。
1. ［**Field**］ ドロップダウンメニューをクリックし、 ［**Name**］ を選択して、カテゴリの名前をカードのタイトルにマッピングします。

   ![カードフラグメントを使用して、表示ページテンプレートのカテゴリフィールドをマッピングします。](./displaying-categories-using-display-pages/images/03.png)

1. カード説明とカード画像についても、同様のマッピング作業を繰り返します。 このリストでは、この例におけるカードフラグメントからカテゴリフィールドへのマッピングをまとめています。

    - タイトル &rarr; 名前
    - コンテンツ &rarr; 説明
    - 画像 &rarr; メイン画像

1. ［**公開**］ をクリックします。
1. ［**Display Page Templates**］ リストで、新しい表示ページテンプレートの **アクション**(![Actions](../../../images/icon-actions.png)) メニューをクリックして ［**Mark as Default**］ を選択します。

   ![アクションメニューで表示ページテンプレートをデフォルトに設定します。](./displaying-categories-using-display-pages/images/04.png)

1. プロダクトメニュー(![Product Menu](../../../images/icon-menu.png)) で、 ［**カテゴリー設定**］ &rarr; ［**カテゴリー**］ を選択し、 [ステップ1](#step-1-creating-and-editing-the-categories) からカテゴリーを持つボキャブラリを選択します。
1. 任意のカテゴリで、 **アクション**(![Actions](../../../images/icon-actions.png)）メニューをクリックし、 ［**View Display Page**］ を選択します。

   ![アクションメニューのオプションを使用して、いずれかのカテゴリの表示ページを開きます。](./displaying-categories-using-display-pages/images/05.png)

表示ページでは、表示ページテンプレートのマッピングを使用して、カテゴリフィールドを表示します。 表示ページのURLは、選択したカテゴリ用のユニークのものとなっています。

![表示ページテンプレートは、カテゴリフィールドを表示し、ユニークなURLを提供します。](./displaying-categories-using-display-pages/images/06.png)

## 関連情報

- [表示ページテンプレートの作成と管理](./creating-and-managing-display-page-templates.md)
- [表示ページによるコンテンツの公開](./publishing-content-with-display-pages.md)
- [コンテンツのカテゴリーとボキャブラリーを定義する](../../../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md)。
