# 表示/非表示ルールの使用

ユーザーは、 **表示** アクションを使って、条件を満たした場合にフィールドを表示することができます。 条件を満たさない場合、このフィールドは非表示になります。

この例では、2つのテキストフィールドを持つ[キャンプ登録フォーム](../creating-and-managing-forms/creating-forms.md)を使用しています。

* **I am 18 Years Old or Older** : ［**Yes**］ と ［**No**］ の2つのオプションを持つ必須の単一選択フィールド。
* **Legal Guardian Email Address** : 有効なメールアドレスを受け付けるテキストフィールド。

<a name="configuring-the-show-action-rule" />

## 表示アクションルールの設定

表示/非表示アクションルールを設定するには：

1. ［**ルール**］ タブをクリックします。
1. 追加（![Add](../../../images/icon-add.png)）ボタンをクリックします。
1. ［**If**］ ドロップダウンメニューから ［**I am 18 Years Old or Older**］ を選択します。
1. 次のドロップダウンメニューから ［**と等しい**］ を選択します。
1. 3番目のドロップダウンメニューから ［**Value**］ を選択します。
1. 最後のドロップダウンメニューから ［**No**］ を選択します。

    ![条件やアクションを定義することで、フォームルールを素早く構築できます。](./using-the-show-hide-rule/images/01.png)

1. ［**アクション**］ セクションで、ドロップダウンメニューから ［**表示**］ を選択します。
1. 2つ目の［Options］ドロップダウンメニューから ［**Legal Guardian Email Address**］ を選択します。
1. 完了したら、 ［**保存**］ をクリックします。

     ![保存されたルールは、その機能が簡単に理解できるように表示されます。](./using-the-show-hide-rule/images/02.png)

これで、ユーザーが ［**I am 18 years old or older**］ フィールドで ［**No**］ を選択した場合にのみ、 ［**Legal Guardian Email Address**］ フィールドが表示されます。

<a name="additional-information" />

## 関連トピック

* [フォームの作成](../creating-and-managing-forms/creating-forms.md)
* [フォームルールの概要](./form-rules-overview.md)
* [必須ルールの使用](./using-the-require-rule.md)
* [Using the Enable Rule](./using-the-enable-disable-rule.md)
* [ページへ移動ルールの使用](./using-the-jump-to-page-rule.md)
* [自動入力ルールの使用](./using-the-autofill-rule.md)
* [計算ルールの使用](./using-the-calculate-rule.md)
