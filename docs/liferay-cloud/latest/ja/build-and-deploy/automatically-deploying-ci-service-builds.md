# CIサービスのビルドを自動的にデプロイする

Liferay Cloudでは、プロジェクトのGitリポジトリ（例： [GitHub](../getting-started/configuring-your-github-repository.md#integrating-with-the-jenkins-service) , [Bitbucket](../getting-started/configuring-your-bitbucket-repository.md#connecting-bitbucket-to-your-jenkins-service) , [GitLab](../getting-started/configuring-your-gitlab-repository.md#connecting-gitlab-to-your-jenkins-service) ）にプッシュまたはマージされた変更に対して、Webhookを使用して自動的にJenkinsビルドをトリガーすることができます。 これらのビルドは、Liferay Cloudコンソールを介してプロジェクト環境に手動でデプロイすることができます。 また、特定のブランチで成功したビルドを、特定の環境に自動的にデプロイするようにCIサービスを設定することで、デプロイ作業を高速化することもできます。

デフォルトでは、自動デプロイメントは `LCP_CI_DEPLOY_BRANCH` および `LCP_CI_DEPLOY_TARGET` 変数によって制御されます。 これらは、自動デプロイのトリガーとなるブランチや、ビルドの自動デプロイ先となる環境を決定します。 これらのデフォルト値は、それぞれ `develop` 、 `dev` に設定されています。

必要に応じて、Liferay Cloud Consoleから `LCP_CI_DEPLOY_BRANCH` と `LCP_CI_DEPLOY_TARGET` 変数を編集して、自動デプロイメントを設定することができます。

1. Liferay Cloud・プロジェクトの `infra` 環境に移動します。

1. **CI** サービスのページに行き、 **環境変数** タブをクリックします。

   ![CIサービスのページを開き、 [環境変数]タブをクリックします。](./automatically-deploying-ci-service-builds/images/01.png)

1. CIサービスに以下の変数を追加します。

   * **Key** : `LCP_CI_DEPLOY_BRANCH`

      **Value** : 任意のブランチ名を入力します（例： `useracceptance`）。

   * **Key** : `LCP_CI_DEPLOY_TARGET`

      **Value** ：任意の環境名を入力します（例： `uat`）。

1. **変更を保存** をクリックします。 これにより、CIサービスは新しい変数で再起動します。

再起動すると、指定したブランチにプッシュまたはマージされた変更が自動的にビルドされ、ターゲット環境にデプロイされます。

<a name="additional-information" />

## 追加情報

* [Liferay Cloud開発ワークフローの概要](./overview-of-the-liferay-cloud-deployment-workflow.md)
* [Liferay Cloudコンソールによる変更の展開](./deploying-changes-via-the-liferay-cloud-console.md)
* [CLIツールによる変更点のデプロイ](./deploying-changes-via-the-cli-tool.md)
