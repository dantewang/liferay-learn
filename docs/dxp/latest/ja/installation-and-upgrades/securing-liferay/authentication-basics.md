---
uuid: f5ccd64e-f615-4141-bbb5-eff00cdcf1ca
---
# 認証の基本

デフォルトでは、Liferay DXPは ［**Sign In**］ ウィジェットを使用してユーザーを認証します。

```{note}
［Sign In］ウィジェットは、`http[s]://[server-name:port]/web/guest/home`のデフォルトのホームページに表示されます。 ［Sign In］ウィジェットがどのページでも使用できない場合は、URL `http[s]://[server-name:port]/c/portal/login`から直接アクセスできます。
```

![デフォルトのLiferayホームページ](./authentication-basics/images/01.png)

ユーザーやアプリケーションを認証する他の方法を設定できます。

* [LDAP](../../users-and-permissions/connecting-to-a-user-directory/connecting-to-an-ldap-directory.md)
* [SAML](./configuring-sso/authenticating-with-saml/saml-authentication-process-overview.md)
* [Kerberos](./configuring-sso/authenticating-with-kerberos.md)
* [OpenId Connect](./configuring-sso/using-openid-connect.md)
* [トークンベースのソリューション](./configuring-sso/token-based-authentication.md)
* [OAuth 2.0](../../headless-delivery/using-oauth2.md)

[認証検証](./securing-web-services/using-authentication-verifiers.md)はリモートアプリケーションの認証を管理でき、[認証パイプライン](../../building-applications.md)はユーザーが1つまたは複数のシステムによって検証される方法を定義します。

## 認証の種類

ユーザーは、次の3つの認証タイプのいずれかを使用してログインするように設定できます。

| 認証の種類   | Description               | デフォルトで使用されているか |
|:------- |:------------------------- |:-------------- |
| スクリーン名  | アカウント作成時に管理者またはユーザーが決定します | いいえ            |
| メールアドレス | アカウント作成時に管理者またはユーザーが決定します | はい             |
| ユーザーID  | アカウントの作成時に自動的に生成されます      | いいえ            |

```{note}
一度に使用できる認証タイプは1つだけです。
```

認証タイプに関係なく、ユーザーは常にパスワードを入力する必要があります。 [パスワードポリシー](../../users-and-permissions/roles-and-permissions/configuring-a-password-policy.md)を作成して、パスワードの長さ、パスワードの形式、有効期限などを定義できます。

**認証の種類** は、コントロールパネルまたはプロパティファイルから設定できます。

### コントロールパネルから認証の種類を設定する

1. コントロールパネルに移動します。
1. ［**Configuration**］ &rarr; ［**Instance Settings**］ &rarr; ［**プラットフォーム**］ &rarr; ［**User Authentication**］ の順にクリックします。
1. ［**How do users authenticate?**］ セレクタでオプションを選択します。

    ![3種類の認証から選択できます。](./authentication-basics/images/03.png)

### プロパティを使用して認証の種類を設定する

[ポータルプロパティ](https://learn.liferay.com/dxp/latest/ja/installation-and-upgrades/reference/portal-properties.html) ファイルを使用するには、以下のプロパティに貼り付け、目的の認証の種類のコメントを解除します。

```properties
company.security.auth.type=emailAddress
#company.security.auth.type=screenName
#company.security.auth.type=userId
```

## ログインウィジェットの使用と設定

［Sign In］ウィジェットは、ユーザーを認証するさまざまなメカニズム（ポータルデータベース、LDAPサーバー、SAML IDプロバイダー、またはユーザーが認証できる任意の方法）を呼び出します。 その動作は、いくつかの方法で設定およびカスタマイズできます。

### ゲストアカウント作成の無効化

ゲストユーザーが新しいユーザーアカウントを作成できないようにするには：

1. ［Control Panel］ &rarr; ［**Configuration**］ &rarr; ［**Instance Settings**］ &rarr; ［**プラットフォーム**］ &rarr; ［**User Authentication**］ に移動します。
1. ［**Allow strangers to create accounts?**］ をオフにします。
1. ［**Save**］ をクリックします。

    ![このボックスがオフの場合、ゲストはアカウントを作成できません。](./authentication-basics/images/04.png)

### パスワードリセットの防止

ユーザーが自分のパスワードをリセットできないようにする必要がある場合は、同じ画面から設定できます。

1. ［Control Panel］ &rarr; ［**Configuration**］ &rarr; ［**Instance Settings**］ &rarr; ［**プラットフォーム**］ &rarr; ［**User Authentication**］ に移動します。
1. ［**Allow users to request password reset links?**］ をオフにします。
1. ［**Save**］ をクリックします。

### CAPTCHAまたはreCAPTCHAの構成

CAPTCHAまたはreCAPTCHAを有効にして、ボットによるアカウントの作成およびログインを防止します。

1. ［Control Panel］ &rarr; ［**Configuration**］ &rarr; ［**System Settings**］ &rarr; ［**Security Tools**］ &rarr; ［**CAPTCHA**］ に移動します。

    ![キャプチャはデフォルトで有効になっています。](./authentication-basics/images/02.png)

    ```{note}
    デフォルトでは、［*Create Account CAPTCHA*］および［*Send Password CAPTCHA*］が有効になっています。 必要に応じて、［Message Boards CAPTCHA］を有効にします。
    ```

1. ［CAPTCHAエンジン］を選択します。 デフォルトでは、［Simple CAPTCHA］が有効になっています。 GoogleのreCAPTCHAを選択することもできます。そのためには、外部サービスを個別に設定する必要があります。 reCAPTCHAを選択した場合は、Googleからの公開鍵と秘密鍵を提供します。
1. その他のオプションを使用すると、開発者が Simple CAPTCHA エンジンをカスタマイズできます。
1. 完了したら、 ［**保存**］ をクリックします。

## 追加情報

* [Liferayの保護](../securing-liferay.md)
* [Webサービスの保護の概要](./securing-web-services.md)
* [パスワードポリシーの設定](../../users-and-permissions/roles-and-permissions/configuring-a-password-policy.md)
