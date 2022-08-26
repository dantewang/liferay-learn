---
toc:
- ./service-builder/service-builder-basics.md
- ./service-builder/defining-entities.md
- ./service-builder/business-logic-with-service-builder.md
- ./service-builder/advanced-queries.md
- ./service-builder/reference.md
---

# サービスビルダー

```{toctree}
:maxdepth: 3

service-builder/service-builder-basics.md
service-builder/defining-entities.md
service-builder/business-logic-with-service-builder.md
service-builder/advanced-queries.md
service-builder/reference.md
```

信頼できるビジネスロジックや永続性のないアプリケーションは、たいしたアプリケーションではありません。 残念ながら、独自の永続コードを作成するには、多くの場合、かなりの時間がかかります。 サービスビルダーは、単一の`xml`ファイルからモデルレイヤー、永続レイヤー、およびサービスレイヤーを生成できるオブジェクト関係マッピングツールです。  生成されたコードは完全にカスタマイズ可能です。必要に応じて、カスタムSQLとともに独自の永続コードを記述できます。 永続コードの作成方法に関係なく、サービスビルダーを使用してアプリのビジネスロジックを実装できます。

ここでは、サービスビルダーを使用して以下のことを行う方法について学びます。

* 永続フレームワークを生成してカスタマイズする

* ビジネスロジックを実装する

`service.xml`ファイルでモデルとその関係を構成してサービスビルダーを実行すると、次のコードレイヤーが生成されます。

* **モデルレイヤー：**プロジェクトのエンティティを表すオブジェクトを定義します。

* **永続レイヤー：**データベースにエンティティを保存し、データベースからエンティティを取得します。

* **サービスレイヤー：**APIとビジネスロジックを作成する準備ができている空白のレイヤー。

主な機能は次のとおりです。

* カスタムビジネスロジックを実装するためのStubbed-outクラス

* Hibernateの構成

* 構成可能なキャッシュのサポート

* カスタムSQLクエリと動的クエリを追加するための柔軟性とサポート

```{note}
DXP/Portalのバックエンドサービスにはサービスビルダーを使用する必要はありません。 JPAやHibernateなど、選択した永続フレームワークを使用することは完全に可能です。 内部的には、サービスビルダーは[Hibernate](http://hibernate.org/)を使用することに注意してください。 
```

## 実装クラスによるカスタマイズ

サービスビルダーで生成されたエンティティには、次の*実装*クラスが含まれています。

* **エンティティの実装**（`*Impl.java`）：エンティティのカスタマイズを担当します。

* **ローカルサービスの実装** （`*LocalServiceImpl.java`）：永続レイヤーを呼び出してデータエンティティを取得および保存する役割を担います。 ローカルサービスはビジネスロジックを含み、永続レイヤーにアクセスします。 これらは、同じJava仮想マシンで実行されているクライアントコードによって呼び出すことができます。

* **リモートサービスの実装** （`*ServiceImpl.java`）：`service.xml`がリモートサービス用に構成されている場合に生成されます。 リモートサービスには通常、権限チェックコードが含まれており、JVMの外部からアクセスできるようになっています。 サービスビルダーは、JSONまたはSOAPを介してリモートサービスを利用できるようにするコードを自動的に生成します。また、[RESTビルダー](../../headless-delivery/apis-with-rest-builder.md)または[JAX-RS](https://help.liferay.com/hc/en-us/articles/360031902292-JAX-RS)を介して独自のリモートAPIを作成することもできます。

これらのクラスは、カスタムビジネスロジックを実装する場所です。 これらは、カスタマイズを目的としてサービスビルダーによって生成される唯一のクラスです。

## Hibernateの構成

サービスビルダーは、オブジェクト関係マッピングにHibernate永続フレームワークを使用します。 サービスビルダーは、Hibernateの複雑さを隠しつつ、動的クエリやカスタムSQLなどのテクノロジーへのアクセスを提供します。 Hibernate環境を手動でセットアップしたり、構成を行ったりすることなく、プロジェクトでオブジェクト関係マッピング（ORM）を利用できます。

## キャッシュ

サービスビルダーは、*エンティティ*、*ファインダー*、および*Hibernate*の3つのレベルでオブジェクトをキャッシュします。 デフォルトでは、Liferayはこれらの各キャッシュレベルの基盤となるキャッシュプロバイダーとしてEhcacheを使用します。 ただし、これは[ポータルプロパティ](../../installation-and-upgrades/reference/portal-properties.md)を介して構成できます。  プロジェクトでエンティティとファインダーのキャッシュを有効にするには、`service.xml`ファイルでエンティティの`<entity>`要素の`cache-enabled=true`属性を設定するだけです。 [Liferay Clustering](../../installation-and-upgrades/setting-up-liferay/clustering-for-high-availability.md)では、クラスター内のLiferayキャッシングについて説明しています。

## 動的クエリとカスタムSQLクエリ

サービスビルダーは、データベース永続コードの作成に関連する一般的なタスクの多くを自動化しますが、カスタムSQLクエリの作成を妨げることはありません。 XMLファイルでカスタムSQLクエリを定義し、クエリを実行するためのファインダーメソッドを実装できます。 何か集中して作業が必要な場合でも、サイトビルダーは邪魔になりません。 動的クエリを使用して、Hibernateの基準APIにアクセスすることもできます。

## 次のステップ

サイトビルダーは、Liferay DXPとそのアプリケーション全体で排他的に使用されるため、十分にテストされており、堅牢です。 これにより、初期開発時間と、プロジェクトの保守、拡張、またはカスタマイズに費やす必要のある時間の両方で、多くの開発時間が節約されます。 開始するには、[Service Builder Basics](./service-builder/service-builder-basics.md)から始めてください。
