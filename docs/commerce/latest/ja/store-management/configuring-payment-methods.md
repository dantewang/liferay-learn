---
toc:
- ./configuring-payment-methods/managing-payment-methods.md
- ./configuring-payment-methods/authorize-net.md
- ./configuring-payment-methods/mercanet.md
- ./configuring-payment-methods/money-orders.md
- ./configuring-payment-methods/paypal.md
---
# 支払方法の設定

```{toctree}
:maxdepth: 1

configuring-payment-methods/managing-payment-methods.md
configuring-payment-methods/authorize-net.md
configuring-payment-methods/mercanet.md
configuring-payment-methods/money-orders.md
configuring-payment-methods/paypal.md
```

支払は、支払方法を介して処理されます。 支払方法には3つのタイプがあります。

**オフライン**：Liferay Commerceは支払いを処理しません。

**オンライン標準**：支払いはLiferay Commerceによって完全に処理されます。 このオプションはそのままでは使用できませんが、支払方法拡張ポイントを使用してカスタマイズできます。

**オンラインリダイレクト**：Liferay Commerceは、サードパーティの支払い処理業者に情報を渡し、購入者を処理業者のWebサイトにリダイレクトして支払いを完了します。

Liferay Commerceには4つの支払方法が付属しています。 郵便為替はオフラインの方法です。 Authorize.net、Mercanet、およびPayPalは、購入者をサードパーティのWebサイトにリダイレクトします。 支払方法拡張ポイントを使用して他の方法を追加できます。

デフォルトでは、Liferay Commerceは顧客の支払い情報を保存**しません**。 定期的な支払いやより迅速な精算を可能にする要件を備えたストアでは、サードパーティの支払い処理業者を使用して顧客の機密情報を管理することをお勧めします。 ストア管理者が顧客の支払い情報を保存する必要がある場合は、 [PCI DSS](https://www.pcisecuritystandards.org/) に準拠したプラクティスとポリシーを実装することを**強くお勧めします**。

```{raw} html
:file: ../landingpage_template.html
```

```{raw} html
:file: configuring-payment-methods/landing.html
```
