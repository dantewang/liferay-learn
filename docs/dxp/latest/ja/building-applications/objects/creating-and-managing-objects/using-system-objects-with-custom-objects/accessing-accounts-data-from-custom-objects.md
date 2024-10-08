# カスタムオブジェクトからアカウントデータにアクセスする

{bdg-secondary}`Liferay 7.4 U35+/GA35+`

いくつかのユースケースでは、カスタムオブジェクトからアカウントデータにアクセスしたい場合があります。 例えば、カスタム返品アプリケーションを構築している場合、返品リクエストを作成する際に、希望するアカウントと住所を選択するようユーザーに求めることができます。 このシナリオでは、ユーザーは返品アプリケーションで既存のアカウントとアドレスのエントリーにアクセスする必要があります。

これを実現するために、Liferayは［Objects］管理画面で［Account］と［Postal Address］のアプリケーションにアクセスできるようにしています。 ここでは、それらとカスタムオブジェクトの関連を定義することができます。 一度定義すれば、ユーザーはカスタムオブジェクトの生成された関連フィールドを使用して、希望するアカウントと住所のエントリーを選択することができます。

![［Account」と［Postal Address」オブジェクトからカスタムオブジェクトへの関連を作成します。](./accessing-accounts-data-from-custom-objects/images/01.png)

```{note}
［Account］オブジェクトは一般的なアカウントデータ（名前、電子メールなど）を格納し、［Postal Address］オブジェクトはアカウントの請求先住所と配送先住所を格納します。 住所のエントリーは、アカウントUIで作成され、作成された個々のアカウントに限定されます。
```

カスタムオブジェクトを［Accounts］および［Postal Address］システムオブジェクトに関連付ける場合、これらの関連はシステムオブジェクト側で定義し、1対多のタイプを使用する必要があります。 カスタムオブジェクトは、両方の関連の多数側である必要があります。

以下の手順に従って、カスタムオブジェクトからアカウントと住所のエントリーにアクセスする関連を設定してください。

1. **グローバルメニュー**（![Global Menu](../../../../images/icon-applications-menu.png)）を開き、 ［**コントロールパネル**］ タブに移動して、 ［**オブジェクト**］ をクリックします。

1. ［**Accounts**］ オブジェクトの編集を開始します。

1. ［**Relationships**］ タブを開き、 **追加** ボタン (![Add Button](../../../../images/icon-add.png)) をクリックします。

1. **ラベル** と **名前** を入力します。

1. ［Type］で、［**One to Many**］を選択します。

1. ［Object］では、 **カスタムオブジェクト** を選択します。

   ![［Account］オブジェクトからカスタムオブジェクトへの一対多の関連を作成します。](./accessing-accounts-data-from-custom-objects/images/02.png)

1. ［**Save**］ をクリックします。

1. ［Objects］管理ページに戻り、 ［**Postal Address**］ オブジェクトの編集を開始します。

1. ［**Relationships**］ タブを開き、 **追加**(![Add Button](../../../../images/icon-add.png)) をクリックします。

1. **ラベル** と **名前** を入力します。

1. ［Type］で、［**One to Many**］を選択します。

1. ［Object］については、前回の関連と同じ **カスタムオブジェクト** を選択します。

1. ［Parameter］については、先に作成した ［**Account］オブジェクトと** カスタムオブジェクトの関連を選択します。

   これは、［Postal Address］のエントリーが特定のアカウントに限定されているために必要です。 このパラメーターは、利用可能なアドレスがアカウント関連のフィールド値に依存する従属リレーションシップを設定します。

   ![［Postal Address］オブジェクトからカスタムオブジェクトへの一対多のリレーションを作成し、カスタムオブジェクトの［Account］関連をパラメーターとして使用します。](./accessing-accounts-data-from-custom-objects/images/03.png)

1. ［**Save**］ をクリックします。

1. カスタムオブジェクトのデフォルトレイアウトとビューに、関連フィールドを追加します。 詳細な手順については、 [オブジェクトレイアウトの設計](../layouts/designing-object-layouts.md) および [オブジェクトビューの設計](../views/designing-object-views.md) を参照してください。

   ![カスタムオブジェクトのデフォルトレイアウトとビューに、関連フィールドを追加します。](./accessing-accounts-data-from-custom-objects/images/04.png)

追加されると、ユーザーはカスタムオブジェクトで利用可能なアカウントとアドレスから選択できるようになります。 利用可能なアカウントオプションは、ユーザーのアカウントメンバーシップに依存し、利用可能なアドレスは、選択したアカウントに依存します。

![ユーザーは、カスタムオブジェクトで利用可能なアカウントとアドレスから選択することができます。](./accessing-accounts-data-from-custom-objects/images/05.png)

```{tip}
デフォルトでは、オブジェクトはタイトルフィールドにエントリーIDを使用します。 タイトルフィールドの値は、関連フィールドの各エントリーオプションがエンドユーザーにどのように表示されるかを決定します。 必要であれば、オブジェクトごとに異なるフィールドをタイトルに使用するよう設定することで、読みやすさを向上させることができます。

これを行うには、目的のオブジェクト定義の編集を開始し、*Details*タブに移動し、*Title Field*に異なる値を選択します。 終了したら、*保存*をクリックします。
```

## 関連トピック

* [アカウント](../../../../users-and-permissions/accounts.md)
* [システムオブジェクトの拡張](../extending-system-objects.md)
* [オブジェクトリレーションの定義](../relationships/defining-object-relationships.md)
* [アカウントによるオブジェクトデータへのアクセス制限](./restricting-access-to-object-data-by-account.md)
