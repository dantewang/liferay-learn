---
toc:
  - ./liferay-authentication/other-authentication-methods.md
  - ./liferay-authentication/authorization.md
visibility:
- Employee
- Partner
---
# Liferay 認証

**概要**

* ほとんどの見込み客は認証されたアプリケーションを必要とする
* 認証は、誰がアプリケーションへのログインを許可されるかを決定する。
* 認証は、ログイン後に許可されることを決定する。
* Liferayは独自のID管理機能を提供する
* Liferay 認証は、スタンドアロンで自己完結型の顧客アプリケーションには十分です。

```{note}
* 本モジュールのライブワークショップの [録画](https://learn.liferay.com/ja/c/portal/login) をご覧ください。
* 上記ワークショップで使用されたプレゼンテーション資料はこちら [PDF](https://learn.liferay.com/ja/c/portal/login) からダウンロードしてください。
```

## 背景

ここまでのデモでは、 [公開ページ](./public-pages-experience.md) のみがカバーされている。 このようなタイプのページは、公開Webサイトのようなアプリケーションには最適ですが、多くの（ほとんどではないにしても）Liferayアプリケーションでは、誰がシステムにアクセスできるのか、そしてアクセスしたら何ができるのかを制御する必要があります。

このモジュールは、誰もがログインできるわけではないアプリケーションをサポートするためにLiferayが提供する機能をカバーします。

このモジュールはLiferayがサポートする機能をカバーしています：

* 認証
* 承認

## 認証と認可

例えば、携帯電話や銀行口座へのログインなどだ。 例えば、指紋や顔認識、あるいはセキュリティコードやパスワードのような伝統的なものだ。

これらのテクニックを組み合わせて使用することもあり、その場合、システムは多要素認証（MFA）を利用している。

ユーザーがシステムに "ログイン "するとき、2つの別々の、しかし関連したことが行われることを理解することが重要である：認証（Authentication）と認可（Authorization）である。

**認証**

簡単に説明すると、認証とは、ユーザーが誰であるかを識別するプロセスであり、システムへのアクセスを許可するかどうかを決定するものである。

**承認**

ユーザが認証されると、認可とは、そのユーザがどの情報にアクセスすることが許可されているかを決定するプロセスである。どの情報を見ることができるか、新しい情報を作成することが許可されているか、既存の情報を編集することが許可されているか、あるいは情報を削除することが許可されているかどうかなどである。

例えるなら、認証のプロセスは鍵を開けるようなものだと考えることができる。 Liferay DXPでは、ユーザーを認証するためにさまざまなタイプのロックが利用できます。

## Liferay 認証

Liferayは独自のアイデンティティ管理機能を備えている：

* ユーザー作成
* パスワードの定義
* アクセスできる範囲を指定する

顧客ポータルや専用の社内システムなど、ログインできるユーザーが限定された、スタンドアロンまたは自己完結型の顧客アプリケーションの場合は、これらの機能で必要十分でしょう。

デモでLiferayの認証機能について話すとき、Liferayがユーザーを認証する3つの異なる方法を提供していることを説明すると便利です：

* スクリーン名
* メールアドレス
* ユーザーID

販売プロセスのこの段階では、通常、これらの機能について高レベルで話すだけで十分であ る。単純なユースケースの場合、顧客が別の ID 管理システムを必要としないという事実で十 分である。

しかし、Liferayは基本的な認証に加え、管理者がパスワードポリシーを定義できるようにするなど、多くの追加機能を提供しています：

* パスワードの最小長
* パスワードに含めなければならない文字
* 有効期限
* 以前のパスワードを再利用できるかどうか
* など。

また、Loginが表示されるほとんどのデモでは、Liferay独自のID管理機能が使用されることを覚えておくことも重要である。 しかし、プロダクション・アプリケーションで使用できるアプローチは他にもたくさんある：

* OpenId Connect
* SAML
* シングルサインオン
* アイデンティティ管理システム

これらはすべて次のセクションで説明する。 [その他の認証方法](./liferay-authentication/other-authentication-methods.md)。
