# フォームの作成

**フォーム** アプリケーションで、複数フィールドのフォームを作成することができます。 必要な[プロセス自動化権限](./forms-permissions-reference.md)を持つ認証されたユーザーのみがフォームを作成できます。 最低でも、 **サイト管理** メニューと **フォーム** アプリケーションにアクセスする権限を持っている必要があります。 DXPのロールと権限の詳細は、[ロールと権限](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)をご覧ください 。

![デフォルトでは、フォームはリスト形式で表示されます。](./creating-forms/images/01.png)

## フォームの作成

以下のサンプルは、ホテルのゲスト用のフィードバック調査フォームです。

1. **プロダクトメニュー**（![Product Menu](../../../images/icon-product-menu.png)）を開き、 ［**サイト管理**］ メニューのコンパスアイコン（![Compass](../../../images/icon-compass.png)）をクリックします。 フォームを作成するサイトを選択します。
1. ［**コンテンツ & データ**］ &rarr; ［**Form**］ をクリックします。
1. **追加** ボタン（![Add](../../../images/icon-add.png)）をクリックします。 フォームビルダービューが表示されます。
1. フォームの名前を入力します（**Guest Feedback Survey**）。
1. 説明を入力してください。
1. ページ名を入力します。 入力しないと、デフォルト値 **Untitled Page (1 of X**) が使用されます。
1. **追加** ボタン（![Add](../../../images/icon-add.png)）をクリックして、 ［**要素を追加**］ サイドバーを表示します（まだ開いていない場合）。

    ![フォーム作成フォームでは、9つの項目タイプから選択できます。](./creating-forms/images/02.png)

1. ［**Select from List**］ フィールドをフォームビルダーにドラッグします。
1. 次の値を入力します。

    * **［Label**］ ： **訪問したホテルを評価してください。**
    * **［Help Text**］ ：現時点では空白のままにします。 フィールドの小見出しに追加のガイダンスを提供する場合は、これが役立ちます。
    * **［Required Field**］ セレクターでトグルを **YES** に切り替えます。
    * 選択リストのフォーム作成では手動オプションをオンのままにします。 データプロバイダーによるフィールドの入力については、 [データプロバイダー](../data-providers/using-the-rest-data-provider-to-populate-form-options.md)を参照してください。

1. ［**オプション**］ セクションに、アンケートの質問の値を入力します。

    * **Excellent**
    * **Good**
    * **Neutral**
    * **Bad**

    ```{note}
    いずれかのフィールドに入力すると、自動的に別の空白の選択行が追加されます。 完了したら、最後の1つは空白にしておいてください。
    ```

    ![リストオプションから選択](./creating-forms/images/03.png)

1. テキストフィールドなどの要素を追加するには、 ［**リストから選択**］ 要素の下に **テキストフィールド** 要素をドラッグアンドドロップします。
1. **テキストフィールド** の ［**基本**］ タブで、次のように入力します。

    * **ラベル** ： **コメント**
    * **ヘルプテキスト** ：空白のままにします。
    * **項目タイプ** ：長文のコメントを許可するには、 ［**複数行**］ ラジオボタンをクリックします。
    * **必須項目：** トグルを **NO** のままにします。

1. サイドバーを閉じます。
1. ［**フォームを保存**］ をクリックして、フォームをドラフトとして保存します。

### フォームページの追加

フォームに複数のページが必要な場合、Liferayのフォームは複数ページのフォームに対応しています。

フォームページを追加するには

1. フォームビルダービューに移動します。
1. 最初のフォームページの下部にある ［**New Page**］ ボタンをクリックします。

    ![フォームページを追加することができます。](./creating-forms/images/06.png)

1. 新しいフォームページは、フォームビルダーの下部に追加されます（ただし、成功ページの前）。
1. ページ名を入力します。
1. 追加の要素をドラッグアンドドロップします。
1. 必要に応じてさらにページを追加します。

Liferay 7.3では、既存のフォームページを並び替えることができます。 フォームビルダーでは、ページの右隅にある上下の矢印をクリックします。

![フォームページの並び替えができます。](./creating-forms/images/13.png)

### 成功ページの追加

［**Success Page**］は、フォームの送信者に、フォームの終わりに到達したことや、フォームが正常に送信されたことを知らせることで、解決策を提供します。

デフォルトの成功ページは使いやすくなっています。

![デフォルトの成功ページでは、フォーム送信が成功したことが明確に示されます。](./creating-forms/images/08.png)

成功ページが不要な場合は、デフォルトの成功ページのアクション（![Actions](../../../images/icon-actions.png)）ボタンをクリックし、 ［**Remove Success Page**］ を選択します。

成功ページをカスタマイズするには、

1. タイトルフィールド（デフォルトでは ［**Thank You**］）をクリックし、エディタボックスを使用します。
1. メッセージフィールド（デフォルトでは、 ［**Your information was...**］）をクリックし、エディタを使用して成功メッセージをカスタマイズします。

![デフォルトの成功ページはカスタマイズ可能です。](./creating-forms/images/12.png)

### フォームの公開

フォームが完成したら、 ［**公開**］ ボタンをクリックし、ターゲットオーディエンスに公開します。

フォームを公開すると、ユーザーに送信できるフォーム入力用のURLが生成されます。

![フォームが公開されると、共有できるURLが生成されます。](creating-forms/images/11.png)

詳細は、[フォームの共有](../sharing-forms-and-managing-submissions/sharing-forms.md)を参照してください。

## フォームの複製

フォームを複製して、ゼロから作成することなく、同様のフォームを作成できます。 フォームを複製するには、次の手順に従います。

1. ［**サイト管理**］ &rarr; ［**コンテンツ& データ**］ &rarr; ［**Form**］ に移動します。
1. 元のフォームの横にある **アクション** ボタン (![Actions](../../../images/icon-actions.png))をクリックします。

    ![フォームの複製](./creating-forms/images/10.png)

1. ［**Duplicate**］ をクリックします。

これで、元の調査フォームのコピーが生成されます。 ユーザーは複製フォームの変更を開始できます。

![複製フォームの生成](./creating-forms/images/05.png)

## 次のステップ

* [フォームの共有](../sharing-forms-and-managing-submissions/sharing-forms.md)
* [フォームエントリの管理](../sharing-forms-and-managing-submissions/managing-form-entries.md)
* [テキストおよび数値フィールドエントリの検証](./validating-text-and-numeric-field-entries.md)
* [フォーム送信でのCAPTCHAの有効化](../sharing-forms-and-managing-submissions/enabling-captcha-on-form-submissions.md)
* [フォーム構成リファレンス](./forms-configuration-reference.md)
