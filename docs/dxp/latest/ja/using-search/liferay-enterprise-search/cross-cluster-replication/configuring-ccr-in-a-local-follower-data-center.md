# ローカルフォロワーデータセンターでのCCRの構成

> 以下の手順を実行する前に、まず[リモート/リーダーデータセンターでCCRを構成](./configuring-ccr-in-a-remote-leader-data-center.md)してください。

ローカル/フォロワーデータセンターには、Liferay DXPクラスターノードが保持されており、同じ場所に配置されたElasticsearchクラスターへの読み取り専用接続とリモート/リーダーデータセンターのElasticsearchクラスターへの書き込み専用接続があります。

完全な構成例は、[CCR設定リファレンスガイド](./ccr-basic-use-case-config-reference.md)にも記載しています。

## フォロワーElasticsearchクラスターの構成

ローカルElasticsearchクラスターはフォロワー（レプリケート済み、読み取り専用）インデックスを保持する必要があり、同じ場所にあるLiferay DXPノードが読み取ることができるローカル検索エンジンとして機能します。

```{important}
**CCRインストールのセキュリティ:** [前述](./configuring-an-example-ccr-installation-replicating-between-data-centers.md#prerequisite-for-security-configure-authentication and-encryption) したように、Elasticsearchクラスタは同じCAによって署名されたノード証明書と各クラスターのセキュリティ設定が一致する必要があります。 その他のアプローチや詳細については、 [Elasticのドキュメント](https://www.elastic.co/guide/en/elasticsearch/reference/7.x/cross-cluster-configuring.html) を参照してください。
```

1. `elasticsearch.yml`を構成します。

   `[Follower Elasticsearch Home]/config/elasticsearch.yml`

   ```yaml
   cluster.name: LiferayElasticsearchCluster_FOLLOWER
   node.name: es-follower-node-1

   http.port: 9201
   transport.port: 9301

   xpack.security.enabled: true

   ### TLS/SSL settings for Transport layer
   xpack.security.transport.ssl.enabled: true
   xpack.security.transport.ssl.keystore.path: certs/elastic-nodes.p12
   xpack.security.transport.ssl.keystore.password: liferay
   xpack.security.transport.ssl.truststore.path: certs/elastic-nodes.p12
   xpack.security.transport.ssl.truststore.password: liferay
   xpack.security.transport.ssl.verification_mode: certificate

   ## TLS/SSL settings for HTTP layer
   xpack.security.http.ssl.enabled: true
   xpack.security.http.ssl.keystore.path: certs/elastic-nodes.p12
   xpack.security.http.ssl.keystore.password: liferay
   xpack.security.http.ssl.truststore.path: certs/elastic-nodes.p12
   xpack.security.http.ssl.truststore.password: liferay

   # For Kibana
   xpack.monitoring.collection.enabled: true
   ```

   セキュリティ設定（`xpack.security...`）を使用するには、パスワードを設定し、ノード証明書を取得する必要があります。

1. サーバーを起動します。 サーバーディレクトリのルートにいる場合は、以下を実行します。

   ```bash
   ./bin/elasticssearch
   ```

1. 試用段階で、まだ適切なライセンスを持っていない場合は、Elasticsearchのトライアルを開始してください。

   ```
   POST /_license/start_trial?acknowledge=true
   ```

## ローカルLiferay DXPクラスターノードの構成

```{tip}
ローカルでテストする場合は、TomcatがリモートのDXPノードと異なるポートを使用するように設定します。 この設定例では、HTTPポートとして`9080`、リダイレクトポートとして`9443`、シャットダウンポートとして`9005`を使用しています（サーバーのポートは、`[Liferay Home]/tomcat-[version]/conf/server.xml`で変更してください）。
```

1. [Elasticsearch接続構成ファイル](./configuring-ccr-in-a-remote-leader-data-center.md#configure-the-remote-liferay-dxp-cluster-node) をリモートDXPクラスターノードの`osgi/configs`フォルダからローカルDXPクラスターノードの対応するフォルダにコピーします。

   Liferay DXP 7.3の場合、これには`*ElasticsearchConnectionConfiguration-remote.config` と`*ElasticsearchConfiguration.config`が含まれています。

   ```{important}
   ElasticsearchConfiguration.config` の `remoteClusterConnectionId` の値は、 `ElasticsearchConnectionConfiguration-remote.config` ファイルの `connectionId` と一致する必要があります。 
   ```

   Liferay DXP 7.1および7.2では、 `*ElasticsearchConfiguration.config` および `*XPackSecurityConfiguration.config`が含まれています。

   これらのファイルが提供されると、ローカルDXPクラスターノードの書き込み接続が構成されます。

1. 次に、フォロワーインデックスを使用してローカルElasticsearchサーバーへの読み取り専用接続を構成します。

   Liferay DXP 7.3の場合、`com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConnectionConfiguration-ccr.config`という名前の構成ファイルを`Liferay Home/osgi/configs`に提供します。

   以下のコンテンツを指定します

   ```properties
   active=B"true"
   connectionId="ccr"
   username="elastic"
   password="liferay"
   authenticationEnabled=B"true"
   httpSSLEnabled=B"true"
   networkHostAddresses=["https://localhost:9201"]
   truststorePassword="liferay"
   truststorePath="/PATH/TO/elastic-nodes.p12"
   truststoreType="pkcs12"
   ```

   Liferay DXP 7.1および7.2の場合、`com.liferay.portal.search.elasticsearch.cross.cluster.replication.internal.configuration.ElasticsearchConnectionConfiguration-ccr.config`という名前の構成ファイルを`Liferay Home/osgi/configs`に提供します。

   ```{warning}
   Liferay 7.2 では、CCR 接続の設定ファイル (例: `ElasticsearchConnectionConfiguration-ccr.config`) を LES クラスター横断レプリケーションLPKGの初期デプロイと同時に展開しないようにしてください。 モジュールが完全に起動する前に設定ファイルがデプロイされると、Liferayの検索機能が壊れるという既知のバグ( [LPS-127821](https://issues.liferay.com/browse/LPS-127821) ) があります。 もし、既にこの現象が発生している場合は、 [クラスター横断レプリケーションのトラブルシューティング](./troubleshooting-cross-cluster-replication.md#liferay-7-2-after-deploying-the-ccr-lpkg and-the-elasticsearchconfiguration-file-search-is-broken) で対処できますので、ご参照ください。
   ```

   ```properties
   clusterName="LiferayElasticsearchCluster_FOLLOWER"
   connectionId="ccr"
   username="elastic"
   password="liferay"
   authenticationEnabled=B"true"
   transportSSLEnabled=B"true"
   networkHostAddress="https://localhost:9201"
   transportAddresses=["localhost:9301"]
   sslTruststorePassword="liferay"
   sslTruststorePath="/PATH/TO/elastic-nodes.p12"
   certificateFormat="pkcs12"
   sslKeystorePassword="liferay"
   sslKeystorePath="/PATH/TO/elastic-nodes.p12"
   ```

   [構成ファイル名](../../../system-administration/configuring-liferay/configuration-files-and-factories/using-factory-configuration.md)には任意のサフィックス（例： `-ccr` ）を使用できますが、一貫性を保つために、構成の`connectionId` プロパティと同一にしてください。

1. Liferay DXPクラスターノードを起動します。

これで接続が構成されました。

![CCR（READ）接続が構成され、使用できるようになりました。](./configuring-ccr-in-a-local-follower-data-center/images/03.png)

あとは、CCR自体を有効にして構成するだけです。

## クラスター横断レプリケーションモジュールの設定

LESクラスター横断レプリケーションモジュールは、リーダークラスターの後続、およびリーダークラスターからフォロワークラスターへのすべてのインデックスの初期レプリケーションをトリガーします。 フォローとレプリケーションをトリガーするには、構成ファイル（`.config`）を介してではなく、システム設定のUIでCCR機能を有効にする必要があります。 いずれかのデータセンターのLiferay DXPノードからCCRを構成します。

1. グローバルメニューを開き **コントロールパネル** &rarr; **システム設定** に来ます。 ［**検索機能**］ カテゴリを開きます。

1. ［**クラスター横断レプリケーション**］ を開きます。

1. ［**ローカルクラスターからの読み取り**］ のボックスをオンにします。

1. ［**ローカルクラスター設定**］ に値を1つ設定します （`localhost:9080,ccr`）。

   ```{important}
   ここでは、決してリモートデータセンターに値を設定しないでください（例では、`localhost:8080,remote`となります）。 これを設定すると、同じ名前のリーダーインデックスがすでに存在するリモートクラスタにフォロワーインデックスが作成されます。
   ```

   これは、読み取り専用とする接続を定義するものです。 人間の言語で言うと、ここの各エントリは「このアドレス（`localhost:9080`）のLiferayサーバーはこの名前（この例では`ccr`）のElasticsearch接続から読み取りを行う」ということを示しています。

1. **アップデート** をクリックします。

本番環境のセットアップでは、リモートのElasticsearchクラスターに別のトランスポートアドレスを設定したり（この例ではデフォルトを使用）、フォロワーのElasticsearchクラスターへのレプリケートから一部のインデックスを除外したりすることができます。 これらの目的のための設定フィールドがあります。

**リモートクラスター内シードノードのトランスポートアドレス** ：リモートクラスターとローカルクラスター間の接続を確立するために使用される、リモートクラスター内のノードのトランスポートアドレス。 デフォルトは`localhost:9300`です。

**除外するインデックス** ：クラスター横断レプリケーションから除外するインデックス名を入力します。 ピリオド（.）で始まるインデックスは常に除外されます。 デフォルトでは、リモートクラスター内のすべてのインデックスがローカルクラスターにレプリケートされます。 自動レプリケーションが有効になっていない場合、この設定は無視されます。

**自動レプリケーションが有効** ：ローカルクラスターからの読み取りが有効になっている場合、ローカルElasticsearchクラスターでのフォロワーインデックスの自動作成を有効または無効にします。 Elasticsearchを介してレプリケーションを手動で管理する場合は、この設定を無効にします。 デフォルトは ［**有効**］ です。

![システム設定でCCRを構成します。](./configuring-ccr-in-a-local-follower-data-center/images/02.png)

インデックスレプリケーションが成功し、読み取り接続が有効になっていることを示すログメッセージが表示されます。

```
2021-01-22 02:15:11.112 INFO  [liferay/configuration-1][CrossClusterReplicationConfigurationModelListener:163] Creating follower indexes
2021-01-22 02:15:12.864 INFO  [liferay/configuration-1][CrossClusterReplicationConfigurationModelListener:70] Read operations from local clusters are enabled
```

接続が構成され、インデックスがレプリケートされたら、システムが正しく機能していることを確認します。

## セットアップの確認

フォロワーのDXPクラスタノードで、「コントロールパネル」 &rarr; 「構成」 &rarr; 「検索」に移動します。 Liferay DXP 7.2では、 ［**Connections**］ タブもクリックする必要があります。 接続は次のようになります。

![検索管理パネルでElasticsearch 7の接続を確認します。](./configuring-ccr-in-a-local-follower-data-center/images/01.png)

これでCCRが構成されました。 構成で問題が発生した場合は、[トラブルシューティングガイド](./troubleshooting-cross-cluster-replication.md)を確認してください。
