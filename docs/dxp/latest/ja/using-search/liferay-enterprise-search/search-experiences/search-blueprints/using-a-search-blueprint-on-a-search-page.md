# 検索ブループリントを検索ページで使用する

デフォルトでは、検索ページには [検索ブループリント](./understanding-search-blueprints.md) が関連付けられていません。 Liferay の検索エクスペリエンスに影響を与えるには、 [検索ページ](../../../search-pages-and-widgets/working-with-search-pages.md) にブループリントを適用する必要があります。 サイトに複数の検索ページがある場合は、ブループリントを使用する各ページを個別に設定する必要があるため、以下の手順に従ってください。 必要であれば、各ページに異なる設計図を使用することもできる。

検索ページがあなたの検索設計図に反応するようにする、

1. [ブループリントの作成](./creating-and-managing-search-blueprints.md).

1. [検索ページ](../../../search-pages-and-widgets/working-with-search-pages.md) を作成または移動する。

1. ［ページにブループリントオプションウィジェット］を追加します。

1. ウィジェットの **Options** アイコン(![Options](../../../../images/icon-app-options.png)) をクリックし、 **Configuration** をクリックします。

1. ページのブループリントを選択するには、 **Select** をクリックします。

   ![Select a blueprint for use on the page.](./using-a-search-blueprint-on-a-search-page/images/02.png)

1. ブループリントを選択したら、Configuration 画面の **Save** をクリックします。

これで、ブループリントの機能がページに適用されました。

管理ユーザーは、代わりに [Low Level Search Options](../../../search-pages-and-widgets/search-results/understanding-low-level-search-options.md) ウィジェットを使用して、検索ページにブループリントを適用できます。 ウィジェットの［設定］を開きます。 ［属性］セクションに、次を追加します。

- キー: `search.experiences.blueprint.erc` [^1］
- 値: `[ブループリントの外部参照コード(ERC)]`。

[^1]: Liferay 2023.Q4/GA102以前のバージョンでは、代わりにID: `search.experiences.blueprint.id` を使用する必要があります。 ブループリントIDまたはERCは、ブループリント・アプリケーション（グローバル・メニュー &rarr; アプリケーション &rarr; ブループリント（エクスペリエンスの検索）から見つけることができます。 ブループリントをクリックしてエディタを開きます。

![The blueprint ID and ERC are listed in the blueprint editor.](./using-a-search-blueprint-on-a-search-page/images/01.png)

検索ページですでに低レベル検索オプション・ウィジェットを使用している場合を除き、ブループリントを設定するにはブループリント・オプション・ウィジェットの方が便利です。 ブループリントのテストなど、他の検索コンテキスト属性を設定する必要がある場合は、Low Level Search Options ウィジェットを使用してください。

## 追加の検索コンテキスト属性の適用

ブループリントは、ブループリントのオプションウィジェットを使用してページに適用するか、上記のように低レベルの検索オプションウィジェットで検索コンテキスト属性を使用して適用されます。 低レベル検索オプション・ウィジェットでは、追加の検索コンテキスト属性を設定できます。 ページの検索に検索コンテキスト属性を設定する必要がある主な理由は2つあります。

1. ブループリントはカスタムパラメータ（Liferayの検索フレームワークによって設定されないもの）を定義し、それに応答することができます。これらはLow Level Search Optionsウィジェットで手動で設定することができます。
1. 検索コンテキスト属性を設定し、検索リクエストを実行することで、検索ページでのブループリントの動作をテストすると便利です。

   標準のパラメータについての詳細は、 [the Elements reference for more information](./search-blueprints-elements-reference.md) を参照してください 。

<!--
Follow this example to set search context attributes into a blueprint-driven search page:

1. Create two users: name them _Acme User_ and _Other User_.
   - Acme User
      - Screen Name: `acmeuser`
      - Email Address: `acme@liferay.com`
      - First Name: `Acme`
      - Last Name: `User`
   - Other User
      - Screen Name: `otheruser`
      - Email Address: `other@liferay.com`
      - First Name: `Other`
      - Last Name: `User`
1. Create a [User Segment](../../../../site-building/personalizing-site-experience/segmentation/creating-and-managing-user-segments.md) called _Acme Users_. Drag the User attribute and add Acme User to it. Record the segment's ID. It's in the URL as the parameter `segmentsEntryId`.
1. Create an [Asset Category](../../../../content-authoring-and-management/tags-and-categories.md). Name the Vocabulary and the Category _Business_. Record the Category's ID. It's in the URL as part of the path: `category/[ID]`.
1. Create two pieces of Basic Web Content:
   - Web Content 1
      - Title: Has Business Category
      - Content: Test
      - Category: Business
   - Web Content 2
      - Title: Without Business Category
      - Content: Test
1. [Create a blueprint](./creating-and-managing-search-blueprints.md) with the following Element:
   - Element Name: Boost Contents in a Category for a User Segment
      - Asset Category ID: The _Business_ Category's ID. 
      - User Segment IDs: The ID of the _Acme Users_ User Segment.
      - Boost: 100
1. Navigate to the site's search page.
1. Add the Low Level Search Options widget to the page, and open it's configuration screen.
1. In the Attributes section, add

   - Key: `search.experiences.scope.group.id`
   - Value: `[the site ID]`

You can find the blueprint ID from the Blueprints application (Global Menu &rarr; Applications &rarr; Blueprints (Search Experiences).
-->
<!-- Example is unfinished--uncomment when finalized. -->
