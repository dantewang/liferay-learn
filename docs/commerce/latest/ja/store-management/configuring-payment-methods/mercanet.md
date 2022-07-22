# Mercanet

この記事では、Mercanetを支払方法として有効にする方法について詳しく説明します。 Mercanetは**EURのみ**対応しているため、ストアの主要通貨がEURでなければなりません。

## Mercanetガイド

1. [前提条件を確認します。](#prerequisites)
1. [EURをストアの主要通貨として設定します。](#set-eur-as-the-primary-store-currency)
1. [支払方法としてMercanetを有効にします。](#activate-mercanet-as-a-payment-method)

## 前提条件

[Mercanet](https://documentation.mercanet.bnpparibas.net/index.php?title=Obtenir_sa_cl%C3%A9_secr%C3%A8te#)を使用するようにストアを設定する前に、以下を生成する必要があります。

1. MercanetのマーチャントID
1. シークレットキー
1. 鍵バージョン

## EURをストアの主要通貨として設定する

Mercanetを使用する場合、ストアではユーロを主要通貨として使用する必要があります。 主要通貨を変更するには：

1. _［コントロールパネル］ → ［コマース］ → ［設定］_に移動します。
1. _［通貨］_をクリックします。
1. ［ユーロ］の隣の_3ドットアイコン_をクリックします。
1. _［Set as Primary］_ をクリックします。

_ユーロ_が主要通貨として設定されました。

![主要通貨を設定](./mercanet/images/01.png)

## 支払方法としてMercanetを有効にする

1. _［サイト管理］ → ［コマース］ → ［設定］ → ［支払い方法］_に移動します。
1. _［支払い方法］_をクリックします。
1. _［Mercanet］_をクリックします。
1. _［設定］_をクリックします。
1. 次のように入力します：
    * _販売者ID_
    * _秘密鍵_
    * _鍵バージョン_
1. ライブサイトの場合は_［Production］_を、テスト環境の場合は_［Test］_または_［Simulation］_を選択します。 ![Mercanetの設定](./mercanet/images/02.png)
1. _［保存］_ をクリックします。
1. _［Mercanet］_の隣にある_3ドットアイコン_をクリックし、次に_［有効にする］_をクリックします。

Mercanetがストアで有効になりました。

## 追加情報

* [新しい通貨の追加](../currencies/adding-a-new-currency.md)
* [Authorize.Net](./authorize.net.md)
* [PayPal](./paypal.md)
