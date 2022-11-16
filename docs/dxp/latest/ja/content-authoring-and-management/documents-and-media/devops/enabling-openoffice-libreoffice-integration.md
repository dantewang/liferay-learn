# OpenOffice / LibreOffice統合の有効化

[OpenOffice](https://www.openoffice.org/) と [LibreOffice](https://www.libreoffice.org/) は、Liferayと統合できるオープンソースのプロダクティビティスイートです。 デフォルトでは、Liferayには限られたファイル形式の自動プレビューを生成する [PDFBox](https://pdfbox.apache.org/) が含まれています。 ただし、これらのスイートのいずれかを統合して、ドキュメント変換などの追加機能を利用できます。 Liferay統合を有効にする前に、目的のサービスをサーバーにインストールする必要があります。

```{important}
OpenOfficeとLibreOfficeはどちらも統合可能ですが、一部の機能はすべてのLiferay製品と互換性がない場合があります。 サポートされているテクノロジーのリストについては、 [Liferay DXPインテグレーションテクノロジーの互換性マトリクス](https://help.liferay.com/hc/ja/articles/360016294272-Liferay-DXP-Integrated-Technologies-Compatibility-Matrix) を参照してください。
```

インストールしたら、次の手順に従って、コントロールパネルからLiferayのOpenOffice / LibreOffice統合を有効にします。

1. **グローバルメニュー** を開き、 ［**コントロールパネル**］ &rarr; ［**System Settings**］ &rarr; ［**ConnectorsOpenOffice の利用**］ &rarr; ［**OpenOffice Integration**］ に移動します。

   ```{note}
   または、 `com.liferay.document.library.document.conversion.internal.configuration.OpenOfficeConfiguration.config`ファイルを`[Liferay Home]/osgi/configs`フォルダにデプロイしてこれらの設定を調整することもできます。 
   ```

   ![［システム設定］の［コネクター］の下にある［OpenOffice の利用］に移動します。](./enabling-openoffice-libreoffice-integration/images/01.png)

2. ［**Server Enabled**］ ボックスをオンにします。

3. 目的の ［**Server Host**］ と ［**Server Port**］ を入力します。

   ```{important}
   同じマシンにOpenOfficeをインストールすることをお勧めします。 インスタンスにリモートホストを使用することは完全にはサポートされておらず、予期しない問題が発生する可能性があります。
   ```

4. ［**アップデート**］ をクリックします。

ドキュメントの変換、サポートされているドキュメントタイプのブラウザでの表示、ドキュメントのサムネイルとプレビューの生成など、OpenOffice / LibreOfficeと互換性のある機能を使用できるようになりました。

## 追加情報

* [ドキュメントとメディア](../../documents-and-media.md)
* [ドキュメントとメディアプレビューの設定](./configuring-documents-and-media-previews.md)
