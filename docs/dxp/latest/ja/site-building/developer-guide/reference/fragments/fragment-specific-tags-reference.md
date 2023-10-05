# フラグメント固有のタグと属性のリファレンス

標準的なHTML、CSS、JavaScriptに加え、Liferay固有のタグや、Liferay Portal 7.3 GA3とLiferay DXP 7.3からは属性を使用して、編集可能なセクションを作ったり、ウィジェットをフラグメントに埋め込むことができます。 編集可能な要素は、公開前に変更することができます。つまり、同じフォーマットを持ちながら、特定のコンテキストに適応する要素を含む、シンプルで再利用可能なフラグメントを作成することができます。

```{warning}
フラグメントの中で、編集可能な要素を他の編集可能な要素の中に入れ子にすることはサポートされていません。
```

ページ・フラグメントは、これらの機能を追加するライフレイ固有のタグや属性にアクセスできます：

- [編集可能なテキスト](#making-text-editable)
- [編集可能な画像](#making-images-editable)
- [編集可能なリンク](#creating-editable-links)
- [編集可能な HTML (Liferay Portal 7.3 GA3 以降および DXP 7.3 以降)](#creating-editable-html)
- [埋め込みウィジェット](#including-widgets-within-a-fragment)
- [ローカライズ可能なフラグメントフィールド](#localizing-fragment-configurations)

```{tip}
タグの名前を入力し始めると、[HTML editor](../../developing-page-fragments/using-the-fragments-editor.md)は、編集可能な要素や埋め込み可能なウィジェットのような `lfr` タグの自動補完機能を提供します。
```

ここで提供するテキストまたは画像は、フィールドのデフォルト値です。 ページの最終バージョンに表示したい場合もあれば、ページを公開する前に置き換えるべきフィラーテキストが必要な場合もあるでしょう。

これらすべてが連携して、サイトを構築するための動的で再利用可能な要素を作成するのに役立ちます。 例えば、画像とリンクを含む小さなテキストボックスが必要な場合、編集可能なフィラーテキスト、編集可能な画像用のスペース、適切なフォーマット、編集可能なリンクを含むフラグメントを作成することができます。 そして、そのフラグメントを複数のページに追加し、説明する必要がある商品ごとに画像、テキスト、リンクを定義することができます。

```{warning}
編集可能な要素の ID は一意である必要があります。 ページが追加された後にIDを変更しないでください。 変更後に編集可能なフラグメントのIDを変更すると、変更が失われる可能性があります。
```

ウィジェットを含めることで、フラグメントをよりダイナミックにすることができる。 現在、ウィジェットの埋め込み可能なタイプはポートレットのみですが、他のオプションも計画されています。

![フラグメント・エディターには、フラグメント固有のタグのオートコンプリート機能があります。](./fragment-specific-tags-reference/images/01.png)

このリファレンスでは、編集可能なタグと属性のリストと、それらをフラグメントで使用する方法の例を示します。

```{note}
Liferay Portal 7.3 GA3 および Liferay DXP 7.3 以降は、編集可能な要素を`lfr-editable`タグでラップするのではなく、`data-lfr-editable*`属性を使用して要素を編集可能として定義できます。 古いタグは下位互換性のために引き続き機能しますが、Portal 7.3 GA3 以降または Liferay DXP 7.3 を実行している場合は、より記述しやすい新しいデータ属性を使用することをお勧めします。
```

## テキストを編集可能にする

フラグメント・テキストを編集可能にするには、 `data-lfr-editable-type="text"`。 `data-lfr-editable-id` は、この例のようにユニークなIDでなければならない：

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

`lfr-editable` タグを、 `image` というタイプでフラグメントに追加した後、そのフラグメントをページに追加すると、編集可能な画像をクリックして、コンテンツページエディタのサイドバーから画像ソースやその他のプロパティを設定することができます。

![コンテンツページで画像を定義するには、いくつかのオプションがあります。](./fragment-specific-tags-reference/images/02.png)

ほとんどの画像はこのように処理できますが、編集可能な背景画像を追加するには、背景画像 ID `data-lfr-background-image-id` を設定するプロパティを追加する必要があります。 背景画像IDは、フラグメントのメイン `div` 、編集可能な画像IDと同じに設定されます。

```html
<div data-lfr-background-image-id="background-img-unique-id">
   <h1 data-lfr-editable-id="h1-unique-id" data-lfr-editable-type="text">
      Placeholder
   </h1>
   <p data-lfr-editable-id="p-unique-id" data-lfr-editable-type="text">
      Placeholder
   </p>
</div>
```

コンテンツマッピングは、フラグメント内の編集可能なフィールドと、ウェブコンテンツやブログなどのアセットタイプのフィールドを結び付けます。 例えば、ウェブコンテンツ記事のプレビュー画像を表示するために、画像フィールドをマッピングすることができます。 マッピングフィールドの詳細については、 [Fragment Mapping Settings](../../../creating-pages/page-fragments-and-widgets/using-fragments/configuring-fragments/fragment-sub-elements-reference.md#mapping-settings) を参照してください。

## 編集可能なリンクの作成

`data-lfr-editable-type` を `link`に設定することで、一般的なリンク要素を編集可能にすることができます。 `data-lfr-editable-id` は一意のIDでなければならない。

編集可能なリンク要素は、さまざまな方法で作成できます。 次にいくつかの例を示します。

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

`mailto:` URIスキームを使用して、リンクを電子メールに関連付けます：

```html
<a
  href="mailto:email@liferay.com"
  target="_blank"
  data-lfr-editable-id="link-to-email"
  data-lfr-editable-type="link"
>
  Send a Message
</a>
```

リンクを電話番号に関連付けるには、 `tel:` URIスキームを使用する：

```html
<a
  href="tel:555-2368"
  target="_blank"
  data-lfr-editable-id="link-to-phone"
  data-lfr-editable-type="link"
>
  Who You Gonna Call?
</a>
```

### Liferay Portal 7.3 GA2以下で編集可能なリンクを作成する

Liferay Portal 7.3 GA2 以下では、以下の構文を使用します。

```html
<lfr-editable id="unique-id" type="link">
    <a href="default-target-url-goes-here">Link text goes here</a>
</lfr-editable>
```

コンテンツページエディターのサイドバーから、リンクのタイプ、ターゲットURL、リンクマッピングを編集できます。

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

各ウィジェットには、登録名と対応する `lfr-widget-[name]` タグがあり、フラグメントに埋め込むために使用する必要があります。 例えば、メニュー表示ウィジェットは `nav`として登録されているので、そのタグは `<lfr-widget-nav />`です。 このようにブロックに埋め込むことができる：

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
| RSS パブリッシャー（廃止予定） | `<lfr-widget-rss>`               |
| Iframe            | `<lfr-widget-iframe>`            |

### ウィジェットの埋め込みを有効にする

フラグメントに埋め込みたいカスタムウィジェットがある場合、そのウィジェットを埋め込み可能に設定できます。 ウィジェットを埋め込むには、OSGi コンポーネントである必要があります。 埋め込みたいポートレットクラスの `@Component` アノテーションの中に、次のプロパティを追加します。

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

ページのターゲット言語用にフラグメントの設定をローカライズすることができます。 例えば、ボタンフラグメントでは、ページ言語がen-USの時には1つのボタンタイプを定義し、ページ言語がes-ESの時には異なるボタンタイプを定義することができます。 フラグメント設定フィールドをローカライズするには、 `localizable` 属性を使います。

```{note}
localizable` 属性は、`configurationRole` プロパティが `style` に設定されているフラグメント構成フィールドでは使用できません。 
```

以下のコード抜粋では、ボタンフラグメントのコンフィギュレーションは、 `localizable` 属性を、 `true` `fields` section under `fieldSets`に設定しています。 `ローカライズ可能な` 属性は、フィールドレベルで設定されます。 この例では、 `buttonType` のフィールドが1つだけ存在します。 複数のフィールドを持つフラグメントがある場合、それぞれに `ローカライズ可能な` 属性を設定することが可能です。

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

このサンプルコードを使って、ページのターゲット言語に応じてボタンの種類を変更することができます。 次の例では、 **Contact Us** / **Contacto** ボタン・フラグメントは、 `localizable` 属性を `true` に設定し、 `buttonType` フィールドを設定しています。 この例では、この属性を使って、ページがen-US言語を使っているときは **Primary** ボタンのタイプを設定し（A）、ページがes-ES言語を使っているときは **Outline Primary** タイプを設定しています（B）。

![フラグメント内のローカライズ可能な要素は、Generalタブの下に国旗アイコンを表示し、言語ごとに異なる設定をサポートします。](./fragment-specific-tags-reference/images/04.png)

```{tip}
フラグメントの一般設定の下にある旗のアイコンは、設定フィールドがローカライズ可能であることを示します。 
```

`localizable` 属性で、言語のカスタム設定を指定しないフラグメントは、デフォルトのページ言語設定を使用します。

## 関連トピック

- [フラグメントツールキットコマンドリファレンス](./fragments-toolkit-command-reference.md)
- [ページ フラグメントエディタのインターフェイスリファレンス](./page-fragment-editor-interface-reference.md)
- [フラグメント設定タイプのリファレンス](./fragment-configuration-types-reference.md)
