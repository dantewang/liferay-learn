# データプロバイダーの概要

データプロバイダーは、Formsアプリケーションで使用できるデータを提供します。 RESTデータプロバイダーはFormsアプリケーションに含まれています。 これにより、 [RESTウェブサービス](https://en.wikipedia.org/wiki/Representational_state_transfer) からデータを使用し、フォームフィールドを自動入力することができます。

* [RESTデータプロバイダーを使用して、フォームのオプションを入力します。](./using-the-rest-data-provider-to-populate-form-options.md)
* [RESTデータプロバイダーと自動入力ルールを使って、フォームフィールドを自動入力することができます。](../form-rules/using-the-autofill-rule.md)

よくある例としては、RESTデータプロバイダーを使用して、［リストから選択］フィールドのオプションに国のリストを入力することが挙げられます。

## 登録済みのJSON Webサービス

データソースの中には、 [restcountries.com](https://restcountries.com) データプロバイダーのようなサードパーティーのソースから取得するものもあります。 また、Liferay DXPには独自に登録されたWebサービスがあります。 ローカルサーバーを実行している場合は、 [http://localhost:8080/api/jsonws](http://localhost:8080/api/jsonws) でリストを参照してください。 国のリストを入力する場合、2つの`get-countries` JSON Web サービスがありますが、どちらでも動作します。 _［Invoke］_をクリックすると、結果が生成されます。

```{warning}
ローカルテスト環境でLiferayのWebサービスとデータプロバイダを使ってテストするには、ローカルネットワークアクセスを有効にする必要があります。 [ローカルネットワーク上のデータへのアクセスの有効化]を参照してください（./using-the-rest-data-provider-to-populate-form-options.md#enabling-access-to-data-on-the-local-network` __）。
```

_［Result］_タブには、次のアフガニスタンのレコードのように、JSON構文を使用した国のリストが表示されます。

```json
[
  {
    "a2": "AF",
    "a3": "AFG",
    "countryId": "20",
    "idd": "093",
    "mvccVersion": "0",
    "name": "afghanistan",
    "nameCurrentValue": "Afghanistan",
    "number": "4"
  },
    ...
```

Webサービスから選択可能なフィールドを選択します。 `get-countries`の場合は、適切に大文字で表記された国の完全な名前が含まれているため、ほとんどの場合`nameCurrentValue`となります。

［URL例］タブで、データプロバイダーの作成時に使用するURLを探します。 これは、`get-countries` JSON Webサービスにアクセスする際に生成されるものと同じです。 ユーザーは、登録されているJSON WebサービスのURLを、これと同じ手順で見つけることができます。

![［URL例］タブには、対応するJSON Webサービスが表示されます。](./data-providers-overview/images/02.png)

## データプロバイダー設定リファレンス

フォームアプリケーションからデータプロバイダーを設定するには、 _［サイト管理］_ &rarr; _［コンテンツ & データ］_ &rarr; _［フォーム］_へ行きます。 _［データプロバイダー］_タブをクリックし、（![Add icon](../../../images/icon-add.png)）アイコンをクリックして開始します。 データプロバイダーを設定する際には、いくつかのフィールドに入力する必要があります。

![このデータサービスでは、国を返します。](./data-providers-overview/images/03.png)

### URL (Automatic Copy)

内部または外部のRESTサービスのエンドポイントのURLを入力します。 上記の例では、<https://restcountries.com/>にあるRESTサービスを示していて、このサービスには`region`で国を検索するエンドポイントが含まれています。

`https://restcountries.com/rest/v2/region/{region}`

データプロバイダーのURLには、パスパラメーターとクエリパラメーターの2種類のパラメーターを指定できます。

パスパラメーターは、REST Webサービスを呼び出すURLの一部で、`https://service-url.com/service/{path_parameter_name}`というパターンを使用して追加されます。

たとえば、 `restcountries.com`サービスの`region`エンドポイントのパスパラメーターは`{region}`です。 パスパラメーターはURLの必須部分なので、URLのパスパラメーターに一致する _［パラメーター］_フィールド値を持つ入力（下記参照）を指定してください。

クエリパラメーターは、サービス呼び出しの出力を絞り込むためのURLの補完的な部分で、`?query_parameter=query_parameter_value`というパターンに従います。

    https://restcountries.com/rest/v2/all?fields=capital

パスパラメーターとは異なり、クエリパラメーターはオプションです。

### ユーザー名とパスワード

必要に応じて、REST Webサービスへの認証に使用する認証情報を入力します。

### 初回リクエスト時のデータキャッシュ

データがキャッシュされている場合は、RESTサービス・プロバイダーへの2回目の呼び出しが不要になるため、リストを選択フィールドの2回目のロードがより速くなります。

### タイムアウト

リクエストを中止する前にREST呼び出しの応答を待機する時間（ミリ秒単位）を入力します。

### 入力

RESTサービスからのパスパラメーターまたはクエリパラメーターを設定して、RESTサービスの応答を絞り込みます。 ラベル、パラメーター、タイプ（テキストまたは数値）を指定し、データプロバイダーを使用するために入力が必要かどうかを選択します。

### 出力

出力は、オートコンプリートが有効なリストから選択フィールドまたはテキストフィールドに表示するパラメーターです。 複数の出力を追加することができます。 出力は入力によって絞り込むことができますが（上記参照）、入力フィルタリングを設定せずに表示することもできます。 ラベル、パス、タイプ（テキスト、数字、リスト）を指定します。

複数の入力を追加することができます。 入力値を指定する方法を提供するには、 [自動入力ルール](../form-rules/using-the-autofill-rule.md)を使用します。 ユーザーが1つのフィールドに入力すると、その入力内容がRESTサービスに送信されます。 RESTサービスの応答データは、入力パラメータによってフィルタリングされます。

出力パスフィールドは [JsonPath構文](https://github.com/json-path/JsonPath) で指定されるため、必ず`$`で始まる必要があります。 パスが返すデータのタイプは、［Type］フィールドで選択したタイプと一致する必要があります。 `restcountries.com` サービスを使用して、[パス]フィールドに`$..name`と入力することで、`name`フィールドを出力として指定します。 より複雑なJsonPath式を構築する必要がある場合（たとえば、人口1億人以上のすべての国の名前が必要な場合 --- `restcountries.com`サービスを使用した `$..[?(@.population>100000000)].name`）は、 [こちら](http://jsonpath.herokuapp.com/) や [こちら](https://jsonpath.com/) のように`JsonPath`エバリュエーターを使用することを検討してください。

```{tip}
ある値を表示し、別の値をデータベースに保存するには、[Paths]フィールドにセミコロンで区切って両方を入力します（`$..name;$..numericCode`）。
```

`restcountries.com`データプロバイダーを使用している場合は、ユーザーには国名が表示され、データベースには数字の国コードが保存されます。

## 次のステップ

* [RESTデータプロバイダーを使用してフォームオプションを入力する](./using-the-rest-data-provider-to-populate-form-options.md)
* [自動入力ルールの使用](../form-rules/using-the-autofill-rule.md)
