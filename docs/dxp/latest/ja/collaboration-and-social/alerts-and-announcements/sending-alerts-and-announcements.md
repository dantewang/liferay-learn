# 警告とお知らせの送信

警告ウィジェットまたはお知らせウィジェットを使用して、重要な情報を送信できます。

警告ウィジェットは、優先度の高い情報（たとえば、計画されたダウンタイム警告、セキュリティ警告など）を表示するように設計されています。 各警告には、赤い ［**重要**］ タグのラベルが付いています。

![赤い重要タグが付いた警告の例。](./sending-alerts-and-announcements/images/01.png)

お知らせウィジェットには、送信したい他のすべての情報を表示できます。 各お知らせには赤いタグがありません。 重要な警告と日常的なお知らせを分けるために、警告ウィジェットとお知らせウィジェットを別のページに配置することができます。 ただし、どちらのウィジェットを使用しても、必要な情報を表示できます。

赤い ［**重要**］ タグを除き、両者の機能は同じです。 警告とお知らせを特定のユーザーグループに限定することもできます。

これらのウィジェットには2つのタブがあります。

**未読:** 未読の期限切れでない警告/お知らせ。

**既読:** 期限切れ、または既読の警告/お知らせ。

<a name="creating-alerts-and-announcements" />

## 警告とお知らせの作成

1. ページの上部にある **追加** アイコン（![Add icon](../../images/icon-add-app.png)）をクリックして、ウィジェットを追加します。 ［NEWS］セクションの下にある［Alert］ウィジェットまたは［Announcements］ウィジェットを見つけて、ページにドラッグします。

    ![警告ウィジェットまたはお知らせウィジェットを見つけて、ページに追加します。](./sending-alerts-and-announcements/images/02.png)

1. 警告やお知らせを作成するには、 ［**警告を追加する**］ または ［**お知らせの追加**］ をクリックします。 新しいウィンドウが開きます。

    ![警告またはお知らせを作成するための新しいウィンドウが開きます。](./sending-alerts-and-announcements/images/03.png)

1. ［タイトル］フィールドを使用して、警告またはお知らせにタイトルを付けます。 ［コンテンツ］フィールドにテキストを追加します。

1. 下の ［**設定**］ セクションで追加設定を行います。

1. 完了したら、 ［**保存**］ をクリックします。 警告/お知らせがウィジェットに表示されます。

**配信範囲:** 警告/お知らせが表示される範囲。 デフォルトの［一般］範囲では、警告/お知らせが全員に送信されます。 また、サイトや特定のロールを選択することもできます。

**URL:** 警告/お知らせに含めるURL（オプション）。 たとえば、ニュース記事に関するお知らせには、ニュース記事へのリンクを含めることができます。 URLは有効で、`http://`または`https://`で始まるものでなければなりません。

**タイプ:** 警告/お知らせの種類。 これは、［一般］、［ニュース］、［テスト］のいずれかです。 なお、ユーザーは警告/お知らせの種類ごとに異なる配信メカニズムを指定することができます。 詳細は、 [ユーザー設定](#user-configuration) を参照してください。

**重要度:** お知らせの重要度。 これは［正常］または［重要］のいずれかです。 警告は常に重要度が高いため、この機能は警告に対しては無効になっています。

**公開開始日時:** 警告/お知らせを表示する日付。 これにより、警告/お知らせがいつ送信され、ウィジェットに表示されるかが決まります。 デフォルトでは、 ［**Display Immediately**］ ボックスがオンになっています。 この場合、表示される日付が作成日と同じになります。 カスタムの公開開始日時を入力するには、このボックスをオフにします。 たとえば、後日表示するように警告/お知らせを作成できます。 この日付は、数日、数週間、数か月、または数年先に設定できます。 ［Display Immediately］ボックスのチェックを外した後、［公開開始日時］フィールドをクリックすると日付ピッカーが開きます。

**有効期限:** 警告/お知らせの有効期限が切れる日時。 有効期限が切れた警告/お知らせは、ウィジェットの［既読］タブに表示されます。 ［有効期限］フィールドをクリックすると、日付ピッカーが開きます。

<a name="user-configuration" />

## ユーザー設定

ユーザーはお知らせの受信方法を設定できます。

1. 右上のユーザープロファイルをクリックし、 ［**アカウント設定**］ をクリックします。

1. ［**Preferences**］ タブをクリックして、 ［**通知設定**］ オプションを見つけます。

    ![［Preferences］タブをクリックして、設定を確認します。](./sending-alerts-and-announcements/images/06.png)

1. 警告とお知らせは、ウィジェットが構成されているページに常に表示されます。 ユーザーは、警告とお知らせを電子メールで受信することもできます。 ［一般］、［ニュース］、または［テスト］タイプから選択します。

1. 完了したら、 ［**保存**］ をクリックします。

<a name="alert-and-announcement-roles" />

## 警告とお知らせのロール

ユーザーのロールを作成して、警告とお知らせを管理できるようにすることもできます。

1. ［**アプリケーションメニュー**］ アイコン（![Applications Menu icon](../../images/icon-applications-menu.png)）&rarr; ［**コントロールパネル**］ &rarr; ［**ロール**］ をクリックします。

1. ［**標準ロール**］ タブが選択されている状態で、 **追加** アイコン（![Add icon](../../images/icon-add.png)）をクリックします。 ［新規ロール］フォームが開きます。

1. ロールの名前を 「**お知らせ**」 とし、タイトルと説明をつけて、 ［**保存**］ をクリックします。

1. ロールの **オプション** アイコン（![Options icon](../../images/icon-options.png)）をクリックし、 ［**編集する**］ をクリックします。

1. ［**権限の定義**］ タブをクリックします。

    ［コントロールパネル］で、 ［**通常権限**］ をクリックし、 ［**通常のお知らせを追加する**］ を選択します。 ［**保存**］ をクリックします。

    ![これらのオプションの［権限の定義］タブをクリックします。](./sending-alerts-and-announcements/images/07.png)

    ［権限の定義］タブに戻ります。 ［**サイトとアセットライブラリの管理**］ &rarr; ［**Applications**］ &rarr; ［**Announcements**］ に移動します。 すべてのResource Permissionsを選択し、 ［**Save**］ をクリックします。

1. これで、このロールに割り当てられたすべてのユーザーが警告とお知らせを管理できるようになりました。
