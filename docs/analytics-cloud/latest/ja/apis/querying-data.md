# データのクエリ

Liferay Analytics Cloudのルートエンドポイントは、 <https://analytics.liferay.com/api/reports>です。 上記のURLにGETをリクエストすることで、すべてのデータタイプのエンドポイントのリストを取得することができます。 curlで試します。

```
curl -L -H "Authorization: Bearer {token}" https://analytics.liferay.com/api/reports
```

以下のようなレスポンスが返ってきます。

```json
{
   "_links":{
      "accounts":{
         "href": "https://analytics.liferay.com/api/reports/accounts"
      },
      "individuals":{
         "href": "https://analytics.liferay.com/api/reports/individuals"
      },
      "pages":{
         "href": "https://analytics.liferay.com/api/reports/pages"
      },
      "segments":{
         "href": "https://analytics.liferay.com/api/reports/segments"
      }
   }
}
```

ここから、さまざまなAPIを呼び出して、アカウント、ユーザー、ページ、セグメントのデータを取得することができます。

アナリティクスデータに対するサーバーの応答は、すべて同じデータ構造に従っています。 応答は、Liferay Analytics Cloudによって計算されたエンティティのページ結果です。 デフォルトでは、各ページには20個の要素が含まれており、ページのクエリパラメーターを置き換えることでナビゲートすることができます。 Totalは、利用可能な要素の総数を表示します。 以下はリスポンスの形式です：

```json
{"results":[],"total":0}
```

## アカウントデータへのアクセス

アカウントデータは、以下のコマンドで取得できます：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/accounts
```

### パラメーター

* `ページ` (整数）：結果ページ番号

## ユーザーデータへのアクセス

ユーザーデータは、以下のコマンドで取得できます：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals
```

### パラメーター

* `ページ` 整数：ページ番号の結果
* `クエリ` 文字列：ユーザーの人口統計情報と一致するキーワード

## ユーザーのアクティビティ

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{id}/activities
```

ユーザーによって実行されたアクティビティのリストを返します。

各活動の構成は以下のとおりです：

```json
{
   "ownerId": "371000621354447876",
   "startTime": "2019-10-28T21:49:05.674Z",,
   "applicationId":"WebContent",
   "eventId":"webContentViewed",
   "eventProperties":{
      "numberOfWords":"13",
      "articleId":"232001430",
      "title":"Navigation Content - Partner Resources Basic (for launch)",
      "pageViewActivityId":"8ed2e0d9-ed41-4b3d-bbe1-e1219448e9eb"
   }
}
```

### 詳細設定

* `ownerId` (文字列）：ユーザーIDに相当する、アクティビティの所有者。
* `startTime` (日付）：アクティビティが発生した日付のタイムスタンプ。
* `applicationId` (文字列）：イベントをトリガーしたアプリケーションのID。
* `eventId` (文字列）：ユーザーによって実行されたアナリティクスイベントのID。イベントIDは、ユーザーによって実行されるアクションを表す。
* `eventProperties` (オブジェクト）：イベントに関するメタデータ情報。eventIdによって異なる。

## ユーザーの興味

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{id}/interests
```

ユーザーが興味があるもののリストを返します。各興味の構造は以下のようになります。

```json
{
   "score":0.6908830400645879,
   "ownerId":"385450976494153117",
   "dateRecorded":null,
   "id":"389978452012791133",
   "name":"Digital Experience Software Tailored"
}
```

### 詳細設定

* ` score ` (数値)：ユーザーがその特定のトピックにどれだけ興味を持っているかを数値で表したもの。
* `ownerId` (文字列）：ユーザーIDに相当する、アクティビティの所有者。
* `dateRecorded` (日付）：興味が計算された日付のタイムスタンプ。
* `applicationId` (文字列）：イベントをトリガーしたアプリケーションのID。
* `id` (文字列）：興味対象の一意な識別情報。
* `name` (文字列）：興味のあるものの名前。

## ユーザーのセグメント

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/individuals/{id}/segments
```

ユーザーが所属するセグメントのリストを返します。各セグメントの構造については、［データ型 > セグメント］で説明しています。

## セグメントデータへのアクセス

セグメンツデータは以下のコマンドで取得できます：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments
```

### 詳細設定

`ページ` ：整数、結果ページ番号

## ユーザーのセグメント化

セグメントに属するユーザーのリストを返します。

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/segments/{id}/individuals
```

## ページデータへのアクセス

ページデータは、以下のコマンドで取得できます：

```
curl -H "Authorization: Bearer {token}" -L https://analytics.liferay.com/api/reports/pages 
```

### 詳細設定

* `ページ` (整数）：結果ページ番号。
* `キーワード` (文字列）：ページのタイトルやURL情報にマッチさせるキーワード。
* `rangeKey` (整数）：データのグループ化に使用される範囲。 設定可能な値は、0(過去24時間のデータ）、1(昨日のデータ）、7(過去7日間のデータ）、28(過去28日間のデータ）、30(初期値、過去30日間のデータ）、90(過去90日間のデータ）です。
* `sortMetric` (String)：デフォルトは `viewsMetrics`です； `ctrMetric`, `timeOnPageMetric`, `exitRateMetric`, `ctpMetric`, `sessionsMetric`, `avgTimeOnPageMetric`, `bounceMetric`...可能な値です、 `maxScrollDepthMetric`, `visitorsMetric`, `viewsMetric`, `bounceRateMetric`, `indirectAccessMetric`, `entrancesMetric`, `directAccessMetric`.
* `sortOrder` (文字列）、可能な値は **asc** または **desc** 。 sortMetricに従って、結果を昇順または降順で並べ替える。 デフォルトはdesc。
