# アップグレード後の考慮事項

データベースをアップグレードした後、本番環境用にLiferayを再度構成し、Liferayインスタンスに影響を与える可能性のある機能の変更を確認する必要があります。

## 本番環境設定を再度有効にする

データベースのアップグレードが完了したら、本番環境設定を再度有効にします。

### 検索インデクス

7.2にアップグレードするために検索インデックスを無効にした場合は、無効にした`.config`ファイルを削除するか、`.config`ファイルに`indexReadOnly="false"`を設定して、検索インデックスを再度有効にします。 例:

```bash
rm osgi/configs/com.liferay.portal.search.configuration.IndexStatusManagerConfiguration.config
```

メジャーバージョンアップの際には、検索インデックスの再作成が必要です。 同じLiferayのバージョン内で新しいアップデートへの移行、サービスパックの適用、新しいGA（ローリングリリース）へのアップグレードを行う場合、再インデックスが必要かどうか判断するために、そのバージョンのリリースハイライトを参照してください。 ここでは、再インデックス化の方法を説明します。

1. *グローバルメニュー* （![Global Menu icon](./post-upgrade-considerations/images/01.png)）をクリックし、*［コントロールパネル］*タブを選択します。 コントロールパネルが表示されます。

1. Configurationセクションの *Search* をクリックし、 *Index Actions* タブを選択し、 *Execute* for *Re-index all search indexesをクリックします。* 再インデックスが実行され、完了すると成功メッセージが表示されます。

![コントロールパネルで検索インデックスの再作成が可能です。](./post-upgrade-considerations/images/02.png)

```{note}
古いバージョン（7.1以下）からアップグレードした場合は、検索インデックスを処理するために[Elasticsearchのインストール](../../../using-search/installing-and-upgrading-a-search-engine/installing-a-search-engine.md)を検討してください。
```

### データベース設定

データベースをアップグレードする前に、アップグレード用にデータベースを調整している場合があります（[アップグレードのためのデータベース調整](../upgrade-stability-and-performance/database-tuning-for-upgrades.md)を参照）。 アップグレードが完了したので、本番環境データベースの設定を復元します。

```{note}
データのアップグレード中にシャード化された環境から移行した場合、仮想インスタンスへの移行を完了するには、構成をさらに調整する必要があります。 詳細は、 [Upgrade and Update Properties](../other-upgrade-scenarios/upgrading-a-sharded-environment.md#Upgrade-and-Update-Properties) のセクションを参照してください。
```

## 最新のマーケットプレイスアプリのインストール

新しいLiferayバージョンの[マーケットプレイスアプリ](../../../system-administration/installing-and-managing-apps/installing-apps/downloading-apps.md)の最新バージョンをまだインストールしていない場合は、それらをインストールし、[Gogoシェルコマンド](../upgrade-stability-and-performance/upgrading-modules-using-gogo-shell.md)を使用して、必要なデータベースのアップグレードを確認して実行します。

## 機能変更の考慮

新しいLiferayバージョンでは、機能と動作が変わります。 以下の変更点を確認してください。

### Webコンテンツの表示権限を有効にする

7.1より前は、すべてのユーザーがデフォルトでWebコンテンツの記事を表示できました。 現在は、表示権限がデフォルトでオンになっています。 表示権限を開くための主なオプションは次のとおりです。

**オプション1：**_［コントロールパネル］_ → _［設定］_ → _［System Settings］_ → _［Web Content］_ → _［Virtual Instance Scope］_ → _［Web Content］_に移動し、_［Article view permissions check enabled］_の選択を解除して、すべてのWebコンテンツの記事の表示権限を開きます。

![［システム設定］の［Webコンテンツ］メニューを下にスクロールして、Webコンテンツを表示するための権限チェックを無効にします。](./post-upgrade-considerations/images/03.png)

**オプション2：** Webコンテンツの記事が少ない場合は、ロールに基づきWebコンテンツの記事ごとに表示権限を編集します。

### Webコンテンツの画像チェック

7.2にアップグレードすると、Webコンテンツの画像は[ファイル ストア](../../../system-administration/file-storage.md)（ドキュメントライブラリともいう）に移動し、以前のテーブル`JournalArticleImage`は削除されます。 画像を移行できない場合、Liferayは失敗を報告します。

```
Unable to add the journal article image {filename} into the file repository
```

そのようなメッセージがない場合は、すべての画像がファイルストアにあるはずです。 Webコンテンツの記事をプレビューして、画像を確認できます。

## メンテナンスモードでの非推奨項目と機能の考慮

[メンテナンスモードでの非推奨項目と機能](../reference/maintenance-mode-and-deprecations-in-7-3.md)を確認し、Liferayインスタンスへの影響に対応するための計画を立ててください（まだ行ってない場合）。

## 廃止されたデータを削除する

不必要で無駄なデータは、使い終わったら削除できます。 ここでは、よくある2つの古いデータの状況と、そのデータを削除するためのツールを紹介します。

* 廃止されたLiferayアプリまたはモジュールからのデータ。 [データクリーンアップ](../reference/data-cleanup.md)ツールを使用して削除します。

* 利用可能なLiferayアプリおよびモジュールからの廃止されたデータ。 [データ削除](../reference/data-removal.md)ツールを使用して削除します。

## まとめ

アップグレード後の必要なタスクをすべて完了すると、Liferayサーバーは以前と同様に通常の操作を行う準備が整います。 　
