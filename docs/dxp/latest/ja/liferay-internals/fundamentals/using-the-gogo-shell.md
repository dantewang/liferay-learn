---
toc:
- ./using-the-gogo-shell/command-line-gogo-shell.md
- ./using-the-gogo-shell/gogo-shell-commands.md
---
# Gogo シェルの使用

```{toctree}
:maxdepth: 3

using-the-gogo-shell/command-line-gogo-shell.md
using-the-gogo-shell/gogo-shell-commands.md
```

Gogoシェルは、モジュールフレームワークと対話するための手段を提供します。 中でも、以下を実行できます。

* バンドル（モジュール）の動的なインストール／アンインストール
* パッケージの依存関係を調べる
* 拡張ポイントを調べる
* サービスリファレンスの一覧表示

コントロールパネルは、Gogoシェルにアクセスするための最も安全でセキュアな方法です。

1. **グローバルメニュー**（![icon](../../images/icon-applications-menu.png)）を開きます。

1. ［**コントロールパネル**］ タブを選択します。

1. ［System］セクションで ［**Gogo シェル**］ をクリックします。

   Gogoシェルのコマンド画面が表示されます。

   ![コントロールパネルのGogoシェル](./using-the-gogo-shell/images/02.png)

   ```{note}
   DXP 7.2では、コントロールパネルを開き、 **設定** &rarr; **Gogo シェル** に移動します。
   ```

1. **g!** テキストフィールドにGogoシェルコマンドを入力します。 たとえば、`lb | grep "Liferay Announcements API"`と入力すると、お知らせAPIバンドルの情報が一覧表示されます。

1. ［**Execute**］ をクリックします。

    コマンド結果の出力が表示されます。

    ![［出力］セクションには、コマンドの結果が表示されます。](./using-the-gogo-shell/images/03.png)

```{warning}
Gogoシェルは非常に強力で、プラットフォームのコア機能を操作することができます。 Gogoシェルへのアクセスは、信頼できる管理者にのみ許可してください。 詳細については、[ロールと権限について](../../../users-and-permissions/roles-and-permissions/understanding-roles-and-permissions.md)を参照してください。
```

<a name="まとめ" />

## まとめ

Gogoシェルを実行する方法がわかったので、使用可能な[Gogoシェルコマンド](./using-the-gogo-shell/gogo-shell-commands.md)を調べます。 開発者環境で作業をしている場合は、コマンドラインからGogoシェルを使用することを検討してください。 詳しくは、[コマンドラインGogo シェル](./using-the-gogo-shell/command-line-gogo-shell.md)を参照してください。