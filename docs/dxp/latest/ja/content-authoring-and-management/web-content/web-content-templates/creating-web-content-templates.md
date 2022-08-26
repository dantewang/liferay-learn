# Webコンテンツテンプレートの作成

Webコンテンツテンプレートは、FreeMarkerテンプレート言語（FTL）を使用して、コンテンツフィールドがページにどのようにレンダリングされるかを決定します。 各テンプレートは、Webコンテンツ[ストラクチャー](../web-content-structures/creating-structures.md)に関連付けることも、 [他のテンプレートに埋め込む](./embedding-widgets-in-templates.md#embedding-other-templates) こともできます。

```{important}
FreeMarkerでテンプレートを作成または編集する権限は信頼できるユーザーにのみ付与してください。 Webコンテンツテンプレートのセキュリティについては、 [Assigning Permissions to Web Content Structures and Templates](../web-content-structures/assigning-permissions-to-structures-and-templates.md#security-considerations-for-web-content-templates) をご覧ください。
```

## Webコンテンツテンプレートを作成する方法

1. ［**サイトメニュー**］(![Site Menu](./../../../images/icon-menu.png)) を開き、 ［**コンテンツ］ & ［データ**］ &rarr; ［**Webコンテンツ**］ に移動します。

1. ［**テンプレート**］ タブを選択し、 **追加ボタン**（![Add Template](../../../images/icon-add.png)）をクリックして、新しいWebコンテンツテンプレートを作成します。

1. 新しいテンプレートのタイトルを入力します。

1. オプションで、次の設定可能な [テンプレートプロパティ](#configurable-template-properties) を決定できます。

   ![必要に応じて、 [プロパティ]パネルでテンプレート設定を決定します。](./creating-web-content-templates/images/01.png)

1. スクリプトウィンドウを使用するか、 ［**Choose File**］ をクリックしてインポートする既存の`.ftl`スクリプトファイルを選択することにより、FreeMarkerコードをテンプレートに追加します。

   スクリプトウィンドウに手動でコードを入力すると、左側の［テンプレート］パネルで標準変数にすばやくアクセスできます。 テンプレートにストラクチャーを選択した場合は、その特定のフィールドの変数、および **フレンドリURL** 変数にアクセスすることもできます。

   次に、HTMLまたは追加のFreeMarkerコードをテンプレートのスクリプトに追加できます。

   ![左側の [テンプレート]パネルの標準変数、および選択したストラクチャーに固有の変数にアクセスします。](./creating-web-content-templates/images/02.png)

1. 終了したら [**保存**] をクリックするか、 [**保存して続ける**] をクリックして進行状況を保存し、編集を続行することができます。

   ```{important}
   テンプレートがストラクチャーにリンクされて保存されると、このテンプレートプロパティを変更することはできなくなります。
   ```

   保存すると、DXPはテンプレートのDDMテンプレートキー、URL、およびWebDAV URLを自動的に生成します。これらは、[プロパティ]パネルで表示できます。

   ![DXPは、テンプレートのDDMテンプレートキー、URL、およびWebDAV URLを自動的に生成します。](./creating-web-content-templates/images/03.png)

テンプレートを作成したら、その設定に応じて、リンクされたストラクチャーで作成された[Webコンテンツに使用](../web-content-articles/adding-a-basic-web-content-article.md)したり、 [他のテンプレートに埋め込んだり](./embedding-widgets-in-templates.md#embedding-other-templates) できます。 テンプレートはいつでも編集できます。

```{note}
ストラクチャーの変更には、関連するテンプレートの変更が必要になる場合があります。 たとえば、テンプレートで参照されているストラクチャーフィールド名の名前が変更または削除された場合、テンプレートの参照を手動で更新する必要があります。
```

## 設定可能なテンプレートのプロパティ

テンプレートの作成中に、オプションで[プロパティ]パネルで次のテンプレート設定を決定できます。

* **ストラクチャー** : ［ストラクチャー］フィールドを使用してテンプレートを既存のWeb コンテンツストラクチャーにリンクするか、このフィールドを空白のままにして、他のWebコンテンツテンプレートに埋め込むことができる汎用テンプレートを作成します。

* **説明** : [説明]フィールドを使用して、テンプレートのローカライズされた説明を提供します。

* **キャッシュ可能** : デフォルトでは、新しいテンプレートはキャッシュ可能です。 動的な動作が必要な場合は、このプロパティのチェックを外します（例：[taglibs](./using-taglibs-in-templates.md)、リクエスト処理、CMSクエリAPI）。

* **メイン画像** : URLまたはデバイスからテンプレートのメイン画像を選択します。

## 追加情報

* [ストラクチャーの作成](../web-content-structures/creating-structures.md)
* [基本的なWebコンテンツの記事の追加](../web-content-articles/adding-a-basic-web-content-article.md)
* [テンプレートへのウィジェットの埋め込み](./embedding-widgets-in-templates.md)
