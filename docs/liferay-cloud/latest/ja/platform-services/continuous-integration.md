# 継続的インテグレーション

Liferay Cloudは[Jenkins](https://jenkins.io/)を使用して、継続的なインテグレーションインフラストラクチャサービスを強化しています。 プルリクエストを送信するか、事前設定されたGitHubブランチの1つにコミットをプッシュすると、自動で設定可能なビルドがトリガーされます。

```{note}
Liferay Cloudの顧客（ 'customer'ログインを使用）には、ビルドを管理および確認する権限がありますが、完全な管理者権限はありません。
```

デフォルトでは、この自動ビルドはコードをコンパイルし、テストを実行するように設定できます。 Liferay Cloudはサービスをビルドし、そのステータスを環境のビルドページに表示します。 テストが失敗した場合は、Jenkinsダッシュボードと`https://ci-companyname-infra.lfr.cloud`ログを確認できます。

```{note}
継続的インテグレーションは、CLIでは*なく*、GitHub、GitLab、またはBitbucketからデプロイする場合にのみ機能します。
```

詳しくは、 [CIサービスの制限](../reference/platform-limitations.md#continuous-integration-service) を参照してください。

## デフォルトのJenkinsfileの使用

CIサービスのバージョン `liferaycloud/jenkins:2.222.1-3.2.0`からは、オーバーライドされていない場合、デフォルトのJenkinsfileが利用可能です。 デフォルトのJenkinsfileは、[バージョン 4.x.x のサービス](../reference/understanding-service-stack-versions.md)を使用しているプロジェクトでは常に利用可能です。

デフォルトのJenkinsfileは、それまでJenkinsfileに保存されていたすべてのロジックをカプセル化し、Jenkinsプラグインに移動させます。 つまり、CI構成を必要とせずに、すべてのバグ修正、セキュリティ修正、および改善を適用できます。

さらに、拡張ポイントを使用して、CIパイプラインの各ステップをカスタマイズできます。

### デフォルトのJenkinsfileを有効にする

プロジェクトが[バージョン 4.x.x](../reference/understanding-service-stack-versions.md)に更新されている場合、デフォルトのJenkinsfileは既に有効になっています。 そうでない場合は、プロジェクトのリポジトリで以下の手順を実行してください。

1. CIサービスを`liferaycloud/jenkins:2.222.1-3.2.0`バージョンにアップデートします。

1. ルートフォルダにある`Jenkinsfile`を削除します。

1. CIサービスの`LCP.json`ファイルに、次の環境変数を追加します： `LCP_CI_USE_DEFAULT_JENKINSFILE: true`

1. [CIサービスをデプロイします](../build-and-deploy/deploying-changes-via-the-cli-tool.md)。

### デフォルトのJenkinsfileの拡張

デフォルトのJenkinsfileを拡張するには、プロジェクトリポジトリの `ci` フォルダに以下のファイルを追加します：

- `Jenkinsfile-before-all`
- `Jenkinsfile-before-cloud-build`
- `Jenkinsfile-before-cloud-deploy`
- `Jenkinsfile-after-all`
- `Jenkinsfile-post-always`

CIビルドプロセスのステップの基本的な概要は次のとおりです：

1. 存在する場合は、`ci/Jenkinsfile-before-all`をロードします。

1. Liferay Workspaceをビルドします。

1. 存在する場合は、`ci/Jenkinsfile-before-cloud-build`をロードします。

1. コンソールに表示されるLiferay Cloudのビルドを作成します。

1. 存在する場合は、`ci/Jenkinsfile-before-cloud-deploy`をロードします。

1. 現在のブランチがデプロイブランチの場合、ビルドをクラウド上の環境にデプロイできます。 `LCP_CI_DEPLOY_BRANCH`環境変数でデプロイブランチを設定し、 `LCP_CI_DEPLOY_TARGET`によりデプロイ環境を指定します。

1. 存在する場合は、`ci/Jenkinsfile-after-all`をロードします。 これは、すべてのビルド手順が完了すると実行されます。

1. 存在する場合は、`ci/Jenkinsfile-post-always`をロードします。 これは、ビルドが成功しても失敗しても実行されます。

Jenkinsサービスの起動ログを監視して、デフォルトのパイプラインでこれらがどのように使用されるかを確認することができます。 完全なデフォルトのJenkinsfileが起動ログに出力されます。

## 追加のパイプラインのカスタマイズと外部通話

パイプラインの追加の手順を使用して、外部サービスを呼び出すことができます。 例えば、REST APIを通してサードパーティのモニタリングサービスを呼び出したり、ビルドプロセス中に実行するスクリプトを呼び出したりすることができます。

また、リポジトリの `ci/` フォルダで`Jenkinsfile` を定義することで、独自のパイプラインを作成することができます。 詳しくは、 [Jenkins website](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) を参照してください。

```{warning}
外部サービスやカスタムパイプラインは、Liferay Cloudサポートの対象外であるため、慎重にご利用ください。 Jenkinsのカスタムプラグインはサポートされていません。
```

## 異なる拡張ポイント間でのコードの再利用

これらの拡張ポイント間でコードを共有する方法が必要になるでしょう。 基本的な方法の1つは、groovyスクリプトをロードすることです。 例えば、 `［ci］/` フォルダに `［util.groovy］` という内容でgroovyファイルを作成すると、次のようになります：

```
def sendSlackMessage(message) {
    println(message)
}

return this
```

次に、以下を`ci/Jenkinsfile-before-cloud-build`に挿入できます：

```
def util = load("ci/util.groovy")

util.sendSlackMessage("About to create Liferay Cloud build...")
```

## 環境変数リファレンス

次の環境変数は、デフォルトのJenkinsファイルでのみ使用されます。 これらが何をするのかは、 [パイプラインオプションに関するJenkinsのドキュメント](https://jenkins.io/doc/book/pipeline/syntax/#options)を参照してください。

| 名前                                    | デフォルト値    | 説明                                                                                                                                                                                                                                                                      |
|:------------------------------------- |:--------- |:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `LCP_CI_ARTIFACT_DAYS_TO_KEEP`        | `-1`      | 保存されるアーティファクトの日数                                                                                                                                                                                                                                                        |
| `LCP_CI_ARTIFACT_NUM_TO_KEEP`         | `1`       | *アーティファクト* と *スタッシュ* を保存する最近のビルドの数を設定します。                                                                                                                                                                                                                               |
| `LCP_CI_BUILD_DAYS_TO_KEEP`           | `14`      | ビルドが保存される日数                                                                                                                                                                                                                                                             |
| `LCP_CI_BUILD_NUM_TO_KEEP`            | `10`      | 保存されるビルドの数                                                                                                                                                                                                                                                              |
| `LCP_CI_BUILD_TIMEOUT_MINUTES`        | `30`      | パイプライン実行のタイムアウト期間を設定します。 その後、Jenkinsがパイプラインを中止します。                                                                                                                                                                                                                      |
| `LCP_CI_DEPLOY_BRANCH`                | `develop` | [自動デプロイメント](../build-and-deploy/automatically-deploying-ci-service-builds.md)に使用するブランチを指定します。 有効なブランチ名に設定されていない場合、自動デプロイは無効となります。                                                                                                                                       |
| `LCP_CI_DEPLOY_TARGET`                |           | [自動デプロイメント](../build-and-deploy/automatically-deploying-ci-service-builds.md)がデプロイされる環境を設定します。 `LCP_CI_DEPLOY_BRANCH`が設定されている場合にのみ使用されます。                                                                                                                               |
| `LCP_CI_LIFERAY_DXP_HOTFIXES_{ENV}`   |           | Liferayサービスをデプロイする際にCIが自動的に適用するホットフィックスの名前（`.zip`の拡張子なし）。 環境名を`{ENV}`（全て大文字で）、または`COMMON`に置き換えます。                                                                                                                                                                       |
| `LCP_CI_PRESERVE_STASHES_BUILD_COUNT` | `20`      | *stashes*が保存される最近のビルドの数を設定します。 `LCP_CI_ARTIFACT_NUM_TO_KEEP` 変数で許可されているよりも多くのビルドでStashを保持することはできません。                                                                                                                                                                    |
| `LCP_CI_SCM_MANAGE_HOOKS`             | `true`    | コードホスティングプラットフォーム（GitHubなど）の [ウェブフックの自動管理を無効](../getting-started/configuring-your-github-repository.md#personal-access-token-usage)を有効または無効にするオプションです。                                                                                                                  |
| `LCP_CI_SCM_PROVIDER`                 | `github`  | ビルドの取得に使用するソースコントロール管理サービスを設定します。 許容されているのは[`bitbucket`](../getting-started/configuring-your-bitbucket-repository.md)、 [`github`](../getting-started/configuring-your-github-repository.md)、及び[`gitlab`](../getting-started/configuring-your-gitlab-repository.md)の値です。 |
| `LCP_CI_SCM_REPOSITORY_NAME`          |           | ビルドを取得する際に使用するリポジトリ名を設定します (GitHub、Bitbucket あるいは GitLab から)。                                                                                                                                                                                                           |
| `LCP_CI_SCM_REPOSITORY_OWNER`         |           | ビルドの取得に使用されるリポジトリ所有者。                                                                                                                                                                                                                                                   |
| `LCP_CI_SCM_TOKEN`                    |           | Bitbucket、GitHub、またはGitLabからビルドにアクセスして取得するために必要な個人用アクセストークン。                                                                                                                                                                                                            |
| `LCP_CI_USE_DEFAULT_JENKINSFILE`      | `false`   | デフォルトのJenkinsfileを有効または無効にするオプション                                                                                                                                                                                                                                       |
| `LCP_DATABASE_SERVICE`                |           | データベースサービスのホスト名。                                                                                                                                                                                                                                                        |

## 関連トピック

* [Liferay Cloudサービスへのログイン](../getting-started/logging-into-your-liferay-cloud-services.md)
* [GitHubリポジトリの設定](../getting-started/configuring-your-gitlab-repository.md)
* [Bitbucket リポジトリの設定](../getting-started/configuring-your-bitbucket-repository.md)
* [バージョン4でのLiferay Cloudプロジェクトの変更](../reference/liferay-cloud-project-changes-in-version-4.md)
<!-- While Version 3 is still supported, because of the fact a large part of this article hinges on the project version, this link may be helpful. This link should likely be removed once version 3 is no longer supported. -->
