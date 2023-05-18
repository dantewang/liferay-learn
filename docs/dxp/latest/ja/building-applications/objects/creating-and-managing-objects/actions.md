---
toc:
  - ./actions/defining-object-actions.md
  - ./actions/understanding-action-types.md
  - ./actions/using-manual-actions.md
---
# アクション

```{toctree}
:maxdepth: 3

actions/defining-object-actions.md
actions/understanding-action-types.md
actions/using-manual-actions.md
```

オブジェクトアクションは、オブジェクトエントリーイベントに対して手動または自動で実行できるカスタムビジネスロジックを定義します。 例えば、エントリーイベントのデータをWebhook URLに配信する、エントリー更新後にメール通知を行う、エントリー作成後にカスタムのGroovyスクリプトを実行する、などが挙げられます。

自動トリガーを使用する場合、Liferayはイベントをリッスンし、あらかじめ定義された条件に従って自動的に操作を実行します。 スタンドアロントリガーを使用する場合、Liferayはオブジェクトエントリーのアクションメニュー(![Actions Button](../../../images/icon-actions.png))にアクションを追加し、それをトリガーするためのHeadless APIを生成します。 アクションは手動で実行する必要があります。

![オブジェクト定義にアクションを追加します。](./actions/images/01.png)

Liferay Objectは下記のアクションの種類を提供します。

| 種類             | Description                                     |
|:-------------- |:----------------------------------------------- |
| 通知             | あらかじめ設定されたテンプレートを使って、メールやユーザー通知を送信します。          |
| オブジェクトエントリーを追加 | アクティブなオブジェクトにエントリーを作成します。                       |
| オブジェクトエントリーを更新 | 現在のオブジェクトエントリーの項目を更新します。                        |
| Webhook        | URLにペイロードを配信します。                                |
| Groovy スクリプト   | [Groovy](https://groovy-lang.org/) のスクリプトを実行します。 |

```{important}
Groovyスクリプトアクションは、Liferay Experience Cloud Self-ManagedとLiferay DXP Self-Hostedでのみ利用可能です。
```

<!--TASK: When client extensions docs are ready, mention being able to add Action Types and Notification Types.-->


::::{grid} 2
:gutter: 3 3 3 3

:::{grid-item-card} オブジェクトアクションの定義
:link: ./actions/defining-object-actions.md
:::

:::{grid-item-card} アクションの種類について
:link: ./actions/understanding-action-types.md
:::

:::{grid-item-card} マニュアルアクションの使用
:link: ./actions/using-manual-actions.md
:::
::::
