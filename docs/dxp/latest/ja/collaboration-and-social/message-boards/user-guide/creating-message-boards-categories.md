# 掲示板カテゴリの作成

掲示板カテゴリは、トピックごとにスレッドを整理します。 [必要な権限](./message-boards-permissions-reference.md)（少なくとも、 **カテゴリーを追加** 、 **サブカテゴリの追加**）を持つ認証されたユーザーのみが、カテゴリを作成できます。 DXPのロールと権限の詳細は、 [ロールと権限](https://help.liferay.com/hc/articles/360017895212-Roles-and-Permissions) をご覧ください 。

## カテゴリーを追加する

新しいカテゴリーを追加する最も一般的な方法は、 **Message Boards** ウィジェットを直接使用する方法です。

1. ［Message Boards］ウィジェットで、 ［**Add Category**］ ボタンをクリックします。

    ![掲示板のカテゴリーを追加します。](./creating-message-boards-categories/images/01.png)

1. カテゴリの名前を入力します（例： **Staff Introductions**）。
1. 説明を入力します。
1. カテゴリの ［**Display Style**］ を選択します。 これは、カテゴリ内のスレッドの表示方法をコントロールします。 デフォルトでは、次の表示スタイルを選択できます。

    ***デフォルト：** 一般的なディスカッションのためのクラシックな表示スタイル。
    ***質問：** スレッドは質問と回答のスタイルで表示されます。

    ![表示形式を選択します。](./creating-message-boards-categories/images/04.png)

1. ［**Mailing List**］ セクションで、 ［**Active**］ トグルを ［**NO**］ のままにして、カテゴリのメーリングリストを無効にします。 ［**YES**］ に切り替えた場合は、メールサーバーの設定を入力します。 詳細は、[Setting up Mail](../../../installation-and-upgrades/setting-up-liferay/configuring-mail.md)の記事をご覧ください。
1. 匿名ユーザーがカテゴリに投稿できないようにするには、 ［**Allow Anonymous Emails**］ トグルを ［**NO**］ ままにします。 その他、匿名ユーザーによるメール送信やカテゴリーへの投稿を許可したい場合は、スイッチを **YES** に切り替えてください。

    ![掲示板カテゴリーを設定します。](./creating-message-boards-categories/images/02.png)

1. ここでは、 ［**Viewable by**］ を ［**Anyone (Guest Role**)］ のままにします。 使用可能なさまざまな権限の詳細は、[掲示板の権限リファレンス](./message-boards-permissions-reference.md)を参照してください。
1. ［**Save**］ をクリックします。

新しいカテゴリがテーブルに表示されます。

新しいカテゴリが掲示板のホーム画面に表示されます。 リストには、カテゴリ名と、それぞれのサブカテゴリ、スレッド、投稿の数が表示されます。

## 権限の変更

以下の手順で、掲示板カテゴリに権限を設定します。

1. **アクション** アイコン（![Actions](../../../images/icon-actions.png)）と ［**カテゴリー**］ をクリックしてください。

1. ［**Permissions**］ をクリックします。

1. チェックボックスをオンにして、必要なロールに権限を付与します。

    各権限についての詳細は、 [掲示板の権限リファレンス](./message-boards-permissions-reference.md#general-category-permissions) を参照してください。

    ![掲示板カテゴリーの権限を変更します。](./creating-message-boards-categories/images/06.png)

1. 完了したら、 ［**Save**］ をクリックします。

## サブカテゴリーの追加

カテゴリーには、必要な数のサブカテゴリーを含めることができます。

次の手順に従って、サブカテゴリーをカテゴリーに追加します。

1. リストでカテゴリの名前をクリックします（上記の例の場合は **Staff Introductions**）。
1. **追加** アイコン（![Add](./../../../images/icon-add.png)）をクリックし、 ［**Categories**］ を選択します。
1. サブカテゴリの名前を入力します。
1. サブカテゴリの説明を入力します。
1. サブカテゴリは親カテゴリの設定を継承しますが、管理者とコンテンツ作成者はサブカテゴリの ［**表示形式**］ と ［**メーリングリスト**］ オプションの値を変更できます。
1. ［**Save**］ をクリックします。

サブカテゴリーがテーブルに表示されます。

![サブカテゴリーの追加](./creating-message-boards-categories/images/07.png)

## カテゴリの移動とマージ

管理者は、カテゴリを移動およびマージすることもできます。

次の手順に従って、カテゴリを移動したり、別のカテゴリとマージします。

1. カテゴリの **アクション** アイコン（![Actions](../../../images/icon-actions.png)）をクリックし、 ［**Move**］ を選択します。 カテゴリの移動フォームが表示されます。
1. ［**Parent Category**］ フィールドの下の ［**Select**］ ボタンを使用して、新しい親カテゴリを選択します。 このフィールドは、トップレベルのカテゴリでは空であることに注意してください。
1. カテゴリを選択した親カテゴリとマージする場合は、 ［**Merge with Parent Category**］ を選択します。
1. ［**Move**］ をクリックします。

    ![カテゴリーを移動し、マージします。](./creating-message-boards-categories/images/03.png)

カテゴリ（およびサブカテゴリ）の数に関係なく、カテゴリは掲示板のスレッドを整理するための単なるコンテナです。 スレッドの作成を開始するには、 [スレッドの作成](./creating-message-boards-threads.md) の記事を参照してください。

## 次のステップ

カテゴリといくつかのサブカテゴリを作成したら、[掲示板スレッド](./creating-message-boards-threads.md)の作成方法について学習します。

## 関連トピック

* [掲示板の設定リファレンス](./message-boards-configuration-reference.md)
