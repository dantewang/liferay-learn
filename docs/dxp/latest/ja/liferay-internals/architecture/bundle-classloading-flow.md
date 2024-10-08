# バンドル・クラスローディング・フロー

OSGiコンテナーは、インポートされたクラスをいくつかの場所で検索します。 それがどこを、どのような順序で検査するかを知ることが重要です。 OSGiバンドルのLiferay DXPのクラスローディングフローは、OSGiコア仕様に従います。 これはわかりやすいですが、複雑でもあります。 次の図はフローを示しており、この記事ではそのフローについて説明します。

![図1：このフローチャートは、バンドル内のクラスローディングを示しています。](./bundle-classloading-flow/images/01.png)

以下は、バンドルでのクラスロードのアルゴリズムです。

1. クラスが `java.*` パッケージにある場合、読み込みを親クラスローダに委譲します。 そうでなければ、続けてください。

1. クラスがOSGiフレームワークのブートデリゲーションリストにある場合、ロードを親クラスローダーにデリゲートします。 そうでなければ、続けてください。

1. クラスがバンドルがワイヤードエクスポーターからインポートするパッケージのひとつである場合、エクスポートするバンドル側のクラスローダーがそれをロードします。 **wired exporter** は、以前にパッケージを読み込んだ別のバンドルのクラスローダーです。 クラスが見つからない場合は、続けてください。

1. クラスがバンドルの必須バンドルのいずれかによってインポートされている場合、必須バンドルのクラスローダーがそれをロードします。

1. クラスがバンドルのクラスパスにある場合 (マニフェストヘッダ `Bundle-ClassPath`)、バンドルのクラスローダはそれをロードします。 そうでなければ、続けてください。

1. クラスがバンドルのフラグメントクラスパスにある場合、バンドルのクラスローダーはそれをロードします。

1. クラスが `DynamicImport-Package` を使って動的にインポートされたパッケージ内にあり、エクスポートするバンドルとワイヤが確立されている場合、エクスポートするバンドルのクラスローダーがそれをロードします。 それ以外の場合、クラスは見つかりません。

　 これで、Liferay DXP がどのように OSGi バンドル用のクラスを見つけ、ロードするかがわかりました。