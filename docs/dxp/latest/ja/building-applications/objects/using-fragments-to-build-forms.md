# フラグメントでフォームを構築する

{bdg-secondary}`Liferay 7.4 U45+/GA45+`

Liferayには、コンテンツページにオブジェクトフォームを構築するためのフォームフラグメントがあります。 フォームを作成するには、コンテンツページまたはページテンプレートにフォームコンテナを追加し、公開オブジェクトにマッピングします。 コンテナは、各オブジェクト・フィールドにマッピングされたフラグメントを自動的に入力する。 手動でフラグメントを整理、削除、追加することができます。 公開されると、エンドユーザーはフォームを使ってオブジェクト・エントリーを作成できる。

コンテンツページにフォームを作成するには

* フォームの断片は、マッピングされたフォームコンテナにのみ配置します。
* フォーム内のすべてのフォームフラグメントをオブジェクトフィールドにマッピングし、データの損失を防ぐ。
* すべての必須オブジェクト・フィールドのフラグメントをフォーム・コンテナに含める。
* 必須フォームの断片を見えるようにする。
* フォームコンテナ内に送信ボタンを表示する。

デフォルトでは、Liferayには [Form Components](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components) フラグメントセットが含まれていますが、自分で作成することもできます。 詳しくは [フォーム・フラグメントの作成](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md) を参照してください。

```{important}
フォームフラグメントはカスタムオブジェクトでのみ使用できます。 そのため、Liferayは少なくとも1つの公開オブジェクトができるまで、Form Componentsフラグメントセットを非表示にします。 公開されると、オブジェクトへのアクセス権を持つユーザーは、フォームコンポーネントのフラグメントを表示、使用することができます。 詳しくは[オブジェクトの作成](../objects/creating-and-managing-objects/creating-objects.md)を参照。
```

## フォームの作成

1. コンテンツページまたはページテンプレートの編集を開始します。

   表示ページテンプレートはフォームフラグメントをサポートしていません。

1. (オプション）フラグメントを使ってレイアウトをデザインする。 詳しくは [Building Responsive Layouts with Fragments](../../site-building/optimizing-sites/building-a-responsive-site/building-responsive-layouts-with-the-grid-fragment.md) を参照してください。

1. **フォームコンテナ** フラグメントをページに追加し、オブジェクトにマッピングします。

   コンテナは、すべてのオブジェクトフィールドに対して、送信ボタンとフラグメントを自動的に生成します。 アルファベット順に並んでいる。 必須項目には適宜マークが付きます。

   ![フォームコンテナを追加し、それをオブジェクトにマッピングする。](./using-fragments-to-build-forms/images/01.png)

1. フォームに不要な非必須フィールドを削除する。

1. フォームの断片をドラッグ・アンド・ドロップして再編成する。 デフォルトでは、フォーム要素はアルファベット順に整理されます。

1. (オプション）フォームコンテナに基本フラグメントを追加する。 基本的なコンポーネント（グリッド、セパレーター、段落、画像など）を使って、フォームコンテナに構造とスタイルを与えることができます。

   ![フォームコンテナに基本的なフラグメントを追加し、ページ要素を再編成して希望の構造を作りましょう。](./using-fragments-to-build-forms/images/02.png)

1. フラグメントを設定する。 フォームの断片には、 [標準の](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md) と、 [ユニークな](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options) の両方の設定オプションがあります。

   ```{note}
   フォーム・フラグメントの設定オプションは、フラグメントをオブジェクト・フィールドにマッピングした後に利用可能になります。
   ```

   ![フォームの断片を設定する。](./using-fragments-to-build-forms/images/03.png)

1. 完了したら、 ［**公開**］ をクリックします。

## フォームコンポーネントでサポートされているフィールドタイプ

各フォーム・フラグメントは、1つ以上のオブジェクト・フィールド・タイプをサポートすることができる。 デフォルトのフォームコンポーネントはこれらのフィールドをサポートしています。

| フォームフラグメント | オブジェクト項目タイプ         |
|:---------- |:------------------- |
| キャプチャ      | 該当なし                |
| チェックボックス   | ブール値                |
| 日付         | 日付                  |
| ファイルアップロード | 添付ファイル              |
| 複数選択のリスト   | 複数のピックリスト           |
| 数値入力       | 整数、長整数、10進数、高精度10進数 |
| リッチテキスト    | リッチテキスト             |
| プルダウン      | リレーションシップ, ピックリスト   |
| 送信ボタン      | 該当なし                |
| テキスト入力     | テキスト、長文             |
| テキスト領域     | テキスト、長文             |

```{tip}
オブジェクトのカテゴリ分けが有効になっている場合、Tags and Categories フォームフラグメントを使用してオブジェクトエントリにメタデータを追加することができます。 
```

## 関連トピック

* [フォームコンポーネント](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/default-fragments-reference.md#form-components)
* [フラグメントの設定](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments.md)
* [フォーム・フラグメント・オプション](../../site-building/creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/general-settings-reference.md#form-fragment-options)
* [フォーム・フラグメントの作成](../../site-building/developer-guide/developing-page-fragments/creating-form-fragments.md)
