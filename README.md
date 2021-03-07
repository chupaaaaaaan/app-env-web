# app-env-web

## 概要

Nablarch ウェブアプリケーションを、Apache Httpd - WildFly - PostgreSQL の構成で動作確認するための環境を用意します。

Nablarchのブランクプロジェクトを[初期セットアップ手順](https://nablarch.github.io/docs/LATEST/doc/application_framework/application_framework/blank_project/setup_blankProject/setup_Web.html)にしたがって修正し、`prod` プロファイルでビルドしたアプリケーションにて稼働確認済みです。


## 環境のセットアップ方法

### Docker Desktopをインストールする。

* https://www.docker.com/products/docker-desktop
* プロキシ環境で実行している場合は、プロキシ設定も忘れずに


### このリポジトリをダウンロードする。

```
git clone https://github.com/chupaaaaaaan/app-env-web.git
cd app-web-env
```

### サーバ証明書を作成する。

```
./gencrt.sh
```

### ディレクトリを作成する。

```
./gendir.sh
```

### コンテナを実行する。

```
docker-compose up -d
```

### コンテナを止めたいとき

```
docker-compose down
```

## 使い方

### アプリケーションをデプロイする。

以下のURLにアクセスし、WildFlyの管理コンソールからデプロイしてください。

http://localhost:9990/console/index.html

アプリケーションのコンテキストパスとして `/Local` を仮定しているため、デプロイ時にはデプロイ名を `Local.war` としてください。

（コンテキストパスを変更する場合は、 `build/httpd/conf/httpd.conf` の `ProxyPass` 設定を変更してください）


### アプリケーションにアクセスする。

ブランクプロジェクトの場合は、以下のURLにアクセスしてください。

https://localhost/Local/


## セッションストアにRedisを使用する場合

環境にはRedisも含めているため、これをセッションストアとして使用することも可能です（注意：RedisStoreは5u17以降でサポートされています）。
その場合は、[Redisストア(Lettuce)アダプタの設定手順](https://nablarch.github.io/docs/LATEST/doc/application_framework/adaptors/lettuce_adaptor/redisstore_lettuce_adaptor.html)
に従ってプロジェクトを修正してください。

その際、設定値は以下を指定してください。
```
# デフォルトのセッションストア名
nablarch.sessionManager.defaultStoreName=redis

# Redis構成の選択
nablarch.lettuce.clientType=simple

# Redis接続先
nablarch.lettuce.simple.uri=redis://redis:6379
```
