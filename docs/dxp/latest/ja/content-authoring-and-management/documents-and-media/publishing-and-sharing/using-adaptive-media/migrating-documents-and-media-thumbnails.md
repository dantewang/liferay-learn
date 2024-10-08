# ドキュメントとメディアサムネイルのアダプティブメディアへの移行

DXPは、アダプティブメディアを使用して、ドキュメントとメディア内の画像のサムネイルを自動的に生成します。 この機能は、DXP7.1以降でデフォルトでインストールされています。 ただし、アダプティブメディアをサポートしていないレガシーバージョンを使用していて、最新のDXPバージョンにアップグレード済みで、アダプティブメディアを使用してドキュメントとメディアのサムネイルを管理する場合は、移行プロセスを確認してください。

```{note}
ここで説明するアクションを実行するには、ポータル管理者である必要があります。
```

## 置換用画像解像度の追加

既存のドキュメントとメディアのサムネイルを移行するには、次のポータルプロパティで指定された値と一致する最大高さと最大幅の値を持つ新しい画像解像度をアダプティブメディアに追加する必要があります。

* `dl.file.entry.thumbnail.max.height`
* `dl.file.entry.thumbnail.max.width`
* `dl.file.entry.thumbnail.custom1.max.height`
* `dl.file.entry.thumbnail.custom1.max.width`
* `dl.file.entry.thumbnail.custom2.max.height`
* `dl.file.entry.thumbnail.custom2.max.width`

これらのプロパティの一部は有効になっていない可能性があります。 アダプティブメディアでは、有効になっているプロパティの画像解像度のみを作成する必要があります。

新しい画像解像度を作成するには、 [画像解像度の追加](./adding-image-resolutions.md) を参照してください。

## アダプティブメディア画像の作成

必要な画像解像度がそろったら、ドキュメントとメディアのサムネイルをアダプティブメディア画像に変換できます。

ドキュメントとメディアのサムネイルをアダプティブメディアに移行するには、次の2つの方法があります。

* サムネイルの画像解像度に合わせて画像を調整する：これにより、既存のサムネイルがアダプティブメディアの画像解像度の値にスケーリングされます。これには、画像の数によっては時間がかかる場合があります。 これは、画像の数が少ない場合、または画像を最初から生成する場合にのみお勧めします。 このアプローチについては、 [Generating Missing Adapted Images](./managing-image-resolutions.md#generating-missing-adapted-images) で詳しく説明しています。

* 既存のサムネイルを再利用する移行プロセスを実行する：既存のサムネイルがアダプティブメディアにコピーされます。これにより、計算コストの高いスケーリング操作が回避されるため、パフォーマンスが向上します。

### 移行プロセスの実行

移行プロセスは、 [Gogoコンソールコマンド](../../../../liferay-internals/fundamentals/using-the-gogo-shell/gogo-shell-commands.md) のセットです。

1. **Global Menu** &rarr; **Control Panel** &rarr; **Gogo Shell** に移動します。

   ![Navigate to the Gogo Shell.](./migrating-documents-and-media-thumbnails/images/01.png)

1. `thumbnails:check`コマンドを実行する。 インスタンスごとに、移行が保留されているサムネイルの数が一覧表示されます。

1. `thumbnails:migrate`コマンドを実行する。 これにより、移行プロセスが実行されます。画像の数によっては、完了するまでに時間がかかる場合があります。

1. `thumbnails:cleanUp`コマンドを実行する。 これはオリジナルのドキュメントとメディアのサムネイルをすべて削除し、`thumbnails:check`が返すカウントを更新する。 そのため、マイグレートコマンドを実行し、マイグレーションが正常に実行され、マイグレー ションが保留されているイメージがないことを確認した後にのみ、`thumbnails:cleanUp` を実行する必要があります。

## トラブルシューティング

移行プロセスの実行後のある時点でアダプティブメディアをアンデプロイする場合は、ドキュメントとメディアのサムネイルを再生成する必要があります。

1. グローバルメニュー **&rarr;** コントロールパネル **&rarr;** サーバー管理_ に移動します。

   ![Navigate to the Server Administration.](./migrating-documents-and-media-thumbnails/images/03.png)

1. ドキュメントとメディアのプレビューとサムネイルファイルのリセット]の横にある[実行]をクリックします。

   ![Navigate to the Gogo Shell.](./migrating-documents-and-media-thumbnails/images/02.png)

## 関連トピック

* [画像解像度の管理](./managing-image-resolutions.md)
* [アダプティブ・メディア・コンフィギュレーション・リファレンス](./adaptive-media-configuration-reference.md)
