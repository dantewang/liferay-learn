# 他のユーザーとのドキュメントの共有

DXPの **ドキュメントとメディア** アプリを使用すると、ユーザーはファイルを相互に直接共有できます。

共有を無効にすることができます。 手順については、 [共有の有効化と構成](./enabling-and-configuring-sharing.md) を参照してください。

共有するときは、そのファイルに対する自分自身の権限の一部を受信ユーザーに付与します。 重要な注意事項がいくつかあります。

* 付与できるのは、表示、コメント、またはアップデート権限のみです。 たとえば、ファイルに削除権限やチェックアウトを無効にする権限がある場合でも、それらの権限を付与することはできません。
* ファイルに対して自分が持っている権限のみを付与できます。 たとえば、ファイルに対する表示権限とコメント権限しかない場合は、アップデート権限を付与することはできません。
* 少なくとも表示権限を付与する必要があります。
* 従来の[ロールベースの権限](../../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)は、共有権限よりも常に優先されます。 したがって、共有によって権限を拡張することはできますが、ポータルのロールを介して付与された権sharing-documents-with-other-users.md限を削除することはできません。
* デフォルトでは、ゲストロールにはディスカッションの追加権限があります。 これは、共有のコメント権限と重複しています。 したがって、コメント権限が共有によって付与されたかどうかに関係なく、すべてのユーザーがファイルにコメントできます。 これを変更するには、ゲストロールからディスカッションの追加権限を削除します。

また、受信ユーザーは同じインスタンスの一部である必要がありますが、同じサイトのメンバーである必要はないことに注意してください。

<a name="sharing-files-in-documents-and-media" />

## 統合

ドキュメントとメディアライブラリをMicrosoftOffice365™またはGoogleドライブと統合できます。 詳細は、 [Microsoft Office 365でドキュメントの作成と編集を有効にする](../../devops/enabling-document-creation-and-editing-with-microsoft-office-365.md) 、 [Googleドライブドキュメントへのリンクを有効にする](../../devops/google-drive-integration/enabling-links-to-google-drive-documents.md) 、および [Googleドライブでドキュメントの作成と編集を有効にする](../../devops/google-drive-integration/enabling-document-creation-and-editing-with-google-drive.md) を参照してください。

最後に、WebDAVを使用して、ファイルマネージャーからドキュメントにアクセスできます。 詳細は、 [WebDAVを使用したドキュメントへのアクセス](../accessing-documents-with-webdav.md) を参照してください

<a name="working-with-shared-files" />

## ドキュメントとメディアでのワークフローの使用

DXPの[ワークフロー](../../../../process-automation/workflow/introduction-to-workflow.md)を使用して公開設定を管理できます。ドキュメントとメディアに対してワークフローが有効になっている場合、ドキュメントは公開される前にレビューされる必要があります。 ドキュメントとメディアに対しワークフローを有効化する詳細は、 [ワークフローのアクティブ化](../../../../process-automation/workflow/using-workflows/activating-workflow.md#activating-workflow-for-specific-applications) を参照してください。

1. 共有するファイルをクリックします（例：`speech.txt`）。
1. **情報** ボタンをクリックして、情報パネルを展開します。

<a name="managing-shared-files" />

## バックアップとインポート / エクスポート

1. ［**共有**］ をクリックします。
1. コラボレーターのメールアドレスを入力します。 複数のアドレスを入力できます。
1. 受信ユーザーにファイルを共有させるには、 ［**Allow the document to be shared with other users**］ ボックスをオンにします。
1. 受信ユーザーに付与するファイルの権限を選択します。 受信ユーザーに付与する次のファイル権限のいずれかを選択します。

<a name="additional-information" />

## メディアギャラリー

    ![受信ユーザーに付与する権限を選択します。](./sharing-documents-with-other-users/images/03.png)

1. ウィンドウペインの ［**共有**］ ボタンをクリックします。

ファイルが共有されました。

### サイト管理の使用

次の手順に従って、ファイルを共有します。

1. **サイト管理** にアクセスするには、 **メニュー**（![Product Menu](../../../../images/icon-menu.png)）を開き、サイトの名前をクリックします。
1. ［**Content & Data**］ &rarr; ［**ドキュメントとメディア**］ の順にクリックします。
1. 共有するファイルが配置されているフォルダ（たとえば、 **HR** フォルダ）に移動します。
1. ファイルの **アクション** ボタン（![Actions](../../../../images/icon-actions.png)）をクリックし、 ［**共有**］ を選択します。 ［共有］ダイアログが開きます。

    ![アクション &rarr; ［共有］をクリックします。](./sharing-documents-with-other-users/images/04.png)

1. ファイルを共有するユーザーの名前またはメールアドレスを入力します。 ファイルを複数のユーザーと共有するには、各ユーザーの電子メールアドレスをカンマ区切りリストに入力します。
1. 受信ユーザーにもファイルを共有させるには、 ［**Allow the document to be shared with other users**］ を選択します。
1. 受信ユーザーに付与するファイルの権限を選択します。

    * **アップデート：** 表示、コメント、およびアップデート。
    * **コメント：** 表示およびコメント。
    * **View：** 閲覧のみ。

1. ［**共有**］ をクリックします。

<a name="working-with-shared-files" />

## 共有ファイルの操作

共有されているファイルには、次の3か所でアクセスできます。

* **ドキュメントとメディアライブラリ：** 共有されているファイルは、既存のドキュメントとメディアの場所に表示されます。 たとえば、誰かがドキュメントとメディアライブラリのホームフォルダにあるファイルをあなたと共有している場合、そのフォルダ内のファイルにアクセスできます。

    ![共有ファイルは、ファイルが最初にアップロードされたフォルダと同じフォルダにあります。](./sharing-documents-with-other-users/images/05.png)

* **通知アプリ：** ファイルがあなたと共有されると、通知が届きます。 通知をクリックすると、ドキュメントとメディアのファイルに移動します。 通知の詳細は、 [通知とリクエストの管理](../../../../collaboration-and-social/notifications-and-requests/user-guide/managing-notifications-and-requests.md) を参照してください。

    ![通知アプリには、ユーザーがファイルをあなたと共有したときに送信される通知が含まれています。](./sharing-documents-with-other-users/images/06.png)

* **共有コンテンツアプリ：** ユーザーメニューからこのアプリにアクセスできます。 あなたと共有されたすべてのコンテンツと、あなたが共有したコンテンツが一覧表示されます。 各ファイルには、ファイルに対して許可されたアクション（表示、コメント、アップデートなど）を実行するためのアクションボタン（![Actions](../../../../images/icon-actions.png)）があります。

    ![共有コンテンツアプリには、あなたと共有されているファイルと、あなたが共有したファイルが一覧表示されます。](./sharing-documents-with-other-users/images/07.png)

<a name="managing-shared-files" />

## 共有ファイルの管理

ファイルを共有した後、ユーザーごとにファイルの共有を解除したり、権限を変更したりできます。 これは、管理者、ファイルの所有者、またはアップデート権限とファイルを共有する権限を持つユーザーのみが実行できます。 これらのアクションは、ドキュメントとメディアのファイルの情報パネルから実行できます。 次の手順を実行します：

1. ドキュメントとメディアでファイルをクリックしてから、右上の情報ボタン（![Info](../../../../images/icon-information.png)）をクリックします。 ファイルの情報パネルが右からスライドします。

1. ［**コラボレーター管理**］ リンクをクリックします。 ファイルを共有したユーザーと彼らのファイル権限のリストが表示されます。

   ![［コラボレーター管理］をクリックして、ファイルを共有したユーザーのリストを開きます。](./sharing-documents-with-other-users/images/08.png)

1. コラボレーターのリストに必要な変更を加えます。 あるユーザーとの共有を解除するには、そのユーザーの横にある `×` アイコンをクリックします。 各ユーザーのセレクターメニューからファイルの権限を変更することもできます。

   ![コラボレーターを削除するか、彼らの権限を変更します。](./sharing-documents-with-other-users/images/09.png)

1. ［**保存**］ をクリックしてダイアログを閉じます。

<a name="additional-information" />

## 追加情報

  - [ドキュメントとメディアUIリファレンス](../../documents-and-media-ui-reference.md)
  - [フォルダの作成](../../uploading-and-managing/creating-folders.md)
  - [ファイルのアップロード](../../uploading-and-managing/uploading-files.md)
  - [ファイルストレージの構成](../../../../system-administration/file-storage.md)
