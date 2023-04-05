---
toc:
- ./accounts/account-users.md
- ./accounts/account-addresses.md
- ./accounts/account-groups.md
- ./accounts/account-roles.md
- ./accounts/account-management-widget.md
- ./accounts/using-workflow-with-accounts.md
---
# アカウント

```{toctree}
:maxdepth: 3

accounts/account-users.md
accounts/account-addresses.md
accounts/account-groups.md
accounts/account-roles.md
accounts/account-management-widget.md
accounts/using-workflow-with-accounts.md
```

{bdg-secondary}`7.4以降で利用可能`

アカウントは、管理者が様々な商取引やビジネスのニーズに合わせてユーザーを整理・管理するための手段です。 [組織](./organizations.md) または [ユーザーグループ](./user-groups.md)とは異なり、アカウントは、商品やサービスの購入や既存の顧客の管理などのビジネス状況で発生する可能性のある対話を容易にするのに役立ちます。

アカウントの種類には、 **ビジネス** 、 **パーソン** 、 **ゲスト** の3種類があります。 ビジネスアカウントでは、1つのアカウントに複数のユーザーを関連付けることができます。 個人タイプのアカウントは、1つのアカウントにしか関連付けられません。 ゲストタイプのアカウントは、登録されていないユーザーがあなたのビジネスやサイトを利用できる手段を与えます。

```{note}
アカウントは、もともと [アカウント管理](https://learn.liferay.com/commerce/latest/ja/users-and-accounts/account-management.html) に搭載されていた機能で、現在はLiferay DXP 7.4以上に搭載されています。
```

## アカウントの作成

1. ［グローバルメニュー］（![Global Menu](../images/icon-applications-menu.png)）を開きます。 **コントロールパネル** &rarr; **アカウント** に移動します。

1. ［**追加**］ アイコン (![Add icon](../images/icon-add.png)) をクリックして、新しいアカウントを作成します。

1. アカウントに名前をつけ、タイプを選択します。 なお、一度作成されたアカウントの種類は変更できません。

   ![アカウントに名前をつけ、タイプを選択します。](./accounts/images/01.png)

1. Tax IDや説明など、アカウントの追加情報を追加します。 ［**保存**］ をクリックすると、新しいアカウントが作成されます。

1. アカウントを作成すると、ページの上部にタブが表示されます。

   ![アカウントを作成すると、新しいタブが表示されます。](./accounts/images/02.png)

### ［詳細］タブ

［Details］タブには、アカウント名やタイプなど、アカウントに関する主な情報が表示されます。 また、デフォルトの請求先住所と配送先住所もここで設定できます。 [カテゴリー](../content-authoring-and-management/tags-and-categories/defining-categories-and-vocabularies-for-content.md) または [カスタムフィールド](../system-administration/configuring-liferay/adding-custom-fields.md) を追加して、アカウントをさらにカスタマイズすることもできます。

### アドレスタブ

［Addresses］タブには、アカウントに関連するさまざまなアドレスが表示されます。 新しいアドレスを追加するには、［追加］アイコンをクリックします（![Add icon](../images/icon-add.png)）。 住所情報を入力し、 ［**保存**］ ボタンをクリックします。

![アドレス情報を入力し、［保存］をクリックします。](./accounts/images/03.png)

詳しくは、 [アカウントアドレス](./accounts/account-addresses.md) をご覧ください。

### ユーザータブ

［ユーザー］タブには、アカウントに関連するさまざまなユーザーが表示されます。 なお、個人タイプのアカウントやゲストタイプのアカウントにはこのタブはありません。 ユーザーをアカウントに関連付けるには

1. **［追加**］ アイコンをクリックします（![Add icon](../images/icon-add.png)）。 選択可能なアカウントユーザーの一覧が表示されます。

1. ユーザーの名前の横にあるボックスをチェックしてユーザーを選択し、 **割り当て** ボタンをクリックします。

1. また、このビューから新しいユーザーを作成することもできます。 ［**追加**］ アイコンをクリック（![Add icon](../images/icon-add.png)）すると、新規ユーザーの追加ページが表示されます。

1. 新しいユーザーの情報を入力し、 **保存** ボタンをクリックします。

1. アカウントに新規に作成された、または関連付けられたユーザーは、ユーザータブに表示されます。 詳しくは、 [アカウントユーザー](./accounts/account-users.md) をご覧ください。

### 組織タブ

組織タブには、アカウントに関連するさまざまな 組織が表示されます。 組織を関連付けるには、 ［**追加**］ アイコンをクリックします（![Add icon](../images/icon-add.png)）。 関連付ける組織を選択し、 **割り当て** ボタンをクリックします。

### ［アカウントグループ］タブ

［アカウントグループ］タブには、アカウントのさまざまなグループメンバーシップが表示されます。 これらのグループの作成や管理については、 [アカウントグループ](./accounts/account-groups.md)を参照してください。

### ［ロール］タブ

［ロール］タブには、そのアカウントで利用可能なさまざまなロールが表示されます。 なお、ゲストタイプのアカウントにはこのタブはありません。 アカウントロールを作成するには

1. ［**追加**］ アイコンをクリックします（![Add icon](../images/icon-add.png)）。

1. 次のページでは、［ロール］にタイトルと説明をつけます。 ［**保存**］ をクリックします。

1. ロールが作成されると、パーミッションの定義やユーザーの割り当てが可能になります。 **権限の定義** タブをクリックし、ロールのパーミッションを選択します。

1. ロールにユーザーを割り当てるには、 **Assignees** タブをクリックします。 ［**追加**］ アイコンをクリック（![Add icon](../images/icon-add.png)）してユーザーを選択し、 **Assign** ボタンをクリックします。

詳しくは、 [アカウントのロール](./accounts/account-roles.md) をご覧ください。

## アカウントの変更

1. 編集したいアカウントの **オプション** アイコン（![Options icon](../images/icon-actions.png)）をクリックします。

1. 以下のいずれかを選択してください。

   ![アカウントを編集するための選択を行います。](./accounts/images/04.png)

   * Edit - アカウント情報を見て編集します。
   * Manage Users - アカウントユーザーの追加・削除を行います。
   * Manage Organizations - 組織の関連付けを追加または削除します。
   * Deactivate - アカウントを無効にします。
   * Delete - アカウントの削除を行います。

   なお、個人アカウントタイプでは、ユーザー管理機能はありません。

1. ［編集］を選択すると、より多くのオプションが表示されます。

   ![［編集］を選択すると、より多くのオプションが表示されます。](./accounts/images/02.png)

   * Details タブ - アカウントの追加情報を修正または追加します。
   * ［Addresses］タブ - 請求書送付先や配送先の住所を追加・管理します。
   * Usersタブ - アカウントユーザーの追加・削除を行います。 詳細は、 [アカウントユーザー](./accounts/account-users.md) を参照してください。
   * Organizationsタブ - 組織の関連付けを追加または削除します。
   * アカウントグループタブ - アカウントが属しているアカウントグループを表示します。 詳細については、 [アカウントグループ](./accounts/account-groups.md) を参照してください。
   * ロール］タブ - ［アカウント］のさまざまなロールを追加・管理します。 詳しくは、 [アカウントのロール](./accounts/account-roles.md) を参照してください。

## 関連情報

* [アカウントユーザー](./accounts/account-users.md)
* [アカウントアドレス](./accounts/account-addresses.md)
* [アカウントグループ](./accounts/account-groups.md)
* [アカウントロール](./accounts/account-roles.md)
* [アカウント管理ウィジェット](./accounts/account-management-widget.md)
* [アカウントでワークフローを使用する](accounts/using-workflow-with-accounts.md)
