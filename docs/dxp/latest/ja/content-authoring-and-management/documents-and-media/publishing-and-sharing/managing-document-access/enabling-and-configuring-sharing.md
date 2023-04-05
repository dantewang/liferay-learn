# 共有の有効化と構成

共有設定により、ユーザーは[ファイルを相互に共有](./sharing-documents-with-other-users.md)できます。 グローバル、仮想インスタンス、およびサイトのスコープでファイル共有を有効にできます。

```{note}
共有はデフォルトではグローバルに有効になっています。
```

<a name="global-sharing-configuration" />

## グローバル共有設定

1. **グローバルメニュー**（![Global Menu](../../../../images/icon-applications-menu.png)）をクリックし、 ［**コントロールパネル**］ をクリックします。
1. ［**システム設定**］ をクリックします。
1. ［**コンテンツとデータ**］ セクションで、 ［**Sharing**］ をクリックします。

    ![共有リンクは、共有の設定につながります。](./enabling-and-configuring-sharing/images/02.png)

1. ［**システムスコープ**］ 下で、 ［**Sharing**］ を選択します。
1. 次のオプションを設定します。

    - **期限切れ共有エントリーのチェック間隔：** 期限切れの共有エントリーがチェックされ削除される間隔（分単位）。

    - **Enabled：** このボックスをオンにすると、共有がグローバルで有効になります。

1. ［**仮想インスタンススコープ**］ 下で、 ［**Sharing**］ を選択します。
1. ［**Enable**］ ボックスをオンにして、システム上のすべての仮想インスタンスの共有を有効にします。 チェックを外したままにすると、各仮想インスタンスで共有を設定することになります。

    ```{note}
    システムスコープで共有を有効にすると、システム上のすべての仮想インスタンスの共有が有効になります。 この動作を変更し、インスタンスごとに共有を有効にするには、［仮想インスタンススコープ］セクションの［Sharing］オプションをオフにします。
    ```

    ![共有をグローバルに設定します。](./enabling-and-configuring-sharing/images/03.png)

1. ［**保存**］ をクリックします。

<a name="virtual-instance-sharing-configuration" />

## 仮想インスタンス共有設定

1. **グローバルメニュー**（![Global Menu](../../../../images/icon-applications-menu.png)）をクリックし、 ［**コントロールパネル**］ をクリックします。
1. ［**Instance Settings**］ をクリックします。
1. ［**コンテンツとデータ**］ 下で、 ［**Sharing**］ をクリックします。

    ```{note}
    システムスコープで共有が無効になっている場合、共有オプションは使用できません。 システムスコープの設定を変更するには、 [Global Sharing Configuration](#global-sharing-configuration) を参照してください。
    ```

1. ［**仮想インスタンススコープ**］ 下で、 ［**Sharing**］ を選択します。
1. ［**Enabled**］ ボックスをオンにして、この仮想インスタンスでの共有を有効にします。

   ![インスタンスごとに共有を有効または無効にできます。](./enabling-and-configuring-sharing/images/04.png)

1. ［保存］</em>をクリックします。

<a name="site-sharing-configuration" />

## サイト共有設定

```{note}
システムスコープまたは仮想インスタンススコープで共有が無効になっている場合、サイト共有オプションは使用できません。 これらの設定を変更するには、 [Global Sharing Configuration](#global-sharing-configuration) および [Virtual Instance Sharing Configuration](#virtual-instance-sharing-configuration) を参照してください。
```

1. サイト共有設定にアクセスします。

   - Liferay DXP 7.4+の場合

      1. サイトメニューから、 ［**設定**］ &rarr; ［**サイト設定**］ に移動します。
      1. ［コンテンツとデータ］セクションで、 ［**Sharing**］ をクリックします。

   - 以前のLiferay DXPバージョンの場合

      1. サイトメニューから、 ［**設定**］ &rarr; ［**Settings**］ に移動します。
      1. ［詳細設定］領域で、 ［**コンテンツ共有**］ セクションを展開します。

1. ［**共有を有効にする**］ オプションを切り替えて、サイトのファイル共有を有効または無効にします。

1. 完了したら、 ［**保存**］ をクリックします。

<a name="related-information" />

## 関連情報

- [他のユーザーとのドキュメントの共有](./sharing-documents-with-other-users.md)
- [サイト設定UIリファレンス](../../../../site-building/site-settings/site-settings-ui-reference.md)
