# ロールと権限について

Liferay DXPで作業を行うには、 [ユーザー](./../users/understanding-users.md) に適切な権限が必要です。 ロールは、権限を持つユーザーに参加します。 ロールと権限に関するほとんどの管理作業は、 ［**コントロールパネル**］ &rarr; ［**ユーザー**］ &rarr; ［**Roles**］ で行われます。

![コントロールパネルからロールを管理します。](./understanding-roles-and-permissions/images/03.png)

直接ロールの作成とユーザーの割り当てにスキップするには、を参照してください。

* [ロールの作成と管理](./creating-and-managing-roles.md)
* [ロール権限の定義](./defining-role-permissions.md)
* [ユーザーのロールへの割り当て](./assigning-users-to-roles.md)

```{note}
[サイトのチーム](./../../site-building/sites/site-membership/creating-teams-for-sites.md) には、専用の権限管理ユーザインターフェースが用意されています。
```

## ロールと範囲

Liferay DXP内で目的の機能を実行するために必要な権限をユーザーに与えるには、最初に一連の権限をロールに関連付ける必要があります。

例として、 **掲示板管理者** ロールとユーザー **Jane Slaughter** を例として使用すると、次の手順を実行できます。

1. 必要な機能を決定する： **Liferay DXPで掲示板を管理します。**
1. スコープを決定します： **仮想インスタンス全体(グローバル）。**
1. 適切にスコープ設定されたロールを作成し、機能を実行する権限を割り当てます： **掲示板管理者(標準ロール）。**
1. ユーザーコレクションを作成します： **掲示板の管理者と呼ばれるユーザーグループです。**
1. ロールをユーザーコレクションに割り当てます： **掲示板管理者 &rarr; 掲示板管理者ロール。**
1. ユーザーをユーザーコレクションに割り当てます： **Jane Slaughter &rarr; 掲示板管理者。**

以下の概念図は、ユーザーがLiferay DXPのロールと権限システムで必要な権限を継承する方法を示しています。 ここには(掲示板管理者になるユーザーの）完全に関連付けられたロールの割り当てが1つだけ表示されますが、新しい矢印を描くと、他のユーザーコレクションやロールの割り当てを介してユーザーとアクセス許可がどのようにリンクされるかを確認できます。

![権限はユーザーと効率的にリンクするために存在します。](./understanding-roles-and-permissions/images/02.png)

ロールにはスコープがあるため、さまざまなレベルで適用されます。

| 権限範囲              | ロール種類     | ユーザーにはどこに割り当てられますか？                                                | 利用可能な割り当て                                                                    |
|:----------------- |:--------- |:------------------------------------------------------------------ |:---------------------------------------------------------------------------- |
| 仮想インスタンス全体(グローバル） | 標準        | ［コントロールパネル ］&rarr; ［ユーザー］ &rarr; ［ロール］(ロールをクリック） &rarr; ［割り当て先］    | ユーザーグループ <br />組織 <br />サイト <br />セグメント <br />個別ユーザー |
| 単一の組織             | 組織        | ［コントロールパネル］ &rarr; ［ユーザー］ &rarr; ［ユーザーと組織］ &rarr; ［組織(組織アクションメニュー） | 個人ユーザー                                                                       |
| 単一のサイト            | サイト       | ［サイト管理］ &rarr; ［People］ &rarr; ［メンバーシップ］                           | ユーザーグループ <br />組織 <br />セグメント <br />個別サイトメンバー              |
| 単一のアセットライブラリ      | アセットライブラリ | アセットライブラリのサイト／ライブラリ管理の&rarr;［People］ &rarr;［メンバーシップ］               | 組織 <br />ユーザーグループ <br /> 個別ユーザー                                  |

<!-- ripped out row from above table as per LRODCS-8188: | A single Account | Account   | Control Panel &rarr; Accounts &rarr; Accounts (Select Account) &rarr; Roles | Individual Account Members -->

個人 [ユーザー](./../users/understanding-users.md) は手動でロールに割り当てることができます。 この方法は、ユーザーのコレクションを使用するよりも効率的ではありません。 また、「デフォルトの関連付け」と呼ばれる仮想インスタンス設定により、すべてのスコープのロールにユーザーを [自動的に](../../system-administration/configuring-liferay/virtual-instances/users.md#default-user-associations) 割り当てることができます。

### 標準ロール

インスタンススコープのロールは通常のロールと呼ばれます。 これらのロールは、グローバルに、または [仮想インスタンス](./../../system-administration/configuring-liferay/virtual-instances.html) 全体に権限を付与します。

いくつかのユーザーコレクションを通常のロールに割り当てることができます。

* [組織](./../organizations/understanding-organizations.md) は、共有階層レベルのユーザーを保持します。
* [ユーザーグループ](./../user-groups/creating-and-managing-user-groups.md) は、同じ機能を実行する必要性のみを共有するユーザーを保持します。
* [サイト](./../../site-building/sites/site-membership/adding-members-to-sites.md) は、特定のアクションを実行する必要があるユーザー(サイトメンバーとして）を保持します。
* [セグメント](./../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) は、特定の条件に一致するサイトのユーザーを保持します。

### 組織ロール

組織スコープのロールは、組織ロールと呼ばれます。 組織ロールの権限は、グローバルレベルで定義され、1つの特定の[組織](../../users-and-permissions/organizations/understanding-organizations.md)に適用されます。 ユーザーは組織に個別に追加され、組織ロールに個別に割り当てられます。

### サイトロール

サイトスコープのロールはサイトロールと呼ばれます。 サイトのロールの権限は、グローバルレベルで定義され、1つの特定の[サイト](../../site-building/introduction-to-site-building.md)に適用されます。 個々のユーザー、組織、およびユーザーグループは、サイトメンバーシップの制御とサイトロールの割り当ての両方に使用できます。

## 権限設定

権限は、アプリケーションの開発者によって作成されます。 これらは、ユーザーが実行できるアクション、またはユーザーが特定のアセットにどの程度アクセスできるかを定義します。

### アプリケーションスコープのアクセス許可

Liferay DXPのページに配置された各ウィジェットインスタンス、および各管理アプリケーションの［サイトメニュー］&rarr;［コンテンツとデータ］セクションに権限を付与できます。 詳細は、 [ウィジェットの権限](./../../site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/setting-widget-permissions.md) を参照してください。

### アセットスコープの権限

アセットレベルの権限(たとえば、個々のブログ投稿を編集する権限、またはドキュメントとメディアライブラリのフォルダーを表示する権限）は、コントロールパネルではなく、個別のアセットから管理されます。 詳細は、 [ウィジェットの権限](./../../site-building/creating-pages/page-fragments-and-widgets/using-widgets/configuring-widgets/setting-widget-permissions.md) を参照してください。

## 関連トピック

* [ロールの作成と管理](./creating-and-managing-roles.md)
* [ロール権限の定義](./defining-role-permissions.md)
* [ユーザーのロールへの割り当て](./assigning-users-to-roles.md)
