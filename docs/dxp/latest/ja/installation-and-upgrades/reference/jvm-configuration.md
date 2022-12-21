# JVM設定

Liferay DXP/PortalにはJava JDK 8 または11が必要であり、特定のJVMオプション設定が必要です。 JDK 11に固有の推奨設定と推奨されるベースラインメモリ設定もあります。 ここでは、これらすべての設定について学習し、Tomcatスクリプトの例で説明します。

```{note}
JDKを選択するには [Liferay DXP互換性マトリクス](https://help.liferay.com/hc/ja/articles/360049238151) を参照してください。
```

## 推奨されるJVM設定

| 種類            | 設定/デフォルト                                  | 必須  | 説明                                                                                                                                                                                                                                    |
|:------------- |:----------------------------------------- |:--- |:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ファイルのエンコーディング | `-Dfile.encoding=UTF8`                    | はい  | DXPでは、国際化をサポートするためにUTF-8ファイルエンコーディングが必要です。                                                                                                                                                                                            |
| タイムゾーン        | `-Duser.timezone=GMT`                     | はい  | DXPは、すべての日付にGMTタイムゾーンを使用します。                                                                                                                                                                                                          |
| 4桁の年          | `-Djava.locale.providers=JRE,COMPAT,CLDR` | いいえ | JDK 11では、この設定で4桁の年を表示します。 JDK 9以降、Unicode Common Locale Data Repository（CLDR）がデフォルトのロケールプロバイダーです。 CLDRでは、4桁形式の年は提供されません（ [LPS-87191](https://issues.liferay.com/browse/LPS-87191) を参照）。 この設定は、JDK 8のデフォルトのロケールプロバイダーを使用することで問題を回避します。  |
| ヒープサイズ        | `-Xms2560m -Xmx2560m`                     | いいえ | デフォルトの最小サイズと最大サイズは、必要に応じて調整できますが、JVMが動的な調整を行わないように、最小サイズ (`-Xms`) と最大サイズ (`-Xmx`) を同じに設定することをお勧めします。                                                                                                                                  |
| Log4j         | `-Dlog4j2.formatMsgNoLookups=true`        | はい **| Log4j の 2.15.0 以前のバージョンには、LDAP JNDI パーサーを介したリモートコード実行(RCE) の脆弱性があります。 詳細は、 [LPS-143663](https://issues.liferay.com/browse/LPS-143663) を参照してください。 \** Liferay DXP 7.4 GA1およびLiferay PORTAL 7.4 GA1～GA3では、セキュリティ上の脆弱性を解消するためにこの設定が必要です。 |

サポートされているアプリケーションサーバーのLiferayインストールの記事では、これらの設定を適用する場所が説明されています。 記事のリンクは次の通りです。

* [Tomcat](../installing-liferay/installing-liferay-on-an-application-server/installing-on-tomcat.md)
* [WildFly](../installing-liferay/installing-liferay-on-an-application-server/installing-on-wildfly.md)
* [JBoss EAP](../installing-liferay/installing-liferay-on-an-application-server/installing-on-jboss-eap.md)
* [WebLogic](../installing-liferay/installing-liferay-on-an-application-server/installing-on-weblogic.md)
* [WebSphere](../installing-liferay/installing-liferay-on-an-application-server/installing-on-websphere.md)

## 既知の問題：不正アクセスの警告

JDK 11では、次のような **不正アクセス** 警告がログに出力されることがあります。

```message
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by com.liferay.petra.reflect.ReflectionUtil (file:/Users/malei/dev/project/bundles/master-bundles/tomcat-9.0.10/lib/ext/com.liferay.petra.reflect.jar) to field java.lang.reflect.Field.modifiers
WARNING: Please consider reporting this to the maintainers of com.liferay.petra.reflect.ReflectionUtil
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
```

これらの警告は既知の問題（ [LPS-87421](https://issues.liferay.com/browse/LPS-87421) ）が原因で発生し、次のJVMオプションを追加することで解決できます。

```
--add-opens=java.base/java.awt.font=ALL-UNNAMED
--add-opens=java.base/java.io=ALL-UNNAMED
--add-opens=java.base/java.lang=ALL-UNNAMED
--add-opens=java.base/java.lang.reflect=ALL-UNNAMED
--add-opens=java.base/java.net=ALL-UNNAMED
--add-opens=java.base/java.nio=ALL-UNNAMED
--add-opens=java.base/java.text=ALL-UNNAMED
--add-opens=java.base/java.util=ALL-UNNAMED
--add-opens=java.base/sun.nio.ch=ALL-UNNAMED
--add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
--add-opens=java.xml/com.sun.org.apache.xerces.internal.parsers=ALL-UNNAMED
```

## Tomcatスクリプトの例

以下は、上記のJVMオプションの一部を示すTomcat `setenv.sh`スクリプトです。

```properties
CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF-8 -Djava.locale.providers=JRE,COMPAT,CLDR -Djava.net.preferIPv4Stack=true -Duser.timezone=GMT -Xms2560m -Xmx2560m -XX:MaxNewSize=1536m -XX:MaxMetaspaceSize=768m -XX:MetaspaceSize=768m -XX:NewSize=1536m -XX:SurvivorRatio=7"
CATALINA_OPTS="$CATALINA_OPTS --add-opens=java.base/java.io=ALL-UNNAMED"
CATALINA_OPTS="$CATALINA_OPTS --add-opens=java.base/java.lang.reflect=ALL-UNNAMED"
```

Liferayは多くのアプリケーションサーバーをサポートしており、それらはすべて、選択したJVMオプションで構成することができます。