# テストの実行

1. `poshi-ext.properties` ファイルを `poshi-standalone` ディレクトリで開き、以下の行を追加します。TestCaseFileName#TestCaseNameは、[テストケースファイルの作成](./creating-a-testcase-file.md)で作成したものに置き換えてください。 提供されたテストケースとテスト名に従えば、 `LiferayLearnSearch#CannotSearchForMyName`となるはずです。

    ```
    test.name=LiferayLearnSearch#CannotSearchForMyName
    ```
1. `poshi-standalone` ディレクトリでターミナルを開き、 `./gradlew validatePoshi` (`gradlew.bat validatePoshi` on Windows) を実行する。 これにより、構文のエラー、無効な関数、その他のエラーをチェックするposhi検証を実行します。 エラーがなければ、バリデーションは正常に実行されます。 エラーが発生した場合は、 [デバッグテスト](./understanding-test-results-and-debugging-tests.md)を参照してください。

1. コマンド `./gradlew runPoshi` を実行してテストを実行する。 ブラウザがポップアップし、ユーザーの入力なしに自動的にテストが実行されるはずです。

1. 完了すると、結果は`poshi-standalone/test-results/LiferayLearnSearch#CannotSearchForMyName` ディレクトリで表示できます。 テスト結果の詳細については、 [テスト結果について](./understanding-test-results-and-debugging-tests.md)を参照してください。
