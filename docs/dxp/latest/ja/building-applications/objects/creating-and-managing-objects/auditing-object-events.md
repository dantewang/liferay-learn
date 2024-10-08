# オブジェクト・イベントの監査

{bdg-secondary}`liferay 7.4 U72+/GA72+`.

Liferayの監査フレームワークを使って、カスタムオブジェクト定義とそのエントリのイベントを追跡することができます。 エントリーイベントを追跡するには、 [オブジェクト定義のエントリー履歴](#enabling-entry-history) を有効にする必要があります。 有効になっている間は、 [Audit アプリケーション](#using-the-audit-application) または [REST API](#using-rest-apis) を使って、エントリーの履歴を見ることができます。

## 監査アプリケーションの使用

{bdg-primary}`サブスクリプション`

監査アプリケーションにアクセスするには、 **グローバルメニュー**( [グローバルメニュー](../../../images/icon-applications-menu.png) )を開きます。 &rarr; **Control Panel** &rarr; **Audit** をクリックします。

![Click Audit in the Control Panel to view events related to object definitions.](./auditing-object-events/images/01.png)

イベントは表に表示される：

| 列         | 説明                                                       |
| :-------- | :------------------------------------------------------- |
| ユーザーID    | 代理ユーザーのID。                                               |
| 名前        | 代理ユーザーのID。                                               |
| リソースID    | 影響を受けるリソースのID。                                           |
| リソース名     | 影響を受けるリソースの名前（IDを含む）（例：`ObjectDefinition#44168`）。        |
| リソースアクション | 実行されたアクション (`ADD`、`UPDATE`、`DELETE`)。 |
| クライアントIP  | アクションの役割を担うIPアドレス。                                       |
| 作成日時      | イベントレコードが作成された日時。                                        |

イベントフィールドをクリックすると、具体的なアクションの詳細を含む、より詳細な記録が表示されます。 キーワードやその他の用語を使用して検索し、結果をフィルタリングすることができます。

オブジェクトエントリーイベントは `ObjectDefinition#[ObjectID]` という命名パターンを使用する。

![Click an event field to view more details.](./auditing-object-events/images/02.png)

## REST APIの使用

`nestedFields`パラメータを `auditEvents` の値と一緒に使うと、GET APIコールでエントリーの履歴を返すことができる（例：`http://localhost:8080/o/c/tickets/?nestedFields=auditEvents`）。 基本的なチュートリアルについては、 [nestedFieldsを使った入力履歴の監査](../understanding-object-integrations/using-custom-object-apis/using-nestedfields-to-audit-entry-history.md) を参照のこと。

```{important}
エントリーの履歴を見るためにREST APIを使用するには、そのエントリーの `View` と `Object Entry History` の両方のパーミッションが必要です。 詳細は [権限設定フレームワークの統合](../understanding-object-integrations/permissions-framework-integration.md) を参照。
```

## エントリー履歴を有効にする

デフォルトでは、カスタムオブジェクトのエントリー履歴は無効になっています。 7.4 U72+/GA72+の場合、この設定はいつでも行うことができます。 以前のバージョンでは、この設定は [オブジェクト定義](./creating-objects.md#publishing-object-drafts) をパブリッシュする前にしか設定できません。

エントリー履歴を有効にする、

1. **グローバルメニュー**(![グローバルメニュー](../../../images/icon-applications-menu.png))を開き、 ［**コントロールパネル**］ タブで ［**オブジェクト**］ をクリックします。

1. 目的のオブジェクト定義の編集を開始します。

1. Detailsタブで、 **Enable Entry History** を切り替える。

   ![Enable entry history.](./auditing-object-events/images/03.png)

1. ［**保存**］をクリックします。

有効になっている間、Liferayはエントリーイベントの履歴を保持し、AuditアプリケーションまたはREST APIコールで見ることができます。

## 関連トピック

* [オブジェクト](../../objects.md)
* [オブジェクトの作成と管理](../creating-and-managing-objects.md)
