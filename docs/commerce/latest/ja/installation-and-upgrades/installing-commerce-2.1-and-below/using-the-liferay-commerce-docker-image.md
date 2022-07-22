# Liferay Commerce Dockerイメージの使用

Liferay Commerceの最新バージョンは、Dockerイメージとして利用できます。 Liferay Commerceの最新のDockerイメージリリースをダウンロードして開始するには、次の手順に従ってください。

1. Liferay Commerceを入手します

    ```{tip}
    Dockerをお持ちではありませんか？ まずは[Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/) | [Windows](https://docs.docker.com/docker-for-windows/install/) | [OSX](https://docs.docker.com/docker-for-mac/install/)に移動してください。
    ```

    ```bash
    docker pull [$LIFERAY_LEARN_COMMERCE_DOCKER_IMAGE$]
    ```

1. Liferay Commerceを開始します

    ```bash
    docker run -it -p 8080:8080 [$LIFERAY_LEARN_COMMERCE_DOCKER_IMAGE$]
    ```

    ```{important}
    `org.apache.catalina.startup.Catalina.start サーバ起動時間 [x] milliseconds` が表示されるまで待ちます。
    ```

1. ブラウザで`https://localhost:8080`を開きます。

## 次のステップ

状況をチェックする以上のことをしますか？ [インストールの概要](../installation-overview.md)で詳細をご覧ください。

数分でストアを立ち上げて運営したいですか？ [Accelerators](../../starting-a-store/accelerators.md)を参照してください。
