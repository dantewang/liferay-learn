---
toc:
  - ./semantic-search/setting-up-a-text-embedding-provider.md
  - ./semantic-search/creating-a-search-blueprint-for-semantic-search.md
---
# セマンティック検索

{bdg-secondary}`7.4 U70+`
{bdg-link-primary}`[ベータ版特集](../../../system-administration/configuring-liferay/feature-flags.md)`

```{toctree}
:maxdepth: 1

./semantic-search/setting-up-a-text-embedding-provider.md
./semantic-search/creating-a-search-blueprint-for-semantic-search.md
```

セマンティック検索は、検索されたフレーズの背後にある意図を評価する。 一方、 **keyword** 検索は、検索されたフレーズをインデックスされたテキストフィールドにマッチさせるもので、意味に基づいてマッチさせることはできない。

| 検索フレーズ     | インデックス・コンテンツ                       | マッチタイプ                               |
| :--------- | :--------------------------------- | :----------------------------------- |
| テクノロジー最新情報 | Liferayが7.3の検索エクスペリエンスをリリース        | セマンティック &#10004;<br />キーワード &#10008; |
| ニューリリース    | Liferay Search Experiencesに新機能リリース | セマンティック &#10004;<br />キーワード &#10004; |

Liferayのような（Elasticsearchを使った）洗練されたキーワード検索でさえ、以下のような独創的なテクニックを使っても、インデックス化された文書とユーザーの意図を一致させることはできない。

- 解析でキーワードと文書フィールドをトークン化する。
- 不正確なマッチングを可能にするために、ファジーさとスロッピングがある。
- 同義語のマッチングを可能にするために、単語を語根に分解するステミング。
- 些細な言葉を無視するために、言葉を止める。

トークン化されたキーワードと文書フィールドによる検索は、多くの検索ニーズにとって十分である。 検索エクスペリエンスにさらなるものを求めるのであれば、セマンティック検索は、キーワード検索が達成できることと、ユーザーが検索に本当に求めていることとのギャップを大きく縮めます。

![Natural language search phrases are processed by semantic search systems.](./semantic-search/images/03.png)

セマンティック検索は、追加のコンテンツ処理パイプラインを可能にする。 有効にすると、プラットフォームはテキスト埋め込みと呼ばれる入力テキストのベクトル表現を生成し、Elasticsearchのインデックスドキュメントに格納する。 検索時には、ユーザーによって入力された検索キーワードは、同じベクトル化と埋め込みプロセスを経て、ユーザーにとってより意味のある関連検索結果を提供する類似検索を行うことが可能になる。 すべてのコンテンツタイプがテキスト埋め込みをサポートしているわけではありません：

| 対応コンテンツ・タイプ   | デフォルト設定で有効? |
| :------------ | :---------- |
| ブログのエントリ      | &#10004;    |
| ナレッジベースの記事    | &#10004;    |
| 掲示板のメッセージ     | &#10008;    |
| ウェブコンテンツの基本記事 | &#10004;    |
| Wikiページ       | &#10004;   |

```{important}
効果的なセマンティック検索ソリューションには、データ・ドメイン用にトレーニングされたモデルが必要です。 最も簡単なアプローチは、適切な訓練済みモデルを見つけ、それをデータに合わせて微調整することだ。 ここで示した例は、本番用のセマンティック検索ソリューションではない。
```

## セマンティック検索を可能にする

Liferay でセマンティック検索を有効にする、

1. グローバルメニュー( [グローバルメニュー](../../../images/icon-applications-menu.png) )を開き、 **コントロールパネル** &rarr; **インスタンス設定** をクリックします。
1. **Platform** &rarr; **Feature Flags** セクションを開く。
1. ベータの項目で、セマンティック検索を有効にする。

![Semantic search is a beta feature and must be enabled in Instance Settings.](./semantic-search/images/02.png)

[ポータル・プロパティ](../../../installation-and-upgrades/reference/portal-properties.md) を使ってセマンティック検索を有効にするには、`portal-ext.properties` にこれを追加してください：

```properties
feature.flag.LPS-122920=true
```

[環境変数](../../../installation-and-upgrades/installing-liferay/using-liferay-docker-images/configuring-containers.md#using-liferay-env-variables) を使ってセマンティック検索を有効にするには、設定に次のように追加します：

```properties
LIFERAY_FEATURE_PERIOD_FLAG_PERIOD__UPPERCASEL__UPPERCASEP__UPPERCASES__MINUS__NUMBER1__NUMBER2__NUMBER2__NUMBER9__NUMBER2__NUMBER0_=true
```

セマンティック検索を設定するには

1. [モデルを選ぶか、自分で作る。](#choosing-a-model)
1. [テキスト埋め込みプロバイダーを有効にし、Liferayで設定します。](./semantic-search/setting-up-a-text-embedding-provider.md)
1. [テキスト埋め込みにインデックスを付ける。](#indexing-the-text-embeddings)
1. [ベクトル化された検索語と文書間の類似性検索を実行する検索ブループリントを作成する。](./semantic-search/creating-a-search-blueprint-for-semantic-search.md)

### モデルの選択

[適切に訓練されたモデル](https://www.sbert.net/docs/pretrained_models.html) が最も重要である：インデックスのデータは、選択したモデルに適切でなければならない。 事前に訓練されたモデルで作業するのは便利だが、本番で使用する前にデータに合わせて微調整する必要があるかもしれない。 ロバスト・テストによってのみ、選択したモデルが適切であることを知ることができる。

例えば、ユーザーが「スケートはどのように動くのか」と検索した場合、海洋生物学について訓練されたモデルと、レクリエーションについて訓練されたモデルでは、結果が異なるだろう。

[Hugging Face モデルハブ](https://huggingface.co/models) は、事前に訓練された、ドメイン固有のモデルの大規模なコレクションを提供します。

### テキスト埋め込みにインデックスを付ける

テキスト埋め込みは、以下の場合にインデックス化されなければならない。

1. 初めてセマンティック検索が可能に。
1. セマンティック検索の設定で、テキスト埋め込みプロバイダー、モデル、ベクトル次元、テキスト切り捨て戦略を変更する。

テキスト埋め込みにインデックスを付けるには、「インデックスアクション」画面を使用し、セマンティック検索システムまたはインスタンス設定の「アセットエントリクラス名」設定で有効にしているモデルタイプだけに **Reindex** ボタンをクリックします。

## セマンティック検索の設定

[テキスト埋め込みプロバイダーの設定](./semantic-search/setting-up-a-text-embedding-provider.md) 以外にも、セマンティック検索のための追加設定オプションが用意されている。 コントロールパネル &rarr; インスタンス設定 &rarr; セマンティック検索をご覧ください。

テキスト埋め込みプロバイダの設定については、 [セマンティック検索を有効にする](#enabling-semantic-search) で説明しています。

インデックスの設定には以下のものがある：

**Max Character Count:** テキスト埋め込みプロバイダーに送信する最大文字数を設定します。デフォルトでは、最大500文字がベクトル表現に変換されるために送信されます。ここでの理想的な値は、使用している[テキスト埋め込みプロバイダ](./semantic-search/setting-up-a-text-embedding-provider.md)に依存します。

**テキスト切り捨て戦略：** テキストの先頭（デフォルト）、中間、または末尾のいずれから変換前のサンプルを抽出するかを選択します。 この設定は、ソース・テキストが最大文字数より長い場合にのみ適用されます。 ストラテジーと最大文字数に応じて、タイトル/件名とコンテンツ/本文の一部をテキスト埋め込みに使用することができます。

**Types:** 変換するコンテンツタイプを選択します。デフォルトでは、Blogs Entry、Knowledge Base Article、Web Content Article、Wiki Page の 4 つのタイプが処理されます。掲示板 必要に応じて、メッセージエンティティを設定できます。

```{note}
現在、基本的なウェブコンテンツ記事のみがサポートされています。
```

**言語:** 変換する言語とローカライズを選択します。 デフォルトでは、リストされたすべての言語が選択されています。 リストから複数の言語を選択するには、 **Ctrl + クリックします** 。

```{warning}
言語を有効にしても、その言語用の文埋め込みが作成される保証はありません。 サイト内で使用可能な言語でなければならない。 システム/インスタンス設定で言語が有効になっており、サイト内で利用可能であるにもかかわらず、指定されたコンテンツに翻訳がない場合、デフォルトの翻訳がテキスト埋め込みを作成するために使用されます。
```

**テキスト埋め込みキャッシュタイムアウト:** 変換された検索キーワードのキャッシュタイムアウトをミリ秒単位で設定します。 キャッシュがタイムアウト内にある場合、Liferayはテキスト埋め込みプロバイダからキーワードのテキスト埋め込みを要求しません。 デフォルトでは、タイムアウトは604800ミリ秒（約10分）である。

## Liferayのセマンティック検索を理解する

Liferayのセマンティック検索は

1. 完全なセマンティック検索では、通常のインデクサーは検索ブループリントで無効にされ、テキスト埋め込みのみが関連するコンテンツを検索するために使用されます。

1. ハイブリッド・セマンティック検索では、まずキーワード検索が実行され、テキスト埋め込みが結果の再スコアに使用される。

セマンティック検索とその複雑さをしっかりと理解することは、この簡単な説明の範囲を超えている。 ここでは、Liferayハイブリッドセマンティックサーチの実装がどのように機能するのか、セマンティックサーチの基本的な概念をいくつか説明します。

セマンティック検索はインデックス時と検索時の両方でLiferayの検索に影響を与え、追加レベルのコンテンツ処理を導入します。

### インデックス作成段階でのセマンティック検索

* まず、通常のコンテンツ処理が行われる：
  * [LIFERAY] Liferayのコンテンツは検索エンジンに送られ、そこでデータ型に従って処理されます：テキストは適切に分析され、インデックスに保存されます。
* [LIFERAY] 追加の意味検索処理が行われる：
  * System/Instance Settingsの設定に従って、テキストスニペットがLiferayからテキスト埋め込みプロバイダに送信されます。
    * 最大文字数とテキスト切り捨て戦略は、テキスト埋め込みプロバイダーに送信されるスニペットを決定します。
    * LiferayはBlogs Entries、Knowledge Base Articles、Wiki Pages、Basic Web Content Articlesのタイトルとコンテンツを選択します。 メッセージ・ボードのメッセージでは、件名と本文のフィールドが処理されます。
 * [TEXT EMBEDDING PROVIDER] まず最初に、設定されたモデルに従ってスニペットが処理され、パラメータに従ってスニペットをトークン化する。 よく使用される BERT モデルでは、512 がモデルが扱うトークンの最大数である。 これは、システム/インスタンス設定のセマンティック検索 &rarr; 最大文字数設定で設定された文字数に影響されます。
* [TEXT EMBEDDING PROVIDER] テキスト埋め込みと呼ばれるソースのベクトル表現は、変換器が使用するモデルに基づいて作成されます。
  * [LIFERAY]を参照してください。テキスト埋め込み処理の結果は、 [Liferay Company Index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) 、各ドキュメント[^1]の [dense_vector](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/dense-vector.html) ]フィールドとして保存されます。
  * System/Instance Settingsの設定に従って、テキストスニペットがテキスト埋め込みプロバイダに送られ、テキスト埋め込みが行われ、トランスフォーマが使用するモデルに基づいてベクトル表現が作成される。 テキスト埋め込み処理の結果は、 [Liferay Company Index](../../search-administration-and-tuning/elasticsearch-indexes-reference.md) に、 [dense_vector](https://www.elastic.co/guide/en/elasticsearch/reference/8.8/dense-vector.html) フィールドとしてドキュメントごとに格納されます[^1]。

[^1]:ドキュメント内のフィールドを検査するには、 [Display Results in Document Form](../../search-pages-and-widgets/search-results/configuring-the-search-results-widget.md) 設定、または [Search Blueprints preview](./search-blueprints/creating-and-managing-search-blueprints.md#testing-a-blueprint-with-the-preview-sidebar) 機能を使用します。

### 検索段階での意味検索

* 通常のキーワードマッチングが行われる：
  * 検索バーウィジェットに入力された検索フレーズは、Liferayの検索フレームワークによって受信され、分析と追加処理のために検索エンジンに送られ、検索エンジン内の既存のインデックス文書とマッチングされ、関連性がスコアリングされ、追加処理（ハイライト、要約、許可のための追加フィルタリングの実行など）のためにLiferayに返されます。
* 追加の意味検索処理が行われる：
  * 検索フレーズはテキスト埋め込みプロバイダーに送られ、ベクトル表現が作成される（ [テキスト埋め込み](https://neuml.github.io/txtai/embeddings/) ）。 キーワード検索の関連性によってスコアリングされた検索結果をレンダリングする前に、ウィンドウの制限設定内でキャプチャされた結果は、検索フレーズのベクトル表現をインデックス文書のベクトル表現と比較することによって再スコアリングされる。 新たなスコアが計算され、その結果が検索ページに返される。 詳しくはElasticの [ベクターサーチとは](https://www.elastic.co/what-is/vector-search) をご覧ください。
