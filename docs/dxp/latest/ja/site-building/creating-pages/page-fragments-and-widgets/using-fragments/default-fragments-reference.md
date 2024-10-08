# デフォルトのフラグメントリファレンス

Liferayはすぐに使える様々なフラグメントを提供するので、すぐにソリューションの構築を始めることができます。 利用可能なフラグメントを表示するには、コンテンツページまたはページテンプレートの編集を開始してください。 編集中に、編集サイドバーメニューの **フラグメントとウィジェット** タブ( ![フラグメントとウィジェット](../../../../images/icon-plus.png))を開きます。

フラグメントは、次のセットに編成されています。

- [デフォルト・フラグメント リファレンス](#default-fragments-reference) 
  - [レイアウト要素](#layout-elements) 
  - [基本コンポーネント](#basic-components) 
  - [フォーム・コンポーネント](#form-components) 
  - [コンテンツ表示](#content-display) 
  - [アカウント](#account) 
  - [カート](#cart) 
  - [注目コンテンツ](#featured-content) 
    - [バナー](#banners) 
    - [特徴](#features) 
    - [ハイライト](#highlights) 
  - [フッター](#footers) 
  - [ナビゲーション・バー](#navigation-bars) 
  - [メニュー表示](#menu-display) 

```{note}
利用可能な設定オプションは、フラグメントとフラグメントのサブエレメントによって異なる。 詳しくは [フラグメントの設定](./configuring-fragments.md) を参照。
```

## レイアウト要素

{bdg-secondary}`For Liferay 7.3+`

レイアウト要素は、ページやテンプレートのレイアウトをデザインするためのドロップゾーンを定義します。 デフォルトでは、Liferayには2つのレイアウト要素があります： **Container** と **Grid** です。

| フラグメント         | 説明                                                     |
| :------------- | :----------------------------------------------------- |
| コンテナ（以前は **パネル**） | 構成可能なドロップゾーンを追加します。                                    |
| グリッド（以前は **行**）   | 複数のドロップゾーンモジュールを追加します。 これらのモジュールは、垂直または水平に構成および配置できます。 |

## 基本コンポーネント

これらは、ページに基本的な機能を追加するシンプルなデザイン要素です。 例としては、ボタン、見出し、タブなどがあります。 これらのコンポーネントを使って、あなたのページを少しずつ構築していくことができる。 DXPには以下の基本コンポーネントが含まれる。

| フラグメント                        | 説明                                                                                                                                                                                                                                                                                     |
| :---------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ボタン                           | [リンク要素](./configuring-fragments/fragment-sub-elements-reference.md) を追加する。 リンクまたはアクションタイプで、5つの異なるボタンスタイルを適用できます：プライマリ、セカンダリ、リンク、プライマリ・アウトライン、セカンダリ・アウトラインです。                                                                                                                 |
| カード                           | [画像](./configuring-fragments/fragment-sub-elements-reference.md) 、 [リッチテキスト](./configuring-fragments/fragment-sub-elements-reference.md) 、 [リンク](./configuring-fragments/fragment-sub-elements-reference.md) 要素をディスプレイカードとして配置したものを追加する。                |
| 日付                            | カスタム日付フィールドにマッピングできるフィールドを追加します。                                                                                                                                                                                                                                                       |
| ドロップダウン {bdg-secondary}`7.4+` | [シンプルなテキスト要素](./configuring-fragments/fragment-sub-elements-reference.md) とドロップゾーンを追加します。 他のフラグメントやウィジェットをドロップゾーンにドラッグ＆ドロップして、高度なドロップダウンメニューを作成できます。                                                                                                                        |
| 外部ビデオ {bdg-secondary}`7.4+`   | 外部の動画をページやテンプレートに埋め込みます。 対応するビデオソースは、YouTube、Facebook、Twitch、Vimeo、およびドキュメントとメディアに保存されているビデオです。 詳しくは [Liferayアセットとページに動画を埋め込む](../../../../content-authoring-and-management/documents-and-media/videos/embedding-videos-into-liferay-assets-and-pages.md) をご覧ください。          |
| HTML                          | 編集可能な [HTML 要素](./configuring-fragments/fragment-sub-elements-reference.md) を追加します。 要素をダブルクリックすると、HTML構文を使用してコンテンツを編集できるモーダルウィンドウが開きます。                                                                                                                                      |
| 見出し                           | H1-H6 見出しレベルを使用するように設定できる [単純テキスト要素](./configuring-fragments/fragment-sub-elements-reference.md) を追加します。                                                                                                                                                                    |
| 画像                            | 設定可能な [画像要素](./configuring-fragments/fragment-sub-elements-reference.md) を追加します。 構成するときは、画像の元のサイズを使用するか、コンテキストに合わせて調整するかを決定します。                                                                                                                                              |
| パラグラフ                         | [リッチテキスト要素](./configuring-fragments/fragment-sub-elements-reference.md) を追加します。 編集するときは、フラグメントのテキストを強調表示して、追加のフォーマットオプションにアクセスします。                                                                                                                                           |
| セパレーター（区切り文字)                 | ページ要素間に水平線を追加します。 その間隔と色を構成できます。                                                                                                                                                                                                                                                       |
| スライダー                         | スライドにグループ化された複数の [画像](./configuring-fragments/fragment-sub-elements-reference.md) と [リッチテキスト](./configuring-fragments/fragment-sub-elements-reference.md) オーバーレイを追加します。 ユーザーは各スライドを手動で切り替えることができます。                                                              |
| ソーシャル                         | [、Facebook、Twitter、LinkedInのアイコンが付いた画像要素](./configuring-fragments/fragment-sub-elements-reference.md) 、各プラットフォームのページにリンクできます。                                                                                                                                               |
| スペーサー                         | ページの断片の間に水平方向の空白を追加する。 その高さを設定できます。                                                                                                                                                                                                                                                    |
| タブ                            | [、シンプルなテキスト要素](./configuring-fragments/fragment-sub-elements-reference.md) 、ウィジェットやその他のフラグメントを追加するための個別のドロップゾーンを備えた複数のタブを追加します。                                                                                                                                             |
| ビデオのURL（以前は **ビデオ・フラグメント**）。     | YouTubeやDocuments and Mediaの動画をページやテンプレートに埋め込みます。 ビデオの自動再生、ループ、ミュート、コントロールの非表示を設定できます。 エンドユーザーからビデオコントロールを非表示にすることもできます。 詳しくは [動画の埋め込み](../../../../content-authoring-and-management/documents-and-media/videos/embedding-videos-into-liferay-assets-and-pages.md) をご覧ください。 |

## フォームコンポーネント

{bdg-secondary}`For Liferay 7.4 U45+/GA45+`

フォームコンポーネントのフラグメントを使用して、コンテンツページにフォームを作成します。 これらのフラグメントはカスタム・オブジェクトのみをサポートする。 これらを有効にしてアクセスするには、少なくとも1つの公開オブジェクトが必要です。 詳しくは [フラグメントでフォームを構築する](../../../../building-applications/objects/using-fragments-to-build-forms.md) を参照してください。

| フラグメント     | 説明                                                                                                                                                                                                                                                            |
| :--------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| フォームコンテナー  | コンテンツページにフォームを作成するためのコンテナを追加します。 追加したら、コンテナをカスタム・オブジェクトにマッピングする必要があります。 コンテナは、オブジェクトの各フィールドのフォームフラグメントを自動的に生成する。 コンテナからフラグメントを追加または削除したり、フォーム送信の成功メッセージをカスタム設定したりできます。 マッピングされたフォーム・コンテナには、他のフォーム・コンポーネントを配置することしかできません。                                      |
| キャプチャ      | フォームコンテナに CAPTCHA 確認を追加します。 一度追加されたフォームコンテナは、送信時に人間による確認を必要とします。                                                                                                                                                                                              |
| チェックボックス   | フォームコンテナにチェックボックスを追加し、ブーリアン・フィールドにマッピングできるようにします。                                                                                                                                                                                                             |
| 日付         | カスタム日付フィールドにマッピングできるフィールドを追加します。                                                                                                                                                                                                                              |
| ファイルアップロード | [添付ファイルフィールド](../../../../building-applications/objects/creating-and-managing-objects/fields/attachment-fields.md#attachment-fields) にマッピングできるファイルアップロードボタンを追加します。 マップされた添付ファイルフィールドは、ファイルのアップロード方法を決定します。 デフォルトでは、このフラグメントはサポートされているファイル拡張子を表示します。 |
| 複数選択のリスト   | マルチセレクト・ピックリストにマッピングできるフィールドを追加します。                                                                                                                                                                                                                           |
| 数値入力       | カスタム数値フィールド（integer、long integer、decimal、precision decimalなど）にマッピングできるフィールドを追加します。 プレースホルダーの値とヘルプテキストを設定できます。                                                                                                                                                 |
| リッチテキスト入力  | リッチ・テキスト・フィールドにマッピングできるフィールドを追加します。                                                                                                                                                                                                                           |
| プルダウン      | カスタム・ピックリストおよびリレーションシップ・フィールドにマップできるドロップダウンメニューを追加します。 マッピングされたフィールドに10個以上のオプションが含まれている場合、ユーザーはドロップダウンメニューでオプションを検索することができます。                                                                                                                                 |
| 送信ボタン      | フォーム入力を送信するためのボタンを追加します。 すべてのフォーム・コンテナには送信ボタンが必要です。                                                                                                                                                                                                           |
| テキスト入力     | テキスト・フィールド（テキスト、ロング・テキストなど）にマッピングできるフィールドを追加する。                                                                                                                                                                                                               |
| テキスト領域     | 長いテキストフィールドにマッピングできるフィールドを追加します。                                                                                                                                                                                                                              |
| タグ         | 現在のサイトまたはグローバルサイトのタグをオブジェクトエントリーに追加するフィールドを追加します。                                                                                                                                                                                                             |
| カテゴリー      | 現在のサイトまたはグローバルサイトのカテゴリーをオブジェクトエントリーに追加するフィールドを追加します。                                                                                                                                                                                                          |

## コンテンツの表示

{bdg-secondary}`liferay 7.3+用`。

コンテンツ表示フラグメントを使用して、サイトのコンテンツを個別に、またはコレクションの一部として表示します。 ページコンテンツを評価またはフラグ付けするためのページ要素を追加することもできます。 DXPには以下のコンテンツ表示用フラグメントが含まれる：

| フラグメント                  | 説明                                                                                                                                                                                                                                                                |
| :---------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| コレクション表示                | 手動および動的に定義されたコレクションと、コレクションプロバイダによって定義されたコレクションを表示します。 コレクションをグリッドで表示するか、リストテンプレート（すなわち、ボーダー、箇条書き、インライン、番号付き、スタイルなし）で表示するかを設定できます。 詳しくは [コレクションの表示](../../../displaying-content/collections-and-collection-pages/displaying-collections.md) を参照してください。 |
| コンテンツの表示                | ドキュメントやメディア、ウェブコンテンツ、ブログ、カテゴリーから1つのコンテンツを表示します。 使用可能な構成オプションは、選択したコンテンツの種類によって異なります。                                                                                                                                                                              |
| 適用されたフィルター（7.4以降で利用可能）  | コレクション表示に適用されるフィルタを表示および管理するための要素を追加します。                                                                                                                                                                                                                          |
| コンテンツのフラグ               | コンテンツ項目にフラグを立てるための要素を追加します。                                                                                                                                                                                                                                       |
| コレクションフィルター（7.4以降で利用可能） | 語彙またはカテゴリを使用してコレクション表示をフィルタリングするための要素を追加します。                                                                                                                                                                                                                      |
| コンテンツの評価                | コンテンツ項目を評価するための要素を追加します。                                                                                                                                                                                                                                          |

!!! note
    コレクション表示フラグメントで使用されるコレクション・フィルタ・フラグメントは、オブジェクト・コレクション・プロバイダまたはブループリント・コレクション・プロバイダにマッピングされている場合にのみ機能します。

<!--| Knowledge Base Article Navigation (Available 7.4 U_+/GA_+) | I moved this comment because it was breaking the admonition. It was on top of it originally. |-->

## アカウント

{bdg-secondary}`liferay DXP 7.4 U72+/GA72+`.

アカウントセレクターフラグメントを使用すると、商品の閲覧や注文の作成時にアカウントを簡単に切り替えることができます。 詳しくは [アカウント・セレクタ・フラグメントの使用](https://learn.liferay.com/w/commerce/creating-store-content/liferay-commerce-fragments/using-the-account-selector-fragment) を参照のこと。

## カート

{bdg-secondary}`liferay DXP 7.4 U69+/GA69+`.

ミニカートの断片を使用して、カートの詳細な概要を取得します。 商品の数量を調整したり、商品を削除したり、チェックアウトプロセスを開始したり、簡単に商品を検索してカートに追加したりすることができます。 詳しくは [ミニカートフラグメントの使用](https://learn.liferay.com/w/commerce/creating-store-content/liferay-commerce-fragments/using-the-mini-cart-fragment) をご覧ください。

## 主なコンテンツ

フィーチャー・コンテンツ・フラグメントは、複数のコンポーネントから構成される複雑なページ要素です。 フラグメントのレイアウトをプレビューするには、Fragments and Widgetsパネルで **Card View**( ![Card View](../../../../images/icon-cards2.png) )に切り替えます。 Liferayには次のような特徴的なコンテンツフラグメントがあります。

```{note}
Liferay DXP/Portal 7.3では、各フラグメントの*Information*アイコン(![Information](../../../../images/icon-information.png))にカーソルを合わせるとレイアウトをプレビューできます。
```

### バナー

バナーフラグメントを使用して、コンテンツページにテキストとリンク要素を追加し、CTA（Call to Action）バナーを作成します。 DXPには、次のレイアウトが含まれています。

![Add text and link elements to a content page for creating call to action banners.](./default-fragments-reference/images/01.png)

### 機能

featuresフラグメントを使用して、テキスト、画像、リンク要素をコンテンツページに追加し、主要な機能を宣伝します。 Liferayは以下のレイアウトを提供します。

![Add text, image, and link elements to a content page for promoting key features](./default-fragments-reference/images/02.png)

### ハイライト

highlightsフラグメントを使用して、ハイライト用の画像、テキスト、リンク要素をコンテンツページに追加します。 Liferayは以下のレイアウトを提供します。

![Add image, text, and link elements to a content page for highlighting.](./default-fragments-reference/images/03.png)

## フッタ

{bdg-secondary}`Liferay 7.3+`

[マスターページテンプレート](../../defining-headers-and-footers/master-page-templates.md) にカスタムフッターを追加するには、フッターフラグメントを使用します。 各フッターには、ナビゲーションメニュー、サインインリンク、画像要素、著作権テキストが含まれています。 Liferayはフッターフラグメントに以下のレイアウトを提供します：

![Add a custom footer to master page templates for content page.](./default-fragments-reference/images/04.png)

## ナビゲーションバー

{bdg-secondary}`liferay 7.3+`

[マスターページテンプレート](../../defining-headers-and-footers/master-page-templates.md) にカスタムヘッダーを追加するには、ナビゲーションバーフラグメントを使用します。 各ナビゲーションバーには、ナビゲーションメニュー、サインインリンク、およびロゴの画像要素が含まれています。 Liferayはナビゲーションバーのフラグメントに以下のレイアウトを提供します：

![Add a custom header to master page templates for content page.](./default-fragments-reference/images/05.png)

## メニュー表示

{bdg-secondary}`liferay 7.4+`

メニュー表示フラグメントを使用すると、コンテンツページにメニューを追加することができます。 展開後は、事前に定義された [ナビゲーションメニュー](../../../site-navigation/using-the-navigation-menus-application.md) から選択することができます。 サイトナビゲーションのメニュー表示フラグメントの設定方法については、 [メニュー表示の設定](../../../site-navigation/configuring-menu-displays.md) のメニュー表示ウィジェットの設定を参照してください。

また、 [ナビゲーションメニューセレクタ設定](../../../developer-guide/reference/fragments/fragment-configuration-types-reference.md#navigation-menu-selector-configuration) を使って、特定のマークアップと希望する動作を持つカスタムメニュー表示フラグメントを作成することもできます。

<!--## Product-->

<!-- {bdg-secondary}`Liferay 7.4 U_+/GA_+` -->

<!--
| Since this was a recent implementation, Commerce team will explain how to properly use these fragments. This will be documented in the Commerce section, and we'll link it to this article.
-->

## 関連トピック

[コンテンツページの使用](../../using-content-pages.md)

[コンテンツページエディタUIリファレンス](../../using-content-pages/content-page-editor-ui-reference.md)

[フラグメントの使用](../using-fragments.md)
