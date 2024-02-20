# 環境変数の定義

環境変数は動的なプレースホルダーのセットであり、環境内でのサービスの動作に影響を与える可能性があります。

環境変数の定義は、Liferay Cloud コンソールから行うか、各サービスの `LCP.json` ファイルを設定することで行えます。

```{note}
Liferay Cloud は、常に最新の設定変更を適用します。 LCP.jsonファイルで最新の変更が行われた場合、再起動時に、環境変数がWebコンソールに反映されます。 ただし、ウェブコンソールで環境変数を変更した場合は、その新しい設定でコンテナが再起動されます。
```

## Liferay Cloud Consoleで環境変数を定義する

Liferay Cloudのコンソールから、サービスの環境変数を追加・変更・削除することができます。 この方法でサービスを設定すると、すべての変数は、定義されたプロジェクト環境にスコープされます。

```{warning}
サービスの環境変数を更新すると、その変更を適用するためにサービスが再起動します。 再起動中、サービスは数分間リクエストの受信を停止し、変数の値によっては異なる動作をすることがあります。
```

以下の手順で、Liferay Cloud コンソールからサービスに環境変数を追加します。

1. プロジェクト環境に移動します。

1. 環境メニューの **サービス** をクリックします。

1. 設定したいサービスをクリックします。

1. ［**環境変数**］ タブをクリックします。

   ![図1：サービスの [環境変数]タブに移動します。](./defining-environment-variables/images/01.png)

1. 新しい環境変数をキーと値のペアで入力します。 次の例では、Liferay サービスのクラスタリングを無効にしています。

    * **キー** ： `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED`
    * **値** ： `false`

1. **Save Changes** をクリックすると、新しい環境変数でサービスが再起動します。

環境変数をサービスに追加した後は、サービスの ［**環境変数**］ タブからいつでもその環境変数を削除したり値を変更したりできます。

変数を削除するには、 ［**削除**］ ボタン（⨉）をクリックします。

変数の値を変更するには、 ［**Show**］ のアイコンをクリックして、新しい値を入力します。

変数の削除や変更が完了したら、 ［**Save Changes**］ をクリックして、環境変数が更新された状態でサービスを再起動します。

![図2： [アイコンを表示]をクリックして、変数の値を表示および編集します。](./defining-environment-variables/images/02.png)

## LCP.jsonによる環境変数の定義

サービスの環境変数は、 `LCP.json` ファイルの `env` プロパティを使って定義できます。 この方法でサービスを設定すると、すべての環境または選択した環境のサービスの動作を定義できます。

次の例では、 `LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` 変数に `true`という値を定義しています。 この変数は、特に指定がない限り、すべての環境にデフォルトで適用されるトップレベルの属性として設定されます。

```json
{
  "id": "liferay",
  "image": "liferaycloud/liferay-dxp:7.2-4.0.0",
  "env": {
    "LCP_PROJECT_LIFERAY_CLUSTER_ENABLED": "true"
  }
}
```

次の例では、トップレベル属性の例外を作成し、  `dev` 環境の`LCP_PROJECT_LIFERAY_CLUSTER_ENABLED` 変数に `false`の値を定義しています。

```json
{
  "environments": {
    "dev": {
      "env": {
        "LCP_PROJECT_LIFERAY_CLUSTER_ENABLED": "false"
      }
    }
  }
}
```

サービスの `LCP.json` ファイルの編集が完了したら、環境変数を更新するために変更内容を保存してデプロイします。 詳しくは、 [Liferay Cloud 導入ワークフローの概要](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md) をご覧ください。

## 秘密の環境変数

通常の環境変数には、特別なセキュリティ対策はありません。 Liferay Cloudプロジェクトにアクセスできるユーザーは、あなたのサービスの変数値も見ることができます。

機密性の高い変数値（ログイン認証情報など）を保存するには、シークレットを使用することができます。 シークレットはバックエンドで暗号化され、 **管理者** 役割がないユーザーから非表示にすることができます。 また、通常の環境変数は値を確保するために [シークレットを参照](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md#referencing-secrets-from-environment-variables) することができます。 詳しくは、 [シークレットで安全な環境変数を管理](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md) をご覧ください。

## 関連トピック

* [LCP.jsonによるコンフィギュレーション](../reference/configuration-via-lcp-json.md)
* [シークレットで安全な環境変数を管理](..//tuning-security-settings/managing-secure-environment-variables-with-secrets.md)
* [Liferay Cloud 導入ワークフローの概要](../updating-services-in-liferay-paas/overview-of-the-liferay-cloud-deployment-workflow.md)
