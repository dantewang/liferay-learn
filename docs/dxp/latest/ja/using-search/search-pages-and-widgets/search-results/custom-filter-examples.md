# カスタムフィルターの例

```{note}
この機能は[Elasticsearchでのみ](../../installing-and-upgrading-a-search-engine/solr/solr-limitations.md) 機能します.
```

カスタムフィルターウィジェットは、検索チューニングを強力にサポートします。 カスタムコードを導入することなく、検索エンジンに送信されるクエリをコントロールすることができます。 ここでは、カスタムフィルターウィジェットへのアプローチ方法を理解するために、いくつかの一般的な使用例を紹介します。

- [検索結果からコンテンツを除外する](#excluding-certain-content)
- [検索結果のコンテンツを増やす](#boosting-fields)
- [複数のサイトIDによる絞り込み](#filtering-by-site-id)
- [Elasticsearchのクエリストリングクエリを使う](#complex-filter-with-query-string)
- [ネストしたフィールドへのブーストマッチ](#boosting-matches-to-nested-fields)

カスタムフィルターウィジェットの詳細な説明については、 [フィルター検索結果](./filtering-search-results.md) を参照してください。

## 一部のコンテンツを除く

カスタムフィルタは、 `must_not` Occur の設定と一緒に使用すると、検索結果からドキュメントをキャッチして除外することができます。

### 一部のドキュメントおよびメディアコンテンツを除く

場合によっては、特定のタイプのコンテンツを検索結果に表示させないようにしたいことがあります。 Webコンテンツに追加するシステムにしか存在しないドキュメントやメディアファイルのエントリを除外するには、まず、除外する特定のファイルを、検索インデックスで識別できるように区別する必要があります。 目的を明示したタグ（`wconly` など）を付けたり、専用の [ドキュメントとメディアフォルダ](./../../../content-authoring-and-management/documents-and-media/uploading-and-managing/using-folders.md)に入れたりすることができます。 カスタムフィルタでドキュメントとメディアフォルダを除外するには、以下の設定を行います。

**フィルタクエリタイプ:** `Match`

**フィルタフィールド:** `folderId`

**フィルタ値:** `41103`

**発生:** `must_not`

この構成により、値`41103`の`folderId`フィールドを含む検索ドキュメントが検索結果に返されないようになります。

### 特定の拡張子を持つコンテンツの除外

おそらく、GIFファイルを検索結果から除外しなければなりません。 カスタムフィルターを以下のように設定します。

**フィルタクエリタイプ:** `Match`

**フィルタフィールド:** `extension`

**フィルタ値:** `gif`

**発生:** `gif`

この構成は、ドキュメントとメディア [`DLFileEntry`モデル](https://github.com/liferay/liferay-portal/blob/[$LIFERAY_LEARN_PORTAL_GIT_TAG$]/modules/apps/document-library/document-library-service/src/main/java/com/liferay/document/library/internal/search/spi/model/index/contributor/DLFileEntryModelDocumentContributor.java) からインデックス付けされた`extension`フィールドの存在を利用します。 これにより、値`gif`の`extention`フィールドを含む検索文書が検索結果に返されないようになります。

## ブーストフィールド

特定のフィールドに基づいて特定のドキュメントを強化したいというニーズはよくありますが、「カスタムフィルタ」ウィジェットを使えば、簡単に実現できます。 ブースト値は、お客様のニーズに合わせてチューニングが必要な場合があります。 **スコアの説明を有効にする** を有効にして 検索インサイト ウィジェットを使用し、ドキュメントがどのようにスコアリングされているかを調べ、ブースト値を微調整します。

### 日付の範囲による結果のブースト

[カスタムフィルターウィジェットの設定フォーム](filtering-search-results.md#custom-filter-configuration) のDate Rangeクエリオプションは、 [Elasticsearch Rangeクエリ](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-range-query.html) に対応します。 過去1年以内に作成された結果をブーストするには、ページにカスタムフィルターを追加して、次のように設定します。

**フィルタフィールド：** `createDate`

**フィルタ値：** `[now-1y now]`

**フィルター クエリータイプ：** `Range`

**発生：** `Should`

**ブースト：** `100`

過去1年間に作成された結果は、このカスタムフィルターの結果としてブーストされます。 そこで、次のようなタイトルと内容で、3分程度の間隔で2つのブログを作成します。

| ブログ1                | ブログ2               |
|:------------------- |:------------------ |
| タイトル `liferay dxp`  | タイトル `liferay dxp` |
| コンテンツ：`Liferay dxp` | コンテンツ：`liferay`    |

`dxp`で検索した場合、先のブログの方が検索キーワードが多いので検索結果の上位に表示され、どちらも昨年に作成されているので同等にブーストされています。

2つ目のブログ記事を作成した直後に、カスタムフィルターのフィルター値を `[now-2m now]`と設定します --この値は調整が必要な場合があります。

もう一度検索すると、検索結果のブログの順番は、古いブログが最初に表示されます。（新しいブログが設定された時間範囲内に作成され、古いブログがそうでない場合）。

範囲の指定方法については、 [Elasticsearch date-math documentation](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/common-options.html#date-math) を参照してください。

### 指定フィールドへの一致をブースト

検索したキーワードに一致する特定のフィールドを持つドキュメントをブーストするには、次のようにカスタムフィルターを設定します。

**フィルタクエリタイプ：** `マルチマッチ`

**フィルターフィールド:** `title_en_US, content_en_US`

**発生:** `Should`

**ブースト:** `100`

**カスタムパラメーター名:** `q`

この設定では、英語（米国）のタイトルとコンテンツに、ユーザーが検索バーウィジェットに入力したキーワードが含まれている場合、ドキュメントのマッチングがブーストされます。 カスタムパラメーター名を検索バーのキーワードパラメーター名の設定と同じ値で入力すると、検索バーに渡された値がカスタムフィルターでブーストされた値になります（検索インデックスのドキュメントにマッチした場合）。

マルチマッチクエリは、複数のフィールドを一度にマッチさせることができます。 そうしないと、他の設定値が同じであっても、個別のフィールドごとにカスタムフィルタを設定する必要があります。

### フィールドの存在による後押し

タグの値に関わらず、タグ付けされたコンテンツをブーストするには、次のようにカスタムフィルターを設定します。

**フィルタクエリタイプ：** `Exists`

**フィルタフィールド：** `assetTagNames`

**発生：** `should`

**ブースト:** `100`

クエリにマッチするドキュメントがタグ付けされている場合、 `assetTagNames`フィールドが含まれます。 Existsクエリは、フィールドのあらゆる値にマッチします。

## サイトIDによるフィルタリング

1つのページの検索で複数のサイトを検索する際に、すべてのサイトを検索しない設定はありません。 現在のサイトとすべての[サブサイト](../../../site-building/sites/site-hierarchies.md)からの結果を含めるには、検索バーのスコープを設定し、 **すべて** に設定する必要があります。 その後、検索結果に含めるサイトの`groupId`をマッチさせるためのtermクエリを持つカスタムフィルターウィジェットが、それぞれの子クエリ句を集めることができるBoolクエリを持つ1つの親カスタムフィルターを使用します。 サイトのIDは、ドキュメントの検索の`groupId`フィールドです。

1. 3つのサイトを作る：
   - 子サイトを持つ親サイトを1つ以上作成してください。
   - 検索にかからない追加のSiteを1つ以上作成する。

   ```{tip}
   サイトのグループIDを確認するには、サイトメニューのConfiguration > Settingsに移動します。 表示された`Site ID`は、Siteのフィルタリングに使用できる`groupId`となります。
   ```

1. 各Siteに少なくとも1つのコンテンツ（Blog Entry）を作成し、それぞれに **Liferay** という単語を入れてください。

1. 検索バーのスコープを **Everything** に設定します。

   > **チェックポイント：** 検索して、すべてのサイトのコンテンツが返されることを確認する

   ![この3つのBlogエントリーは、それぞれ別のサイトからのものです。](./custom-filter-examples/images/01.png)

1. 親のカスタムフィルターを設定します。

   **フィルタクエリタイプ：** `Bool`

   **発生：** `Filter`

   **クエリ名：** `SiteBoolQuery`です。

1. 検索対象とするサイトごとにカスタムフィルターを設定します。

   **フィルタクエリタイプ：** `Term`

   **フィルターフィールド：** `groupId`です。

   **発生：** `should`

   **親クエリ：** `SiteBoolQuery`です。

   **フィルターの値：** `38109`となります。

   上のスクリーンショットのコンテンツの例では、もうひとつカスタムフィルタが必要です。 フィルターの値を `38105`とすること以外は、上記と同じように設定します。

   > **チェックポイント：** 再度検索を行い、指定したサイトのみのコンテンツが表示されることを確認します。 これは、検索結果が **Display Results in Document Form** に設定されている場合、詳細ビューを見てさらに確認することができます。

   ![含まれるサイトのコンテンツのみが表示されます。](./custom-filter-examples/images/02.png)

重要なのは、`groupId`によるフィルタは、`SiteBoolQuery`を親クエリとして宣言していることです。 各サイトの子Termクエリの **should** Occur句は、OR演算子として機能し、 `groupId`のいずれかがマッチした場合、そのコンテンツが［検索結果］ウィジェットに表示されるようになっています。

## クエリ文字列による複合フィルタ

[サイトIDによるフィルタリング](#filtering-by-site-id) の例のように、 [検索文字列クエリ](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-query-string-query.html) を使用することで、複数のクエリを必要としない場合があります。 以下の設定では、1つのカスタムフィルターウィジェットのみを使用して、検索対象を制限する方法を示しています。

- ドキュメントとメディアファイルを` pdf`または、`jpg`拡張子に一致させる。
- ウェブコンテンツの記事に合わせる

カスタムフィルターウィジェットを以下のように設定します。

**フィルタクエリタイプ：** `検索文字列`

**発生：** `Filter`

**フィルタ値：** `((extension:pdf OR extension:jpg) AND entryClassName:com.liferay.document.library.kernel.model.DLFileEntry) OR entryClassName:com.liferay.journal.model.JournalArticle`

意図した優先順位を確実に実行するためには、括弧の使用を推奨します。

ページの検索の構成を簡素化すること（複雑なケースを1つのカスタムフィルタウィジェットだけで処理することが多い）は良いことですが、検索文字列クエリはカスタムフィルタウィジェットの複雑さをすべて解決するものではありません。 検索文字列タイプでは真似できないクエリもあります。 たとえば、ネストされたドキュメントを検索するためのネストされたクエリ、分析を回避するためのTermクエリ、またはプレフィックスに基づいて検索するためのプレフィックスクエリを処理することはできません。

```{warning}
クエリ文字列クエリは、渡される値が検索バーからのものである場合には使用しないでください（`Boosting Matches to Designated Fields`_で説明しています）。 検索バーのユーザーが無効な構文を含むキーワードを入力した場合、エラーが返されます。
```

## ネストしたフィールドへのブーストマッチ

{bdg-secondary}`利用可能 7.2 FP10+、7.3 FP1+、7.4（すべてのアップデート）`

[Accessing Nested DDM Fields](../search-facets/custom-facet.md#accessing-nested-ddm-fields) で説明されているように、Liferay 7.2 SP3 /FP8 (およびLiferay 7.3のすべてのバージョン)では、DDMフィールドは [ネストされたフィールド](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) になりました。 7.2および7.3の最新のフィックスパックおよびGAリリースでは、これらのネストされたフィールドを考慮して、 [Elasticsearch Nested query](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-nested-query.html) がサポートされています。

カスタムフィルターの設定での [ネストされたフィールド](../../../liferay-internals/reference/7-3-breaking-changes.md#dynamic-data-mapping-fields-in-elasticsearch-have-changed-to-a-nested-document) を使用すると、ページの検索に3つのカスタムフィルターウィジェットが必要になります。 必要な子クエリをラップする [ネストされたクエリ](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/query-dsl-nested-query.html) がウィジェットの1つに追加されます。1つの子クエリはフィールドの名前と一致し、もう1つは値と一致します。

この例では、特定のDDMストラクチャー項目にマッチした場合のブーストを追加しています。

1. [ストラクチャー](../../../content-authoring-and-management/web-content/web-content-structures/creating-structures.md)を作成します。
    - サイトメニューの［コンテンツ］ & ［データ］ &rarr; ［ウェブコンテンツ］に移動します。
    - **ストラクチャー** タブをクリックし、追加ボタン ![Add](../../../images/icon-add.png)をクリックします。
    - ストラクチャーにタイトル（例： **Boosted Content**）とこれらのフィールドを与えます。
        - フィールド 1:
            - **タイプ：** `Boolean`
            - **フィールドラベル：** `Boost?`
        - フィールド 2:
            - **タイプです。** `テキスト`
            - **フィールドラベル：** `コンテンツ`
    - ストラクチャーを保存します。

    ストラクチャーのフィールドは、デフォルトではインデックス化されています。

1. 新しいストラクチャーを使用する Web コンテンツを 1 つ追加します。

    - **タイトル：** `ブースト`
    - **Boost?** `True`
    - **コンテンツ：** `テスト`

1. 新しいストラクチャーを使用する2つ目のWebコンテンツを追加します。

    - **タイトル：** `Not Boosted`
    - **Boost?** `False`
    - **コンテンツ：** `テストコンテンツ`

1. 検索ページに移動し、 **test content** と検索します。

    **チェックポイント：** コンテンツフィールドが完全に一致しているため、BoostedされていないWebコンテンツがBoostedされたWebコンテンツよりも先に表示されます。

1. 検索結果ウィジェットの設定で、 **Display Results in Document Form** を有効化する。

1. `ddmFieldArray` フィールドを探し、その値をコピーします。 例:

   ```json
   "ddmFieldArray" : [
               {
                 "ddmFieldName" : "ddm__keyword__44012__Checkbox08350381_en_US",
                 "ddmFieldValueKeyword_en_US" : "true",
                 "ddmFieldValueKeyword_en_US_String_sortable" : "true",
                 "ddmValueFieldName" : "ddmFieldValueKeyword_en_US"
               }
            ],
   ```

1. 検索ページに行き、Elasticsearchのレスポンスデータを使って3つのカスタムフィルタを追加します。

    - フィルタ1、親の入れ子のクエリ：
        - **フィルターフィールド：** `ddmFieldArray`となります。
        - **フィルタクエリタイプ：** `Nested`
        - **発生：** `should`
        - **クエリ名：** `parent_query`
        - **Boost：** `500`
    - フィルター2、フィールド名の子マッチクエリ。
        - **フィルターフィールド：** `ddmFieldArray.ddmFieldName`
        - **フィルタクエリタイプ：** `Match`
        - **発生：** `should`
        - **Value:** `ddm__keyword__44012__Checkbox08350381_en_US`
        - **親クエリ名：** `parent_query`
        - **カスタムパラメータ名：** `cparam`
    - フィルター3、Boostフィールドの `true` の値に対する子マッチクエリです。
        - **フィルターフィールド：** `ddmFieldArray.ddmFieldValueKeyword_en_US`
        - **フィルターの値：** `true`
        - **フィルタクエリタイプ：** `Match`
        - **発生：** `should`
        - **親クエリ名：** `parent_query`
        - **カスタムパラメータ名:** `cparam`

      ```{important}
      この例では、ネストした1つのフィールドに対してカスタムフィルタを使用しているため、子クエリのカスタムパラメータ（`cparam`）は実際には必要ではありません。 同じページ内の複数のネストしたフィールドにカスタムフィルターを設定するには、この例で示すように、子クエリーのカスタムパラメーター名を設定する必要があります。 2つ目のネストしたフィールドのフィルタを追加するには、異なるカスタムパラメータ名（例：`cparam2`）を共有する2つの子カスタムフィルタが必要です。
      ```

1. ここで、 **test content** の検索を繰り返し、BoostedされたウェブコンテンツがNot Boostedされていないウェブコンテンツの上に表示されることを確認します。

ブースト値は、お客様のニーズに合わせてチューニングが必要な場合があります。 検索インサイトウィジェットを使用し、 ［**スコアの説明を有効にする**］ を有効にして、ドキュメントがどのようにスコアリングされているかを調べ、ブースト値を微調整します。

## 関連する内容

- [検索結果のフィルタリング](./filtering-search-results.md)
- [結果ランキング](../../search-administration-and-tuning/result-rankings.md)
- [同義語セット](../../search-administration-and-tuning/synonym-sets.md)
