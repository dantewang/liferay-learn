---
toc:
- ./installing-apps/downloading-apps.md
- ./installing-apps/accessing-ee-plugins-during-a-trial-period.md
---

# アプリのインストール

```{toctree}
:maxdepth: 3

installing-apps/downloading-apps.md
installing-apps/accessing-ee-plugins-during-a-trial-period.md
```

[マーケットプレイスのWebサイト](https://web.liferay.com/marketplace)からアプリをLPKGファイルとしてダウンロードしたら、次にローカルのDXPインスタンスにインストールします。

次のいずれかの方法を使用して、インスタンスに新しいアプリをインストールできます。

* [ファイルシステム経由でインストールする](#installing-apps-via-the-file-system)
* [UI経由でアプリをインストールする](#installing-apps-via-the-ui)

```{important}
インスタンスにアプリをインストールするには、サーバーを再起動する必要があります。 サンドボックス環境で新しいアプリをテストし、必要に応じて、他のサーバーへのインストールを事前に計画してください。
```

## ファイルシステム経由でアプリをインストールする

サーバーを再起動してファイルシステム経由でアプリをインストールするには、次の手順に従います。

1. [ DXPサーバーを停止します](../../installation-and-upgrades/installing-liferay/running-liferay-for-the-first-time.md#shutdown) 。

1. アプリファイル（LPKG、モジュールJAR、またはプラグインWAR）を`[Liferay Home]/deploy`フォルダにコピーします。 [Liferay Home](../../installation-and-upgrades/reference/liferay-home.md)フォルダは通常、アプリケーションサーバーの親フォルダです。 DXPは、`[Liferay Home]/deploy`フォルダからアプリをデプロイします。

1. [ DXPサーバーを起動します](../../installation-and-upgrades/installing-liferay/running-liferay-for-the-first-time.md#startup) 。

アプリファイルは、`[Liferay Home]/deploy`フォルダから`[Liferay Home]/osgi`の下の適切なサブフォルダにコピーされます。

* `marketplace`：マーケットプレイスのLPKGパッケージ
* `modules`：OSGiモジュールのJARファイル
* `war`：WARファイル

DXPはそれらのサブフォルダをリッスンし、ファイルを処理して（WARの場合、またはWARを含む場合はOSGiバンドルに変換し）、OSGiバンドルをOSGiコンテナにインストールします。

```{note}
ソース管理リポジトリ（GitやBitBucketなど）とオーケストレーションツール（[Jenkins](https://jenkins.io)など）を使用して、[DevOps](https://en.wikipedia.org/wiki/DevOps)パイプラインを通じてDXP環境をプロモートすることをお勧めします。

本番環境では、DevOpsパイプライン内のデプロイフォルダにアプリファイルをコミットする必要があります。
```

## UI経由でアプリをインストールする

DXPのアプリ管理UIを使用して、アプリをローカルサーバーにインストールできます。 バックグラウンドで、DXPはアプリファイルを`[Liferay Home]/osgi`の適切なサブフォルダにコピーし、OSGiバンドルに変換し（LPKGおよびWARは変換が必要）、バンドルをOSGiコンテナにデプロイします。

以下のセクションでは、UIを介してアプリをインストールするために使用できるインターフェイスについて説明します。

### コントロールパネルを介したマーケットプレイス

DXPのコントロールパネルからマーケットプレイスにアクセスします。 マーケットプレイスWebサイトからの場合と同じ方法でマーケットプレイスを閲覧します。 コントロールパネルでアプリを購入すると、アプリがダウンロードされ、DXPインスタンスに自動的にインストールされます。 詳細については、[Liferayマーケットプレイスでのアプリの購入](./using-marketplace.md)を参照してください。

```{note}
［マーケットプレイス］画面を使用してアプリをインストールしている場合、アプリをアンインストールする最も簡単な方法は、コントロールパネルの［Purchased Apps］画面を使用することです。
```

### Purchased Apps画面

コントロールパネルの _［Apps］_ &rarr; _［Purchased］_のPurchasedページには、以前に購入したアプリが一覧表示されます。 インストールされていないアプリには、DXPインスタンスにアプリをインストールするための_［Install］_ボタンがあります。

![コントロールパネルに表示される［Purchased Apps］画面。](./installing-apps/images/01.png)

### アプリケーションマネージャ

DXPのアプリケーションマネージャでは、マーケットプレイスアプリをアップロードおよびインストールできます。 詳細については、[アプリケーションマネージャの使用](./managing-apps/using-the-app-manager.md)を参照してください。
