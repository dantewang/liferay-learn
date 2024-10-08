# Wikiページの作成

［**Wiki**］ ウィジェットは、 **FrontPage** と呼ばれるデフォルトのWikiページから始まります。 ユーザーはこのページを編集して、最初のWikiページを作成できます。

デフォルトでは、認証されたユーザーのみが **Wiki** の記事を作成できます。ゲストは、最初にサインインする必要があります。

<a name="creating-content-on-the-frontpage" />

## **FrontPage** でコンテンツを作成する

1. ［**Wiki**］ ウィジェットがデプロイされているサイトページに移動します。

    ![コンテンツのない［Wiki］ウィジェット](./creating-wiki-pages/images/01.png)

1. **FrontPage** を変更するには、ボックス内の ［**This page is empty. Edit it to add some text.**］ リンクをクリックします。
1. デフォルトのテキストエディターはCreoleを使用します。 形式を切り替えるには、 ［**設定**］ セクションを展開します。

    ![テキスト形式の変更](./creating-wiki-pages/images/02.png)

1. 新しい形式（HTML）を選択し、 ［**OK**］ をクリックして変更を受け入れます。
1. 記事の内容を入力します。

### 添付ファイルをアップロードする

ユーザーはファイルをWikiページに添付できます。

1. 添付ファイルを追加するには、 ［**Attachments**］ セクションを展開します。
1. ファイルをドラッグアンドドロップしてアップロードするか、 ［**Select Files**］ ボタンを使用してファイルの場所に移動します。

    ![添付ファイルのアップロード](./creating-wiki-pages/images/03.png)

```{important}
You can enable automatic antivirus scanning to scan files on upload. For details, please see [アップロードされたファイルのウイルス対策スキャンを有効にする](../../system-administration/file-storage/enabling-antivirus-scanning-for-uploaded-files.md) .
```

### タグと関連アセットを使用してWikiページを整理する

ユーザーはページにタグを追加できます。 このタグを使用してコンテンツを検索すると（たとえば、 **Toyota**）、 **Toyota** を含むすべての投稿がより速く返されます。

1. ［**カテゴリー設定**］ セクションを展開します。
1. ［**選択**］ ボタンをクリックして、既存のタグを選択します。 または、 ［**Tags**］ フィールドにタグ名を入力して ［**追加**］ をクリックし、新しいタグを作成します。 詳細は、 [タグに関するドキュメント](https://help.liferay.com/hc/articles/360028820472-Tagging-Content) を参照してください。

1. 完了したら、 ［**公開**］ をクリックします。

![FrontPageページの公開](./creating-wiki-pages/images/05.png)

**FrontPage** の記事が作成されました。

<a name="creating-child-pages" />

## 子ページを作成する

**FrontPage** ページが作成されると、ユーザーは **子ページ** を作成できます。 これにより、Wikiページの単純な親子階層が作成されます。 **Wikiの子ページ** は親ページに属している場合でも、独自の子記事を持つことができます。 **子ページ** を作成するには、 ［**Add Child Page**］ をクリックします。

![子ページを追加する](./creating-wiki-pages/images/06.png)

同じ **Wiki** ページエディターが開きます。

![Wikiページエディターは、すべてのレベルのすべてのページで同じです。](./creating-wiki-pages/images/07.png)

<a name="creating-other-top-level-pages" />

## 他のトップレベルページを作成する

「**子ページを作成する**」 で前述したように、今後のWikiページは、組織化の目的で子ページとして作成されます。 別のトップレベルページを作成するには：

1. ［**All Pages**］ タブをクリックします。
1. ［**Wiki**］ ウィジェットのメニューの上にマウスを置き、 ［**Add Page**］ をクリックします。

   ![別のWikiトップレベルページを追加する](./creating-wiki-pages/images/04.png)

同じ **Wiki** ページエディターが開きます。

［**Wiki**］ ウィジェットは複数のトップレベルページを持つことができます。メインの ［**Wiki**］ ウィジェットには **FrontPage** Wikiページしか表示されませんが、サイトコンテンツの作成者は[［Wiki Display］ウィジェット](./using-the-wiki-display-widget.md)を使用して他のトップレベルページを表示できます。

![［Wiki Display］ウィジェットを使用して他のトップレベルページを表示する](./creating-wiki-pages/images/08.png)

<a name="whats-next" />

## 次のステップ

* [ノードの作成](./creating-a-node.md)
* [Wiki表示ウィジェットの使用](./using-the-wiki-display-widget.md)
