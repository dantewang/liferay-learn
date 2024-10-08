# Liferay Cloud Service Logsを読む

環境ログは、プロジェクトにおける技術的な問題を診断し、解決するために非常に重要です。 Liferay Cloudでは、ユーザーがLiferay CloudのコンソールやOSのターミナルからアクセスし、ダウンロードできる様々な環境ログを提供しています。

## ログの種類

Liferay Cloudでは、環境サービスに対して3種類のログを提供しています：

* **ビルドログ** ：これらのログは、アプリケーションの起動時に生成されるビルド情報を一覧表示します。 ビルド情報の例としては、レジストリからDockerイメージが引き出されたとき、デプロイが進行中のとき、ビルドが成功したときなどがあります。

* **ステータスログ** : これらのログは、Kubernetesクラスターからのオーケストレーションレイヤー情報を一覧表示します。 ステータス情報の例としては、イメージが正常に引き出されたとき、コンテナが作成・起動されたとき、レディネスプローブやライヴネスプローブが失敗したときなどがあります。

* **アプリケーションログ** ：これらのログは、アプリケーションが実行され、ユーザーがアクセスした後に生成されたランタイム情報を一覧表示します。

## ログ構造

Liferay Cloudのログは特定の構造に準拠しており、余分な文脈情報を提供します。 例として、以下のログメッセージを参照してください：

```log
Jun 29 10:07:46.585 build-214 [webserver-699bf65bfb-4w8pl] [WARNING] 179/170746 (13) : api/backend2 changed its IP from 10.0.17.186 to 10.0.26.120 by DNS cache.
```

Liferay Cloud の多くのログには、このメッセージがサービスの出力から直接ではなく、Liferay Cloud のインフラから来たことを示すラベル（この例では、 `[WARNING]`）があります。 ログには、Liferay Cloud インフラから来たがサービスに関連するラベル、例えば `[LIFERAY]`を付けることもできます。 サービスの出力から直接取得されるログには、ラベルがありません。

さらに、これらのコンポーネントは、Liferay Cloudのあらゆるログメッセージに常に存在します：

* **タイムスタンプ** : この例では、 `Jun 29 10:07:46.585`となっています。

* **ビルド ID** : この例では、 `build-214`です。 これは、現在デプロイされているサービスのバージョンが対応するビルドに相当します。 このビルドIDは、プロジェクトの **Builds** ページに表示されているビルドのリストと一致させることができます。

* **インスタンスID** : この例では、 `[webserver-699bf65bfb-4w8pl]`です。 これは、メッセージがどのサービスのどのインスタンスに関連しているかを識別するために使用されます。

ログメッセージに関連付けられたインスタンスIDは、サービスのいずれかのインスタンスに対応しています。 ログページでは、ログの上にあるインスタンスのドロップダウンメニューをクリックすることで、サービス内のすべてのアクティブなインスタンスを確認（およびフィルタリング）することができます。

![インスタンスのドロップダウンメニューをクリックすると、すべてのインスタンスが表示されます](./reading-liferay-cloud-service-logs/images/01.png)

インスタンスIDの形式は、サービスがどのような配布タイプ（展デプロイまたはステートフルセット）として構成されているかによって異なります。 詳細は、 [デプロイタイプについて](../updating-services-in-liferay-paas/understanding-deployment-types.md) を参照してください。

### 配布タイプログのインスタンスID

配布タイプログは、複数のパートからなるインスタンスIDを持っています。 以下は配布タイプサービスのログメッセージの例です：

```log
Jun 29 10:07:57.102 build-214 [liferay-7485669bdd-7ktfl] [LIFERAY] Executing 010_liferay_cloud_customizable_files_override.sh.
```

このメッセージのインスタンスID（この例では、 `[liferay-7485669bdd-7ktfl]`）には、以下のコンポーネントが含まれています：

* **サービス名** : この例では、 `liferay`となっています。

* ランダムに生成された **バージョンID** ：この例では、 `7485669bdd`となっています。 これは、変更が可能な状態でデプロイされたサービスのバージョンに相当します。 なお、新しいデプロイ、環境変数の変更、サービスの手動での再起動は、すべて新しいバージョンIDを生成します（設定に新しい変更が加えられた可能性があるためです）。

* ランダムに生成された **コンテナID** ：この例では、 `7ktfl`となっています。 サービスが起動するたびに新しいコンテナが作成されるため（例えば、新しいビルドをデプロイした後サービスが再起動した場合など）、新しいコンテナIDが生成されます。 バージョンIDが変更されない場合でも、再起動すると新しいコンテナIDが生成されることに注意してください（例えば、 [ライブネスやレディネスプローブの失敗](./self-healing.md) が再起動をトリガーした場合など）。

### ステートフルセットタイプログのインスタンスID

ステートフルセットタイプのログは、インスタンスIDが小さく、一貫性があります。 以下はステートフルセットタイプサービスのログメッセージの例です：

```log
Jun 29 07:44:44.676 build-214 [search-0] #  - Creating and Starting rollup jobs will no longer be allowed.
```

これらは、ステートフルセットタイプサービスの `インスタンスID` の唯一の構成要素です：

* **サービス名** : この例では、 `検索機能`です。

* イテレート（非ランダム）**ノードID** ：この例では、 `0`。 このIDは、新しいバージョンのサービスをデプロイしても同じです。

ステートフルセットタイプのサービスのインスタンスID全体は、サービスの各ノードで常に同じものが使用されます。 これにより、サービスが再びデプロイされた後でも、同じインスタンスIDを使用して、同じ [ボリューム](../updating-services-in-liferay-paas/configuring-persistent-file-storage-volumes.md)を持つクラスタ内のノードを確実に識別することができます。

## Liferay Cloud Consoleからログにアクセスする。

以下の手順で、Liferay Cloudコンソールから環境サービスログにアクセスします：

1. プロジェクト環境に移動します。

1. 環境メニューの ［**Logs**］ をクリックします。

すべての環境サービスのアプリケーション、ステータス、ビルドログを表示するか、 [ドロップダウンメニューを使用して、](#searching-and-filtering-logs) 結果をフィルタリングします。

ログをダウンロードするには、[**Download Logs**]をクリックします。

![環境ログを表示する Logs ページを形成します。](./reading-liferay-cloud-service-logs/images/02.png)

また、各サービスのログは、各サービスの専用ページの ログ タブでご覧いただけます。

![各サービスのログは、各サービス専用ページの「ログ」タブで閲覧・ダウンロードできます。](./reading-liferay-cloud-service-logs/images/03.png)

### ログの検索とフィルタリング

ログページでは、 [タイプ](#log-types) またはサービス別にフィルタリングすることができます。 サービス別にログをフィルタリングする場合、特定のノードでフィルタリングするための別のドロップダウンメニューが表示されます。

![ドロップダウンメニューを使用して、タイプ、サービス、およびサービスインスタンスでフィルタリングします。](./reading-liferay-cloud-service-logs/images/04.png)

日付の範囲でフィルタリングする場合は、右上の日付ピッカーを使用します。 [が有効なログを持たなくなった日](../reference/platform-limitations.md#all-services) を選ぶことはできません。

![日付ピッカーを使って、特定の日付範囲のログを見ることができます。](./reading-liferay-cloud-service-logs/images/05.png)

特定の用語や正規表現でログを検索することができます。 **Term** または **Regex** をドロップダウンメニューから選択し、検索語または正規表現を入力します。 過去の検索結果に基づいて、検索候補が表示されます。 正規表現では、 [RE2 構文](https://github.com/google/re2/wiki/Syntax) .

![特定の用語や形式を含むログを探すには、検索を使用します。](./reading-liferay-cloud-service-logs/images/06.png)

サービスのページでは、タイプまたはインスタンスによるログのフィルタリングのみが可能です。

## ターミナルからログにアクセスする

管理者や開発者は、OS端末を使ってログを見ることもできます。

次のコマンドを実行すると、すべてのサービスのログが一覧表示されます：

```shell
lcp log
```

特定の環境のサービスログにアクセスするには、 `lcp log` コマンドを実行した後に環境のIDを入力するか、 `lcp log` コマンドに環境IDを入力して実行します：

```shell
lcp log -p <environment-id>
```

また、 `lcp log` コマンドの一部としてサービスを指定することもできます：

```shell
lcp log -p <environment-id> -s <service-id>
```

## 関連トピック

* [シェルアクセス](./shell-access.md)
* [ディザスタ リカバリの概要](./disaster-recovery-overview.md)
* [クロスリージョンディザスタ リカバリの設定](./configuring-cross-region-disaster-recovery.md)
