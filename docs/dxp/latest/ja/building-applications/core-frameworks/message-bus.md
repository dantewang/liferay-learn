---
toc:
- ./message-bus/listening-for-messages.md
- ./message-bus/using-asynchronous-messaging.md
- ./message-bus/using-default-synchronous-messaging-in-previous-versions.md
- ./message-bus/using-direct-synchronous-messaging-in-previous-versions.md
- ./message-bus/listening-for-registration-events.md
- ./message-bus/tuning-messaging-performance.md
---
# Message Busメッセージバス

```{toctree}
:maxdepth: 3

message-bus/listening-for-messages.md
message-bus/using-asynchronous-messaging.md
message-bus/using-default-synchronous-messaging-in-previous-versions.md
message-bus/using-direct-synchronous-messaging-in-previous-versions.md
message-bus/listening-for-registration-events.md
message-bus/tuning-messaging-performance.md
```

メッセージバスは、メッセージを交換するための疎結合された方法を提供します。 メッセージを送信するクラスはメッセージバスを呼び出してメッセージを宛先に送信し、その宛先に登録されている他のクラス（**リスナー**）がメッセージを受信します。 リスナーは送信者に対して透過的であり、その逆も同様です。

主なメッセージングコンポーネントは次のとおりです。

**宛先：** メッセージが送信される論理的（物理的ではない）な指名された場所。

**リスナー：** 特定の宛先に送信されたメッセージを **リッスンする** クラス。

**メッセージバス：** 宛先登録を処理し、リスナーにメッセージを送信するフレームワーク。

**メッセージ：** オプションの応答先を含む、ペイロードとメタデータを含むことができるオブジェクト。

**送信者：** メッセージバスを呼び出して宛先のリスナーにメッセージを送信する任意のクラス。

次の図は、コンポーネントの相互作用を示しています。

![メッセージングコンポーネントの相互作用の例](./message-bus/images/01.png)

相互作用シーケンスの例を次に示します。

1. 任意のクラスが登録された`Destination`に`Message`を送信します
1. メッセージバスは、`Message`を宛先の登録済み`MessageListener`にディスパッチします。

メッセージ送信者は、メッセージバスを使用してメッセージを宛先に送信することにのみ関係していて、メッセージの受信者には関係ありません。 メッセージリスナーは、宛先でのメッセージの受信にのみ関係していて、メッセージの送信者には関係ありません。

## 同期および非同期メッセージング

メッセージバスは、同期および非同期でメッセージを送信します。

```{important}
同期メッセージは削除され、Liferay DXP 7.4 U49/Liferay Portal 7.4 GA49 以降ではサポートされなくなりました。
```

**同期メッセージング：** メッセージの送信後に送信者がブロックします。 送信者の条件（送信者のタイプによって決定される）が満たされると、送信者はブロックを解除して処理を続行します。

**非同期メッセージング：** 送信者は、メッセージの送信後すぐに処理を続行します。

次のトピックでは、両方のメッセージング方法について説明します。

* [非同期メッセージングの使用](./message-bus/using-asynchronous-messaging.md) は、宛先を構成し、その宛先に非同期でメッセージを送信する方法を示しています。 これは、メッセージを送信する最も簡単な方法です。

* [以前のバージョンでのデフォルトの同期メッセージングの使用](./message-bus/using-default-synchronous-messaging-in-previous-versions.md) は、メッセージ送信者が、1人のリスナーがメッセージに応答するまでブロックする様子を示しています **または** 、リスナーが応答しない場合は、メッセージがタイムアウトするまでブロックする様子を示しています。

* [Using Direct Synchronous Messaging in Previous Versions](./message-bus/using-default-synchronous-messaging-in-previous-versions.md) は、メッセージ送信者が **すべての** リスナーがメッセージを受信するまでメッセージ送信をブロックしている様子を示しています。

## パフォーマンスの調整

メッセージバスAPIを使用すると、登録イベント、宛先、宛先メッセージリスナー、およびメッセージキューの監視が容易になります。 宛先タイプ、メッセージキューパラメータ、およびスレッドパラメータを調整することにより、ニーズに合わせてメッセージバスコンポーネントを設定できます。 詳細については、 [メッセージングパフォーマンスのチューニング](./message-bus/tuning-messaging-performance.md) を参照してください。

## 次のステップ

メッセージバスを初めて使用する場合は、Liferayに組み込まれている宛先上でリッスンすることをお勧めします。 次に [メッセージを聞く](./message-bus/listening-for-messages.md) を開始します。
