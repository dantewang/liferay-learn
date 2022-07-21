# クラスタノードのデータベース構成

最低でも、DXP クラスタのノードが機能するためには、同じデータベース</a> （またはデータベースクラスタ）を共有するように

構成されている必要があります。 ここで説明する最適化は、DXPクラスターのデータベースパフォーマンスをさらに向上させることができるため、DXPの使用状況と予想されるトランザクション量を考慮して検討する必要があります。</p> 



```{warning}
クラスタリングは、組み込みHSQLデータベースでは機能しません。
```




## 読み書きデータベース構成

データベースのパフォーマンスを向上させるために、読み取り/書き込みデータベース構成を使用できます。 この戦略では、読み取り操作と読み取り/書き込み操作に同じデータソースを使用する代わりに、操作の種類ごとに個別のデータソースを使用します。 DXPのアスペクト指向プログラミング（AOP）トランザクションインフラストラクチャは、読み取りトランザクションを読み取りデータソースに送信し、読み取り/書き込みトランザクションを書き込みデータソースに送信します。

![読み書きデータベースの相互作用](./database-configuration-for-cluster-nodes/images/01.png)

次のセクションで説明するように、読み取りと読み取り/書き込み [データソース](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC) を分離する接続は、JDBCまたはJNDI [ポータルプロパティ](../../reference/portal-properties.md) （たとえば、 [`portal-ext.properties` ファイル](../../reference/portal-properties.md)）を使用して構成されます。 データソースは、DXPデータベースの個別のインスタンスを使用する必要があります。この場合、読み取り/書き込みデータベースインスタンスが読み取りデータベースインスタンスに複製されます。



### JDBC

次の手順に従って `portal-ext.properties` ファイルを編集し、 [JDBC](../../installing-liferay/configuring-a-database.md)を使用して個別の読み取りおよび書き込みデータソースに直接接続します。

1. デフォルトの接続プールプロバイダーを設定します。 プロバイダー情報については、 [JDBCプロパティリファレンス](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#JDBC)を参照してください。 デフォルト設定では、プールプロバイダーとして [HikariCP](https://github.com/brettwooldridge/HikariCP)が指定されています。 
   
   

    ```properties
    jdbc.default.liferay.pool.provider=hikaricp
    ```


1. 個別の読み取りおよび書き込みデータソースへのJDBC接続を構成します。 以下に例を示します。 
   
   

    ```properties
    jdbc.read.driverClassName=[place your driver name here]
    jdbc.read.url=[place the URL to your "read" database here]
    jdbc.read.username=[place your user name here]
    jdbc.read.password=[place your password here]

    jdbc.write.driverClassName=[place your driver name here]
    jdbc.write.url=[place the URL to your "read-write" database here]
    jdbc.write.username=[place your user name here]
    jdbc.write.password=[place your password here]
    ```


JDBC接続値の例については、[Database Templates](../../reference/database-templates.md)を参照してください。

1. 書き込みデータソース(プレフィックスが`jdbc.write.`のデータソース)を使用して[カウンタ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Counter)データソースを作成するようにDXPを設定します。 別のデータソースは常にカウンター専用です。 
   
   

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```


1. オプションで、データ接続を検証して、不正な接続が適切に処理されることを確認します。
   
   JDBC4で使用される一部の接続プール（ドライバーのJDBCバージョンを確認）は、接続を自動的に検証します。 他の接続プールでは、ベンダー固有の追加の接続検証プロパティが必要になる場合があります。ポータルプロパティファイルで指定してください。 接続検証の詳細は、接続プールプロバイダーのドキュメントを参照してください。

1. デフォルトの [`spring.configs` および `spring.infrastructure.configs`ポータルプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) を `portal-ext.properties` ファイルにコピーし、次のSpring構成ファイルのパスをそれらに追加して、読み取り/書き込みデータベース構成を有効にします。
   
   `spring.configs`に追加します。 
   
   

    ```
    META-INF/dynamic-data-source-spring.xml
    ```


`spring.infrastructure.configs`に追加します。 



    ```
    META-INF/dynamic-data-source-infrastructure-spring.xml
    ```


詳細は、 [Spring構成のポータルプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring)参照してください。



### JNDI

次の手順に従って `portal-ext.properties` ファイルを編集し、JNDIを使用してアプリサーバーの読み取りおよび書き込みデータソースに接続します。

1. 読み取りおよび書き込みJNDIデータソースのユーザー名とパスワードを設定します。 
   
   

    ```properties
    jdbc.read.jndi.name=[place your "read" data source JNDI name here]

    jdbc.read.username=*[place your user name here]
    jdbc.read.password=[place your password here]

    jdbc.write.jndi.name=[place your "read-write" data source JNDI name here]

    jdbc.write.username=[place your user name here]
    jdbc.write.password=[place your password here]
    ```


1. 書き込みデータソース(プレフィックスが`jdbc.write.`のデータソース)を使用して[カウンタ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Counter)データソースを作成するようにDXPを設定します。 別のデータソースは常にカウンター専用です。 
   
   

    ```properties
    counter.jdbc.prefix=jdbc.write.
    ```


1. オプションで、データ接続を検証して、不正な接続が適切に処理されることを確認します。
   
   JDBC4で使用される一部の接続プール（ドライバーのJDBCバージョンを確認）は、接続を自動的に検証します。 他の接続プールでは、ベンダー固有の追加の接続検証プロパティが必要になる場合があります。ポータルプロパティファイルで指定してください。 接続検証の詳細は、接続プールプロバイダーのドキュメントを参照してください。

1. デフォルトの [`spring.configs` および `spring.infrastructure.configs`ポータルプロパティ](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring) を `portal-ext.properties` ファイルにコピーし、次のSpring構成ファイルのパスをそれらに追加して、読み取り/書き込みデータベース構成を有効にします。
   
   `spring.configs`に追加します。 
   
   

    ```
        META-INF/dynamic-data-source-spring.xml
    ```


`spring.infrastructure.configs`に追加します。 



    ```
    META-INF/dynamic-data-source-infrastructure-spring.xml
    ```


詳細は、 [Spring configuration Portal Properties](https://learn.liferay.com/reference/latest/en/dxp/propertiesdoc/portal.properties.html#Spring)参照してください。

DXPは、次回の起動時に、読み取りデータソース、書き込みデータソース、およびカウンターデータソースを使用します。



## データベースの複製

データベースクラスタを使用すると、フォールトトレランスとDXPのパフォーマンスが向上します。 データベースクラスタインスタンスは常に同期している必要があります。 レプリケーションは、変更されたデータと変更されたスキーマを1つのデータベースインスタンスから別のデータベースインスタンスにコピーするプロセスです。 サポートされるすべての [データベース](https://help.liferay.com/hc/en-us/articles/360049238151) はレプリケーションをサポートします。 データベースクラスターを使用している場合は、データベースベンダーの指示に従って、データベースをレプリケーション用に設定します。



## 次のステップ

クラスター用のデータベースを設定したので、 [DXP クラスタリングの要件](./clustering-for-high-availability.md#clustering-requirements)に引き続き対処することができます。 次の要件は、すべてのノードが [ファイルストア](../../../system-administration/file-storage.md)にアクセスできるようにし、そのファイルストアで各ノードを構成することです。