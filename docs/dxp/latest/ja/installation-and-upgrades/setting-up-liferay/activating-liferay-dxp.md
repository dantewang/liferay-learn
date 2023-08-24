# Liferay DXPのアクティブ化

> サブスクリプションが必要です。

Liferay DXPは、XML（`.xml` ） アクティベーションキーを使用してアクティブ化されます。  アクティベーションキーは、DXPサブスクリプション契約期間または試用契約を指定します。 [Liferay DXPを初めて実行する](../installing-liferay/running-liferay-for-the-first-time.md)と、ライセンスページが表示され、アクティベーションキーが要求されます。

![DXPを初めて実行すると、ライセンスページが表示されます。](./activating-liferay-dxp/images/01.png)

## キーを使用したDXPのアクティブ化

アクティベーションキーをお持ちの場合は、[Liferay Home](../reference/liferay-home.md)の`deploy`フォルダにコピーします。

```
[LIFERAY_HOME]
    ├── data
    ├── deploy
    │   └── my-license.xml
    ├── license
    ├── logs
    ├── osgi
    ├── patching-tool
    ├── tools
    └── work
```

登録を確認するメッセージがDXPコンソールに表示されます。

```bash
License registered ...
```

DXPを使用する準備が整いました。

## キーが必要な場合

エンタープライズサブスクリプションをお持ちの場合は、[［Activation Keys］](https://customer.liferay.com/activation-key)ページにアクセスしてアクティベーションキーをダウンロードするか、アクティベーションキーをリクエストしてください。

DXPをお試し中の場合、 [30日間の試用アクティベーションキー](https://www.liferay.com/products/dxp/30-day-trial)を取得してください。

```{note}
Liferay DXP 7.2以前でLiferay Connected Services（LCS）を使用している場合、LCSでDXPインスタンスをアクティブ化する手順については、[LCSのドキュメント](https://help.liferay.com/hc/en-us/articles/360017897492-Introduction-to-Managing-Liferay-DXP-with-Liferay-Connected-Services-)を参照してください。
```

## ライセンスマネージャー

ライセンスマネージャのページには、サーバーとライセンスの情報が表示されます。 このページを表示するには、アクティベーションページで _License Manager_ をクリックします。 または、以前に Liferay インスタンスをアクティベートしている場合は、管理者としてログインし、 _コントロールパネル_ &rarr; _ライセンスマネージャ_に移動します。

![ライセンスマネージャのページには、サーバーとライセンスの情報が表示されます。](./activating-liferay-dxp/images/02.png)

ライセンスのステータスが表示され（アクティブ、期限切れなど）、ライセンスの種類や有効期限などの情報も表示されます。

## Liferay DXPの再アクティブ化

新しいDXPアクティベーションキーがあり、DXPインスタンスがキーまたはLiferay Connected Services（LCS）によって現在アクティベートされている場合は、新しいアクティベーションキーをデプロイする前に、以前のアクティベーション方法の残余を削除することをお勧めします。 削除することで、使用しているアクティベーションキーのあいまいさがなくなります。

新しいキーでDXPを再アクティブ化する手順は次のとおりです。

1. アプリケーションサーバーを停止します。

1. LCSを使用してDXPをアクティブ化している場合は、[Liferay Home](../reference/liferay-home.md)の`osgi/marketplace`フォルダからLiferay Connected ServicesクライアントのLPKGファイル（`.lpkg`）を削除します。

1. `［Liferay Home］/data/license`フォルダの_コンテンツ_は削除しますが、フォルダは保持します。

1. `［Liferay Home］/osgi/modules`フォルダからすべての`activation-key-［...］.xml`ファイルを削除します。

1. アプリケーションサーバーを起動します。

1. 新しいアクティベーションキーファイルを`［Liferay Home］/deploy`フォルダにコピーします。

登録を確認するDXPコンソールメッセージが表示されます。

```bash
License registered ...
```

DXPを引き続き使用できます。

エンタープライズサブスクリプションがあり、さらにサポートが必要な場合は、[アカウントサポート](https://help.liferay.com/hc/en-us/articles/360018414031)に連絡するか、[サポートチケット](https://help.liferay.com/hc/requests/new)を作成してください。
