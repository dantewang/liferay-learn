---
toc:
- ./staging/understanding-the-publishing-process.md
- ./staging/configuring-local-live-staging.md
- ./staging/configuring-remote-live-staging.md
- ./staging/managing-data-and-content-types-in-staging.md
- ./staging/page-versioning.md
- ./staging/publishing-single-assets-and-widgets.md
- ./staging/configuring-automatic-publishing-of-displayed-content.md
- ./staging/managing-staging-permissions.md
- ./staging/using-staging-in-asset-libraries.md
- ./staging/site-staging-ui-reference.md
---

# ステージングの概要

```{toctree}
:maxdepth: 3

staging/understanding-the-publishing-process.md
staging/configuring-local-live-staging.md
staging/configuring-remote-live-staging.md
staging/managing-data-and-content-types-in-staging.md
staging/page-versioning.md
staging/publishing-single-assets-and-widgets.md
staging/configuring-automatic-publishing-of-displayed-content.md
staging/managing-staging-permissions.md
staging/using-staging-in-asset-libraries.md
staging/site-staging-ui-reference.md
```

Liferayのステージングアプリケーションは、本番環境に変更を公開する前に、サイトまたはアセットライブラリに変更を加えるための作業環境を提供します。 このアプリケーションを使用すると、ステージングされたアプリケーションデータとページをバックグラウンドで変更し、準備ができ次第、本番環境で着信ユーザのトラフィックを処理している間に、個別にあるいは全体として変更を公開することができます。

```{important}
Liferay Commerceはステージングをサポートしていません。 公開設定プロセス中、コマースのエンティティはステージングされません。 
```

ステージングを設定するときは、サイトまたはアセットライブラリをローカル（つまり、同じサーバー上）でホストするか、リモート（つまり、ネットワークで接続された別々のサーバー上）でホストするかを決定します。 次に、ステージングするアプリケーションデータをカスタマイズします。 サイトの場合、ウィジェットページとコンテントページのページバージョニングを有効にすることもできます。

```{important}
Liferay DXP 7.4および7.3.10 FP1から、アセットライブラリでステージングがサポートされています。 ただし、ステージングされたサイトとステージングされたアセットライブラリのみを接続し、その逆もまた然りです。 詳しくは、 [アセットライブラリでのステージングの使用](./staging/using-staging-in-asset-libraries.md) をご覧ください。
```

## 設定オプション

ステージングを設定するには、 ［**ローカル現行環境ステージング**］ と ［**リモート本番環境ステージング**］ の2つのオプションがあります。

**ローカル現行環境ステージング** ：ステージング環境と本番環境の両方を同じLiferayサーバーでホストできます。 有効にすると、Liferay DXPは、ステージング環境として機能するサイトまたはアセットライブラリのローカルクローンを作成し、元のサイトまたはアセットライブラリが本番環境になります。

**リモート本番環境ステージング** ：ステージング環境と本番環境を別々のLiferayサーバーでホストできます。 有効にすると、ステージングの構成に使用されるサイトまたはアセットライブラリがステージング環境になり、構成されたリモートサーバーが本番環境になります。

どちらのオプションも、ステージングされたページ、アプリケーション、およびコンテンツの管理と公開に同じインターフェイスを使用しますが、セットアップが異なります。 ニーズに最適な設定オプションを選択したら、 [ローカル現行環境ステージングの設定](./staging/configuring-local-live-staging.md) または [リモート本番環境ステージングの設定](./staging/configuring-remote-live-staging.md) を参照してセットアップ手順を確認してください。

### ステージングされたデータとコンテンツタイプ

ステージング設定の一部として、ステージングするコンテンツグループとアプリケーションデータを選択できます。 ステージングされると、選択されたデータとコンテンツはステージング環境によって管理されます。 また、アプリケーションまたはコンテンツグループを選択すると、含まれているすべてのエンティティ（アプリケーションフォルダなど）もステージングされます。 詳細は、[ステージングでのデータとコンテンツタイプの管理](./staging/managing-data-and-content-types-in-staging.md)を参照してください。

### ページバージョニング

サイトのステージングを構成するときに、 **ページバージョニング** 機能を有効にできます。 この機能により、サイトのコンテンツページとウィジェットページのバリエーションを同時に開発することができます。 ページバージョンの完全な履歴を確認し、必要に応じてページを以前のバージョンに戻すことができます。 バリエーションの作成と管理の方法については [ページバージョニング](./staging/page-versioning.md) を、各バリエーションの権限を管理する方法については[ステージング権限の管理](./staging/managing-staging-permissions.md)を参照してください。

```{note}
Liferay DXP 7.4、7.3フィックスパック1、および7.2フィックスパック11以降では、ウィジェットページとコンテンツページでページバージョニングを使用できます。 以前のバージョンでは、ウィジェットページのバリエーションしか作成できませんでした。 各ページタイプのバリエーションの詳細については、 [Types of Variations](./staging/page-versioning.md#types-of-variations) を参照してください。
```

## 公開プロセスを理解する

下位の観点からは、ステージングは、エンティティが別の場所にミラーリングされる同値関係です。 高度な観点からは、ステージングプロセスは、エクスポート、検証、およびインポートの3つの連続したフェーズで実行されます。

このプロセスを理解すると、効率が向上し、シームレスな公開エクスペリエンスを実現するための事前の計画に役立ちます。 詳細は、[公開プロセスを理解する](./staging/understanding-the-publishing-process.md)を参照してください。

```{raw} html
:file: ../../landingpage_template.html
```

```{raw} html
:file: staging/landing.html
```
