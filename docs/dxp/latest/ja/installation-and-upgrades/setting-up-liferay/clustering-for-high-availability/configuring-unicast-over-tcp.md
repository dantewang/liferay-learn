# TCPを介したユニキャストの構成

ネットワーク構成またはクラスターノード間の地理的距離により、 [UDPマルチキャストクラスタリング](./configuring-cluster-link.md#using-multicast-over-udp) を使用できない場合は、TCPユニキャストを構成できます。 ファイアウォールがノードを分離している場合、またはノードが地理的に異なる場所にある場合は、これを使用する必要があります。

## ユニキャスト構成

ユニキャストを構成するには、次の手順を使用します。

1. JGroupsバインドアドレスパラメーターを各ノードのアプリサーバーのJVMに追加します。

    ```bash
    -Djgroups.bind_addr=[place your IP address or host name here]
    ```

    ノードのIPアドレスまたはホスト名を使用します。

1. ノードが互いを見つけるために使用する検出プロトコルを選択します。 プロトコルの選択肢は次のとおりです。

    * `TCPPing`
    * `JDBCPing`
    * `S3_Ping`
    * `Rackspace_Ping`

    どれを選択すればよいかわからない場合は、TCPPingを使用してください。 これらの残りのステップでは、TCPPingを使用します。 他の詳細は、 [Alternative Discovery Protocols](#alternative-discovery-protocols) を参照してください。
    <!-- the craziness in the next step is probably an example of something that Brian Chan would want to see get improved in the product. We should bring this up w/ the core team or with Brian Chan himself to see his thoughts. jrhoun -->

1. `$LIFERAY.HOME/osgi/marketplace/Liferay Foundation - Liferay Portal - Impl.lpkg/com.liferay.Portal.cluster.multiple-[version].jar/lib/jgroups-[version].Final.jar/tcp.xml`から`tcp.xml`ファイルをDXP Webアプリケーションの`WEB-INF/classes`フォルダ内の`jgroups`というフォルダなど、DXPにアクセスできる場所に展開します。

    ```
    WEB-INF/classes/jgroups/tcp.xml
    ```

    この `tcp.xml` 設定ファイルは、クラスタリンクの制御チャネルとトランスポートチャネルの両方に使用されることに注意してください。 別々の設定ファイルを使用する場合は、 [Using Different Control and Transport Channel Ports](#using-different-control-and-transport-channel-ports) を参照してください。

1. `tcp.xml` ファイルで、TCPバインドポートをノードの未使用ポートに設定します。 以下に例を示します。

    ```xml
    <TCP bind_port="7800"/>
    ```

1. `tcp.xml` ファイルで、ノードのIPアドレスとそのノードの未使用ポートを指定して、各ノードをTCPPingで検出できるようにします。 前のステップを基にして、以下は `<TCPPing>` 要素の例です。

    ```xml
    <TCP bind_port="7800"/>
    <TCPPING async_discovery="true"
        initial_hosts="192.168.224.154[7800],192.168.224.155[7800]"
        port_range="1"/>
    ```

    ```{important}
    TCCPingが各チャンネルを作成するために追加のポートをプローブするように、`port_range`が`1`に設定されていることに注意してください。 例えば、`initial_hosts="HostA[7800],HostB[7800]` の場合、TCCPingはポート7800と7801でHostAとHostBの両方にコンタクトしようとします。 この値は、必要なポート数（チャンネル数から1を引いた数）をカバーするように設定してください。 
    ```


    **Regarding Initial Hosts:**

    * 最初のホスト値がすべてのノードに対応していることを確認してください。 TCP XMLファイルまたはJVM引数で `initial_hosts` が指定されていない場合、 `localhost` が初期ホストです。
    * TCP XMLファイルで初期ホストを指定する代わりに、次のようなJVM引数を使用してアプリサーバーにそれらを指定することもできます。

        ```
        -Djgroups.tcpping.initial_hosts=192.168.224.154[7800],192.168.224.155[7800]
        ```

1. `tcp.xml` ファイルを各ノードの同じ場所にコピーして、TCPバインドポートが各ノードの未使用のポートに設定されていることを確認します。 JVMの引数を必ず参照してください。 たとえば、IPアドレス `192.168.224.155`のノードで、次のようにTCPPingを構成します。

    ```xml
    <TCP bind_port="7800"/>
    <TCPPING async_discovery="true"
        initial_hosts="${jgroups.tcpping.initial_hosts:192.168.224.154[7800],192.168.224.155[7800]}"
        port_range="1"/>
    ```

1. 各ノードの[`portal-ext.properties`ファイル](../../reference/portal-properties.md)の [クラスターリンクプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Cluster%20Link) を変更して、クラスターリンクを有効にし、各クラスターリンクチャネルのTCP XMLファイルをポイントします。

    ```properties
    cluster.link.enabled=true
    cluster.link.channel.properties.control=/jgroups/tcp.xml
    cluster.link.channel.properties.transport.0=/jgroups/tcp.xml
    ```

上記のJGroups構成は、通常、Unicast over TCPに必要なすべての構成です。 しかし、非常に特殊なケースとして、 (**そしてその場合のみ**) クラスタノードが複数のネットワークに渡って配置されている場合、各ホストの `external_addr` TCP transport parameter にファイアーウォールの外部 (public IP) アドレスを設定しなければなりません。 この種の構成は通常、ノードが地理的に離れている場合にのみ必要です。 これを設定することにより、別々のネットワークにデプロイされたクラスター化されたノード（たとえば、異なるファイアウォールによって分離されたノード）は互いに通信できます。 この構成は、システムのセキュリティ監査でフラグが立てられる場合があります。 詳細は、 [JGroups documentation](http://www.jgroups.org/manual4/index.html#_transport_protocols) を参照してください。

```{note}
`singleton_name`TCP属性はJGroups v4.0.0で非推奨になったため、JGroups v4.1.1-Finalを使用するLiferay DXP 7.2 SP1およびLiferay Portal GA2以降では削除されました。
```

これで、TCPクラスタリングを介したユニキャストがセットアップされました。

## 代替発見プロトコル

TCP Pingは、大部分のユースケースに適合するために使用できるデフォルトの検出プロトコルです。 ただし、以下で説明する他の検出プロトコルを使用することもできます。

### JDBC Ping

TCP Pingを使用してクラスターメンバーを検出する代わりに、すべてのノードがアクセスできる中央データベースを使用して、お互いを見つけやすくすることができます。 クラスターメンバーは自分のメンバーを書き込み、このデータベースから他のメンバーのアドレスを読み取ります。 この構成を有効にするには、 [ユニキャスト構成](#unicast-configurations) 手順で参照されている `TCPPING` タグを、対応する `JDBC_PING` タグに置き換えます。

```xml
<JDBC_PING
    connection_url="[place the URL to your database here]"
    connection_username="[place your user name here]"
    connection_password="[place your password here]"
    connection_driver="[place your driver name here]"/>
```

JDBC接続値の例については、 [データベーステンプレート](../../reference/database-templates.md) を参照してください。 JDBC Pingの詳細は、 [JGroups Documentation](http://www.jgroups.org/manual4/index.html#DiscoveryProtocols) を参照してください。

### S3 ping

Amazon S3 Pingは、AmazonのEC2クラウドサービスで実行されているサーバーに使用できます。 各ノードは小さなファイルをS3バケットにアップロードし、他のすべてのノードはこのバケットからファイルを読み取って他のノードを検出します。 ノードが離れると、そのファイルは削除されます。

S3 Pingを構成するには、 [ユニキャスト構成](#unicast-configurations) ステップの `TCPPING` タグを、対応する `S3_PING` タグに置き換えます。

```xml
<S3_PING
    secret_access_key="[SECRETKEY]"
    access_key="[ACCESSKEY]"
    location="ControlBucket"/>
```

上記のパラメーターの値としてAmazonキーを指定します。 S3 Pingの詳細は、 [JGroups Documentation](http://www.jgroups.org/manual4/index.html#_s3_ping) を参照してください。

### その他のping

JGroupsは、Rackspace Ping、BPing、File Pingなど、クラスターメンバーがお互いを発見するための他の手段を提供します。 これらの検出方法については、 [JGroups Documentation](http://www.jgroups.org/manual4/index.html#DiscoveryProtocols) を参照してください。

## 異なる制御およびトランスポートチャネルポートの使用

制御チャネルとトランスポートチャネルは、異なるポートを使用するように構成できます。 個別の制御チャネルポートとトランスポートチャネルポートを使用すると、制御トラフィックとトランスポートトラフィックを監視でき、情報を分離して問題を診断できます。

次の手順では、Unicast over TCPPingを使用してアプローチを示します。

1. 各ノードでアプリサーバーのJVMにパラメーターを追加します。

    ```bash
    -Djgroups.bind_addr=[node_ip_address]
    ```

1. `$LIFERAY.HOME/osgi/marketplace/Liferay Foundation - Liferay Portal - Impl.lpkg/com​.​liferay​.​portal​.​cluster​.​multiple​-​[version].​jar/lib​/​jgroups​-​[version].​Final​.​jar/tcp.xml`から`tcp.xml`ファイルをDXP Webアプリケーションの`WEB-INF/classes`フォルダ内の`jgroups` というフォルダなど、DXPにアクセスできる場所に展開します。

1. 同じ場所に`tcp.xml`のコピーを作成し、両方のファイルの名前を変更して、1つを制御チャネル用に、もう1つをトランスポートチャネル用に指定します。 たとえば、次のファイル名を使用できます。

    * `tcp-control.xml`
    * `tcp-transport.xml`

1. ノードの[`portal-ext.properties`ファイル](../../reference/portal-properties.md)の [クラスターリンクプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Cluster%20Link) を変更して、クラスターリンクを有効にし、各クラスターリンクチャネルのTCP XMLファイルをポイントします。

    ```properties
    cluster.link.enabled=true
    cluster.link.channel.properties.control=/jgroups/tcp-control.xml
    cluster.link.channel.properties.transport.0=/jgroups/tcp-transport.xml
    ```

1. 各 `tcp-*。xml` ファイルのTCPおよび検出プロトコルタグ（たとえば、TCPPingを使用している場合は `TCPPing` タグ）を変更して、各ノードのIPアドレスとバインドポートを考慮します。

垂直方向にクラスタリングしている場合（つまり、同じ物理システムまたは仮想システムで複数のサーバーを実行している場合）、すべてのチャネルは、ディスカバリ通信に未使用の一意のバインドポートを使用する必要があります。 各 `tcp-*。xml` ファイルで、TCPタグの `bind_port` 属性を一意の未使用ポートに割り当てます。

たとえば、最初の2つのノードがこれらのバインドポートを割り当てる場合があります。

| ノード  | プロパティファイル           | 港      |
|:---- |:------------------- |:------ |
| ノード1 | `tcp-control.xml`   | `7800` |
| ノード1 | `tcp-transport.xml` | `7801` |
| ノード2 | `tcp-control.xml`   | `7802` |
| ノード2 | `tcp-transport.xml` | `7803` |

次に、同じシステム（つまり、同じIPアドレス）で実行されているノードのバインドポートを使用するTCPおよびTCPPing要素の例を示します。

**ノード1 `tcp-control.xml`**

```xml
<TCP bind_port="7800"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7800],192.168.224.154[7802]"
    port_range="0"/>
```

**ノード1 `tcp-transport.xml`**

```xml
<TCP bind_port="7801"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7801],192.168.224.154[7803]"
    port_range="0"/>
```

**ノード2 `tcp-control.xml`**

```xml
<TCP bind_port="7802"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7800],192.168.224.154[7802]"
    port_range="0"/>
```

**ノード2 `tcp-transport.xml`**

```xml
<TCP bind_port="7803"/>
<TCPPING async_discovery="true"
    initial_hosts="192.168.224.154[7801],192.168.224.154[7803]"
    port_range="0"/>
```

キャッシュできるエンティティを追加した場合、またはシステムのキャッシュ構成を調整したい場合は、モジュールを使用して行うことができます。  キャッシュの構成については、 [Cache Configuration](https://help.liferay.com/hc/ja/articles/360035581451-Introduction-to-Cache-Configuration) を参照してください。

## 追加情報

* [クラスタリンクの構成](./configuring-cluster-link.md)
* [高可用性のためのクラスタリング](../clustering-for-high-availability.md)
