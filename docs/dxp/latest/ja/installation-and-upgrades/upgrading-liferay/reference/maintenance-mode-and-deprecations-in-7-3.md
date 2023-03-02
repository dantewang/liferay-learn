# 7.3のメンテナンスモードと非推奨

新しいDXPのリリースごとに、機能の継続的な拡張が保証されない場合や、廃止される可能性があります。 機能の拡張を停止すると、その機能は*メンテナンスモード*に入ります。

**メンテナンスモード：** この機能はサポートされていますが、拡張は行われません。

廃止された機能は最終的に削除されるか、より新しい、より優れた機能に置き換えられます。 廃止された機能のサポートを終了する前に、Liferayはそれを*廃止予定*とマークします。

**廃止予定：** この機能は、次のマイナーバージョンのリリースでサポートされなくなります。 たとえば、7.3で廃止予定になった機能のサポートは、早ければ7.4で削除される可能性があります。

```{important}
廃止予定の機能のサポートは、早ければ次のマイナーリリースで終了する可能性があるため、機能の使用を停止することを計画してください。
```

```{important}
詳細は、[Maintenance Mode and Deprecation Policies](https://help.liferay.com/hc/en-us/articles/360015767952-Maintenance-Mode-and-Deprecation)を参照してください。
```

## 廃止予定の機能の利用可能性

廃止予定の機能には、さまざまな利用可能性があります。

**バンドル：** この機能はLiferay製品に含まれています。

**マーケットプレイス：** この機能はマーケットプレイスアプリの最終バージョンに含まれています。

**最終版：** このLiferayバージョン用にマーケットプレイスアプリの最終版がリリースされています。

**アーカイブ：** この機能は利用できませんが、そのコードはLiferayのリポジトリ（ <https://repository.liferay.com/nexus/index.html#welcome>）のソースアーティファクトで利用できます。

**削除：** この機能とそのコードは使用できません。

## 7.3で廃止予定の機能

7.3で廃止予定の機能は次のとおりです。

| 機能                                                | 利用可能                                                                                                                                                                         | メモ                                                                                                                                                                       |
|:------------------------------------------------- |:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 中央認証サービス（CAS）                                     | バンドル                                                                                                                                                                         | 7.2で廃止。 [ SAMLベースの認証](../../securing-liferay/configuring-sso/authenticating-with-saml.md)に移行。                                                                            |
| 動的データリスト(DDL)                                     | バンドル                                                                                                                                                                         | Liferay 7.4でLiferay Objectに置き換えられます。                                                                                                                                     |
| Elasticsearch 6コネクタ                               | 削除                                                                                                                                                                           | Elasticsearch 7コネクタに置き換えられました。                                                                                                                                           |
| Flashウィジェット                                       | 削除                                                                                                                                                                           | 直接の置換はありません。 [FlashPlayerのライフ終了は](https://www.adobe.com/products/flashplayer/end-of-life.html)2020年12月31日です。                                                             |
| Internet Explorer 11（IE11）ブラウザのサポート               | バンドル                                                                                                                                                                         | IE11のサポートを有効にしてMicrosoft Edgeに切り替え。                                                                                                                                      |
| JAASサポート                                          | バンドル                                                                                                                                                                         | 直接の置換はありません。                                                                                                                                                             |
| JQueryのデフォルトのグローバルLiferay変数                       | バンドル（無効）                                                                                                                                                                     | jQuery third-party [System Settings](../../../system-administration/configuring-liferay/system-settings.md)で`Enable jQuery`プロパティを`true` と設定すれば、以前の挙動に戻すことが可能です。          |
| Liferayブックマーク                                     | アーカイブ                                                                                                                                                                        | 直接の置換はありません。                                                                                                                                                             |
| Liferay Mobile Device Detection Lite              | アーカイブ                                                                                                                                                                        | 直接の置換はありません。                                                                                                                                                             |
| Liferayプッシュ                                       | マーケットプレース                                                                                                                                                                    | [ヘッドレスデリバリー](../../../headless-delivery/using-liferay-as-a-headless-platform.md)に置き換えられました。                                                                              |
| Liferay SyncコネクターとSyncクライアント                      | マーケットプレイスと[ダウンロード](https://web.liferay.com/downloads/liferay-sync)                                                                                                           | 直接の置換はありません。                                                                                                                                                             |
| OpenAM/OpenSSO                                    | バンドル                                                                                                                                                                         | 7.2で廃止。 [ SAMLベースの認証](../../securing-liferay/configuring-sso/authenticating-with-saml.md)に移行。                                                                            |
| Open ID                                           | マーケットプレイス                                                                                                                                                                    | [OpenID Connect](../../securing-liferay/configuring-sso/using-openid-connect.md)に置き換えられました。 7.2で廃止。                                                                      |
| アンケート                                             | バンドル                                                                                                                                                                         | フォームレポートに置き換えられました。                                                                                                                                                      |
| プロジェクトテンプレート：project-templates-activator          | [GitHub](https://github.com/liferay/liferay-blade-cli/tree/master/extensions)にアーカイブ済み                                                                                        | 置換はありません。                                                                                                                                                                |
| プロジェクトテンプレート：project-templates-freemarker-portlet | [GitHub](https://github.com/liferay/liferay-blade-cli/tree/master/extensions)にアーカイブ済み                                                                                        | 置換はありません。                                                                                                                                                                |
| Screens                                           | Github - iOS： [5.2.0](https://github.com/liferay/liferay-screens/releases/tag/5.2.0)、Android： [5.1.0](https://github.com/liferay/liferay-screens/releases/tag/5.1.0-android) | [モバイルSDK](https://help.liferay.com/hc/en-us/articles/360020447511-Mobile-SDK)および[ヘッドレスAPI](../../../headless-delivery/using-liferay-as-a-headless-platform.md)を使用してください。 |
| *ツール* カテゴリの検索ウィジェット（クラシック）                        | バンドル                                                                                                                                                                         | 7.1で廃止。 *検索機能*カテゴリの[検索機能ウィジェット](../../../using-search/search-pages-and-widgets/search-results/search-results.md)に置き換えられました。                                              |
| SOAP Webサービス                                      | バンドル（無効）                                                                                                                                                                     | Axis サーブレット (例：`http://localhost:8080/api/axis/`にサービスを公開する) は、このポータルプロパティ設定`axis.servlet.enabled`で有効にすることができます。 Liferayの`*SOAP`クラスは廃止されます。                               |
| テーマ：Fjord                                         | アーカイブ済み                                                                                                                                                                      | 直接の置換はありません。                                                                                                                                                             |
| テーマ：Hello World                                   | バンドル                                                                                                                                                                         | 直接の置換はありません。                                                                                                                                                             |
| テーマ：Porygon                                       | アーカイブ済み                                                                                                                                                                      | 直接の置換はありません。                                                                                                                                                             |
| テーマ：Westeros                                      | アーカイブ済み                                                                                                                                                                      | 直接の置換はありません。                                                                                                                                                             |
| 仮想インスタンス：仮想インスタンスごとのポータルプロパティファイル                 | アーカイブ済み                                                                                                                                                                      | コントロールパネルの仮想インスタンス設定に置き換えられました。                                                                                                                                          |
| Xuggler                                           | 削除済み                                                                                                                                                                         | 直接の置換はありません。                                                                                                                                                             |

以前のLiferayバージョンからアップグレードする場合は、以前のバージョンで廃止になった機能も考慮する必要があります。

* [7.2の非推奨事項とメンテナンスモードに移行した機能](./maintenance-mode-and-deprecations-in-7-2.md)
* [7.1の非推奨事項](https://help.liferay.com/hc/en-us/articles/360018403151-Digital-Experience-Platform-7-1-Deprecated-and-Removed-Items)
* [7.0の非推奨事項](https://help.liferay.com/hc/en-us/articles/360018123832-Digital-Experience-Platform-7-0-Deprecated-and-Removed-Items)

## 7.3でメンテナンスモードに移行された機能

7.3でメンテナンスモードに移行した機能は次のとおりです。

* Liferay Drools
* Liferayモバイルエクスペリエンス：モバイルSDK
* Liferayレポート
* サイトテンプレート

```{note}
Export/Importは以前メンテナンスモードに記載されていましたが、LiferayはExport/Importアプリケーションの改良を続けています。
```

## 追加情報

* [7.3 旧バージョンと非互換の変更](../../../liferay-internals/reference/7-3-breaking-changes.md)
* [7.3 Default Setting Changes](./default-setting-changes-in-7-3.md)
