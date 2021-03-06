# Hanauta_Comm

URL: https://hanauta-comm.net/

本アプリはインフラにAWS、開発環境にDocker、CI/CDパイプラインにCircleCIを用いた<br>
現在主流となっている技術を用いた開発を学習するためにRubyonRailsで作成したアプリです。

アプリの内容としては曲名を思い出せない鼻歌を投稿して、詳しい人に教えてもらったり、<br>その曲について雑談しあえる掲示板を作成しました。

## 使用技術

前回作成したアプリはRailsで作成したものをHerokuにデプロイした物だったので<br>
現在より実務でより使用されている技術セットを学習したいという目的から、Railsで新しい機能を実装するというよりは<br>
Railsの基礎的な部分の復習をしつつ、インフラ周りの学習に比重を置いて実装を進めました。<br>
特筆する導入した技術としては前述の通り
* インフラにAWS
* 開発環境にDocker
* CI/CDパイプラインにCircleCI

を新たに導入しました。

AWSではVPC、EC2を用いてサーバーを構築し、SSH接続でデプロイした後に、最終的にはCapistranoを用いて自動でデプロイできるようにしました。

その他利用したAWSのサービスとしては、
* アプリ内のファイルを保存するストレージとしてS3
* アプリのURLを独自ドメインにするためにRoute53
* アプリ内のメール機能を実装するための送信サービスとしてAmazonSES
* HTTPS化のための証明書発行にACM、HTTPS化にロードバランサー

を用いました。

またかかる費用の点からデータベースにRDSは用いずに、 EC2内のMySQLを利用しました。

環境構築にはDockerとDockerComposeを用いて<br>
* WebサーバーにNginx
* アプリケーションサーバーにPuma
* データベースにMySQL

を用いる本番環境と同じ構成の開発環境を各々のPC環境に依存せずに構築できるようにしました。

またCircleCIを用いてCI/CDパイプラインを構築することで、GitHubにpushすればその都度コードを入力しなくても<br>
自動でビルドとテスト、またそれらがパスすればCapistoranoが実行されるようにすることで自動デプロイを実装しました。

そのほかの技術としては前述した物も含めて
* Ruby 2.6.5
* Rails 6.0.3
* データベースにMySQL5.7
* CSSフレームワークにBootstrap5
* アイコンを用いるためのFontawesome6
を利用しました。

## 機能

アプリ内の機能としては
* ユーザー登録機能
* ログイン機能
* ユーザー表示機能
* ユーザー一覧表示機能
* ユーザー情報更新機能
* 管理ユーザーのユーザー削除機能
* スレッド投稿機能
* 音声データ投稿機能
* 音声データ再生機能
* スレッド一覧表示機能
* スレッド詳細表示機能
* スレッド詳細内でのレス投稿機能
* スレッド詳細内でのレス表示機能
* ページネーション機能
* メールを用いたアカウント有効化機能
* メールを用いたパスワード変更機能
* 単体テスト機能
* 統合テスト機能

を実装しました。
