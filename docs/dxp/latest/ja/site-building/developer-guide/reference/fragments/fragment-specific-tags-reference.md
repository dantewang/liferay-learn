# フラグメント固有のタグと属性のリファレンス

標準的なHTML、CSS、JavaScriptに加え、Liferay特有のタグや、Liferay Portal 7.3 GA3、Liferay DXP 7.3からは属性を使って、編集可能なセクションを作ったり、ウィジェットをフラグメントに埋め込むことができるようになりました。 編集可能な要素は、公開前に修正することができます。つまり、同一のフォーマットを持ちながら、特定のコンテキストに適応する要素を含む、シンプルで再利用可能なフラグメントを作成することができるのです。

```{warning}
編集可能な要素を他の編集可能な要素の中に入れ込むことは、フラグメントの中ではサポートされていません。
```

ページフラグメントは、このような機能を追加するライフレイ固有のタグや属性にアクセスすることができます：

- [編集可能なテキスト](#making-text-editable)
- [編集可能な画像](#making-images-editable)
- [編集可能なリンク](#creating-editable-links)
- [編集可能な HTML (Liferay Portal 7.3 GA3 以降および DXP 7.3 以降)](#creating-editable-html)
- [埋め込みウィジェット](#including-widgets-within-a-fragment)
- [ローカライズ可能なフラグメントフィールド](#localizing-fragment-configurations)

```{tip}
タグの名前を入力し始めると、[HTML editor](../../developing-page-fragments/using-the-fragments-editor.md)は、編集可能な要素や埋め込み可能なウィジェットのような `lfr` タグの自動補完機能を提供します。
```

ここで提供するテキストまたは画像は、フィールドのデフォルト値です。 ページの最終バージョンで表示したい場合や、ページを公開する前に置き換えるべきフィラーテキストが必要な場合があります。

これらすべてが連携して、サイトを構築するための動的で再利用可能な要素を作成するのに役立ちます。 例えば、商品説明のために画像とリンクが付いた小さなテキストボックスが必要な場合、編集可能なフィラーテキスト、編集可能な画像用のスペース、適切なフォーマット、編集可能なリンクを含むフラグメントを作成することができます。 そして、このフラグメントを複数のページに追加し、記述する必要のある商品ごとに画像、テキスト、リンクを定義することができます。

```{warning}
編集可能な要素の ID は一意である必要があります。 ページフラグメントがページに追加された後に、IDを変更しないでください。 編集可能なフラグメントのIDを変更した後に変更すると、変更内容が失われることがあります。
```

ウィジェットを含めることで、フラグメントをよりダイナミックにすることができます。 現在、ウィジェットの埋め込み可能なタイプはポートレットのみですが、他のオプションも計画されています。

![フラグメントエディタは、フラグメント固有のタグのオートコンプリートを提供します。](./fragment-specific-tags-reference/images/01.png)

このリファレンスは、編集可能なタグと属性のリストと、それらをフラグメントで使用する方法の例を示しています。

```{note}
Liferay Portal 7.3 GA3 および Liferay DXP 7.3 以降は、編集可能な要素を`lfr-editable`タグでラップするのではなく、`data-lfr-editable*`属性を使用して要素を編集可能として定義できます。 古いタグは下位互換性のために引き続き機能しますが、Portal 7.3 GA3 以降または Liferay DXP 7.3 を実行している場合は、より記述しやすい新しいデータ属性を使用することをお勧めします。
```

## テキストを編集可能にする

image 要素に `data-lfr-editable-type="text"` 属性を記述することで、フラグメントテキストを編集可能にすることができます。 `data-lfr-editable-id` は、この例のようにユニークな ID である必要があります：

```html
<p data-lfr-editable-id="text1" data-lfr-editable-type="text">
  Placeholder
</p>
```

```{note}
すべてのブロック要素とインライン要素が編集可能なテキストに対応しています。
```

Liferay Portal 7.3 GA2 以下では、以下の構文を使用します。 要素を適切にレンダリングするには、一意の ID が必要です。

```html
<lfr-editable id="unique-id" type="text">
   This is editable text!
</lfr-editable>
```

テキスト スタイルやカラー スタイルなどの書式設定オプションが必要な場合は、`rich-text`を使用します。

```html
<p data-lfr-editable-id="text1" data-lfr-editable-type="rich-text">
  Placeholder
</p>
```

```{note}
すべてのブロック要素タグは、編集可能なリッチ テキストに対応しています。
```

Liferay Portal 7.3 GA2 以下では、以下の構文を使用します。

```html
<lfr-editable id="unique-id" type="rich-text">
   This is editable text that I can make bold or italic!
</lfr-editable>
```

```{note}
HTML 要素内のテキストを編集可能にしたい場合は、`rich-text` タイプを使用する必要があります。 `text`タイプは、レンダリング前にテキストから HTML フォーマットを取り除きます。
```

## 画像を編集可能にする

画像はテキストと同じ `data-lfr-editable-type` 属性を使用しますが、 `image` タイプを使用すると、次のようになります。

```html
<img
  src="placeholder.jpg"
  alt="Placeholder"
  data-lfr-editable-id="img1"
  data-lfr-editable-type="image"
>
```

Liferay Portal 7.3 GA2 以下では、以下の構文を使用します。

```html
<lfr-editable id="unique-id" type="image">
   <img src="...">
</lfr-editable>
```

`lfr-editable` タグに `image` というタイプを追加した後、そのフラグメントをページに追加すると、コンテンツページエディタのサイドバーから、編集可能な画像をクリックして画像ソースなどのプロパティを設定することができます。

![コンテンツページで画像を定義するには、いくつかのオプションがあります。](./fragment-specific-tags-reference/images/02.png)

ほとんどの画像はこのように処理できますが、編集可能な背景画像を追加するには、背景画像 ID `data-lfr-background-image-id` を設定するプロパティを追加する必要があります。 背景画像IDは、フラグメントのメイン `div` に設定され、編集可能な画像IDと同じになります。

```html
<div data-lfr-background-image-id="unique-id">
   <lfr-editable id="unique-id" type="image">
      <img src="...">
   </lfr-editable>
</div>
```

コンテンツマッピングは、フラグメント内の編集可能なフィールドと、ウェブコンテンツやブログなどのアセットタイプのフィールドを結びつけるものです。 例えば、ウェブコンテンツの記事のプレビュー画像を表示するために、画像フィールドをマッピングすることができます。 マッピングフィールドの詳細については、 [Fragment Mapping Settings](../../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) を参照してください。

## 編集可能なリンクの作成

編集可能なリンク要素を作成するための特定の構文もあります。

```html
<a
  href="#placeholder"
  target="_blank"
  data-lfr-editable-id="link1"
  data-lfr-editable-type="link"
>
  Go to placeholder
</a>
```

Liferay Portal 7.3 GA2 以下では、以下の構文を使用します。

```html
<lfr-editable id="unique-id" type="link">
    <a href="default-target-url-goes-here">Link text goes here</a>
</lfr-editable>
```

コンテンツページエディターのサイドバーから、リンクの種類、ターゲットURL、リンクマッピングを編集することができます。

![リンクの外観と動作を定義するためのオプションがいくつかあります。](./fragment-specific-tags-reference/images/03.png)

編集可能なリンクの詳細は、 [Editable Links](../../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#link-settings) を参照してください。

## 編集可能な HTML の作成

`data-lfr-editable-type` 属性を `html` に設定することで、一般的な HTML 要素も編集可能にできます。

```html
<article data-lfr-editable-id="text1" data-lfr-editable-type="html">
  <h1>Placeholder</h1>
</article>
```

Liferay Portal 7.3 GA2 以下では、以下の構文を使用します。

```html
<lfr-editable type="html" id="text1">
  <h1>Placeholder</h1>
</lfr-editable>
```

## フラグメント内にウィジェットを含める

各ウィジェットには、登録名と対応する `lfr-widget-[name]` タグがあり、これを使用してフラグメントに埋め込む必要があります。 例えば、メニュー表示ウィジェットは `nav`として登録されているので、そのタグは `<lfr-widget-nav />`となります。 こんな風にブロックの中に埋め込むことができます：

```html
<div class="nav-widget">
    <lfr-widget-nav>
    </lfr-widget-nav>
</div>
```

埋め込み可能なウィジェットとそれに付随するタグは次のとおりです。

| ウィジェット名           | タグ                                     |
| ----------------- | -------------------------------------- |
| DDL表示             | `<lfr-widget-dynamic-data-list>` |
| フォーム              | `<lfr-widget-form>`              |
| アセットバプリッシャー       | `<lfr-widget-asset-list>`        |
| パンくずリスト           | `<lfr-widget-breadcrumb>`        |
| カテゴリフィルター         | `<lfr-widget-categories-nav>`    |
| Flash             | `<lfr-widget-flash>`             |
| メディアギャラリー         | `<lfr-widget-media-gallery>`     |
| メニュー表示            | `<lfr-widget-nav>`               |
| アンケート             | `<lfr-widget-polls>`             |
| 関連するアセット          | `<lfr-widget-related-assets>`    |
| サイトマップ            | `<lfr-widget-site-map>`          |
| タグクラウド            | `<lfr-widget-tag-cloud>`         |
| タグフィルター           | `<lfr-widget-tags-nav>`          |
| Webコンテンツの表示       | `<lfr-widget-web-content>`       |
| RSS パブリッシャー(廃止予定） | `<lfr-widget-rss>`               |
| Iframe            | `<lfr-widget-iframe>`            |

### ウィジェットの埋め込みを有効にする

フラグメントに埋め込みたいカスタムウィジェットがある場合、そのウィジェットを埋め込み可能なように設定することができます。 ウィジェットを埋め込むには、OSGi コンポーネントである必要があります。 埋め込みたいポートレットクラスの `@Component` アノテーションの中に、次のプロパティを追加します。

```properties
com.liferay.fragment.entry.processor.portlet.alias=app-name
```

ウィジェットをデプロイすると、追加できるようになります。 プロパティで指定する名前は、次のように `lfr-widget` タグに追加する必要があります。

```markup
<lfr-widget-app-name>
</lfr-widget-app-name>
```

```{note}
W3C HTML 標準によると、カスタム要素は自己終了できません。 したがって、開始と終了 `<lfr-widget...>`のタグの間に何かを追加することはできませんが、タグに自己終了表記を使用することはできません。
```

## フラグメント設定のローカライズ

> 対応可能：Liferay DXP/Portal 7.4以降

ページのターゲット言語に合わせてフラグメント構成をローカライズすることができます。 例えば、ボタンフラグメントでは、ページ言語がen-USの場合は1つのボタンタイプ、es-ESの場合は別のボタンタイプを定義することができます。 フラグメント構成フィールドをローカライズするには、 `localizable` 属性を使用します。

```{note}
localizable`属性は、`configurationRole`プロパティが`style`に設定されているフラグメント設定フィールドでは使用できません。 
```

次のコードでは、ボタンの構成は、 `localizable` 属性を `true` `fields` section under `fieldSets`に設定します。 `ローカライズ可能な` 属性は、フィールドレベルで設定されます。 この例では、 `buttonType` のフィールドが1つだけ存在します。 複数のフィールドを持つフラグメントがある場合、それぞれに `ローカライズ可能な` 属性を設定することが可能です。

```markup
"fieldSets": [
  {
    "fields": [
      {
        "dataType": "string",
        "defaultValue": "primary",
        "label": "type",
        "name": "buttonType",
        "type": "select",
        "localizable": true,
        "typeOptions": {
          "validValues": [
            {
              "value": "primary"
            },
            {
              "value": "secondary"
            },
            {
              "value": "link"
            },
            {
              "value": "outline-primary"
            },
            {
              "value": "outline-secondary"
            }
          ]
        }
      }
    ]
  }
```

このサンプルコードを使用すると、ページのターゲット言語に応じてボタンの種類を変更することができます。 次の例では、 **Contact Us** / **Contacto** ボタンフラグメントは、 `localizable` 属性を `true` に設定し、 `buttonType` フィールドに設定しています。 この例では、この属性を使って、ページが en-US 言語を使用している場合は **Primary** ボタンタイプ、ページが es-ES 言語を使用している場合は **Outline Primary** タイプを設定します(B）。

![フラグメント内のローカライズ可能な要素は、「一般」タブに旗のアイコンが表示され、言語ごとに異なる設定に対応しています。](./fragment-specific-tags-reference/images/04.png)

```{tip}
フラグメントの一般設定にある旗のアイコンは、設定フィールドがローカライズ可能であることを示します。 
```

`localizable` 属性を持つフラグメントで、言語のカスタム設定を指定しない場合は、デフォルトのページ言語の設定を使用します。

## 関連トピック

- [フラグメントツールキットコマンドリファレンス](./fragments-toolkit-command-reference.md)
- [ページ フラグメントエディタのインターフェイスリファレンス](./page-fragment-editor-interface-reference.md)
- [フラグメント設定タイプのリファレンス](./fragment-configuration-types-reference.md)
