# 通知テンプレートの使用

店舗でのイベントに応じて、ユーザーに自動的にメール通知が送信されます。 送信するには、まず **Notification Template** を作成する必要があります。 通知テンプレートは、電子メール通知の送信者、トリガー、およびコンテンツを定義します。

```{note}
Liferay Commerce の Notification を使用するには、まず Liferay システムのメール設定を行います。 詳しくは、 [メールの設定](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/setting-up-liferay/configuring-mail.html) をご覧ください。
```

## イベントトリガー

すべての通知テンプレートは、通知をトリガーするチャネルイベントを決定するタイプを持っています。 Commerceには、通知テンプレートとして以下のイベントトリガーがあります。

| 通知タイプ                | イベント                                      |
|:-------------------- |:----------------------------------------- |
| 注文済み                 | チャンネルに注文が入る。                              |
| 注文処理                 | 注文は現在進行中です。                               |
| 注文は出荷待ちです            | 注文した商品は発送準備に入ります。                         |
| 注文を一部出荷しました          | 注文商品は別送となります。                             |
| 注文を出荷しました            | 注文が発送されました。                               |
| 注文が完了しました            | 注文は配送され、完了と表示されました。                       |
| サブスクリプションを更新しました     | 契約更新が行われた。                                |
| サブスクリプションが有効になりました   | サブスクリプションが有効になります。                        |
| サブスクリプションが中断されました    | サブスクリプションは、ストアによるレビューまたはアクションを待って、中断されます。 |
| サブスクリプションがキャンセルされました | 購読を中止する。                                  |

## 通知テンプレートの作成

1. **Global Menu**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **Control Panel** &rarr; **Commerce** &rarr; **Channels** を開きます。

1. **チャンネル** を選択し、 **Notification Templates** タブを表示します。

   ![チャンネルを選択し、Notification Templatesタブを表示します。](./using-notification-templates/images/01.png)

1. **追加**（![Add Button](../../images/icon-add.png)） をクリックします。

1. テンプレートには、 **名前** と **説明** を入力します。

1. イベントタイプを選択し、どのチャンネルイベントが通知のトリガーとなるかを決定します。 各テンプレートは、1つのトリガーしか持つことができません。

1. スイッチを切り替えると、テンプレートが有効になります。

   ![名前と説明を入力し、イベントの種類を選択し、テンプレートを有効にします。](./using-notification-templates/images/02.png)

1. ［メール設定］で、通知の **送信者** と **受信者** を入力します。

   テンプレート変数を使用すると、トリガーとなるイベントのデータを使用して、これらのフィールドに自動的に入力することができます。 詳しくは、 [通知テンプレート変数リファレンスガイド](./notification-template-variables-reference-guide.md) を参照してください。

   ![メールの送信者、受信者を入力します。](./using-notification-templates/images/03.png)
1. ［メール内容］セクションで、メールの **件名** と **本文** を入力します。

   テンプレート変数を使用すると、トリガーとなるイベントのデータを使用して、これらのフィールドに自動的に入力することができます。 詳しくは、 [通知テンプレート変数リファレンスガイド](./notification-template-variables-reference-guide.md) を参照してください。

   ![メールの件名と本文を入力します。](./using-notification-templates/images/04.png)

1. ［**Save**］ をクリックします。

有効にすると、通知テンプレートはトリガーされたときに自動的にメールを送信します。 Notification Queue] タブには、トリガーされたすべての通知が、その送信者、受信者、イベントタイプ、ステータス、および優先度とともに表示されます。

## 注文のお知らせメールを見る

注文に関連するメール通知を追跡しています。 表示するには、 **グローバルメニュー**(![Global Menu](../../images/icon-applications-menu.png)) を開き、 **コントロールパネル** &rarr; **コマース** &rarr; **オーダー** に移動してください。 注文を選択し、 **Emails**]タブをクリックします。 詳しくは、 [ご注文について](../../order-management/orders/order-information.md) をご覧ください。

![トリガーされた通知は、注文の［Eメール］タブで確認できます。](./using-notification-templates/images/05.png)

## Commerce 2.0以前

Commerce 2.0以前でメール通知を作成するには：

1. **サイト管理** &rarr; **コマース** &rarr; **設定** に移動します。

    ![サイト管理」メニューを開き、「Commerce」の「Settings」に移動します。](./using-notification-templates/images/06.png)

1. ［**通知**］ タブをクリックします。

1. ［**通知テンプレート**］ サブタブをクリックします。

1. **追加**(![Add icon](../../images/icon-add.png)) をクリックして、新しい Notification Template を作成し、次の情報を入力します。

   * **名前** ：新規注文
   * **説明** ：新規注文テンプレート
   * **アカウントグループ** ：（空白のままにするか、 **オプションの** アカウントグループを指定します）
   * **送信者メールアドレス** ：ストアのメールアドレス（例： **orders@yourstore.com**）
   * **送信者名** ：ストアまたは顧客サービス担当者の名前
   * **タイプ** ： 注文済み
   * **Enabled** : トグルを **YES** に切り替えます。
   * **件名** ：メールの件名（例： **ご注文を受け取りました**）
   * **本文** ： `[%ORDER_CREATOR%]`や`[%ORDER_ID%]`などの変数を使用して、それぞれ顧客の名前と注文IDを表すことができます。 詳細は、[通知テンプレート変数リファレンスガイド](./notification-template-variables-reference-guide.md)を参照してください。

   ![通知テンプレートの作成と設定は簡単です。](./using-notification-templates/images/07.png)

1. ［**保存**］ をクリックします。

通知テンプレートで、注文を受けた際に自動でメールを送信するようにしました。 テンプレートを作成すると、注文が入るたびに、新しい通知が通知キューに追加されます。 これを見るには、注文後に **Notifications Queue** サブタブを確認します。 デフォルトでは、Liferayインスタンスは15分ごとにキューをチェックし、未送信の通知を送信します。 間隔を変更する方法については、[コマース通知キューの構成](./configuring-the-commerce-notification-queue.md)参照してください。

## 追加情報

* [通知テンプレート変数リファレンスガイド](./notification-template-variables-reference-guide.md)
* [コマース通知キューの設定](./configuring-the-commerce-notification-queue.md)
