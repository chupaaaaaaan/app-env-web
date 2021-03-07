#!/bin/sh

# ディレクトリを作成しなくてもcomposeは成功するが、
# パーミッションが root:root 755 となり、ファイル等を置けないので予め作成しておく。

mkdir -p data/wildfly/var/nablarch/format
mkdir -p data/wildfly/var/nablarch/output
mkdir -p data/wildfly/var/tmp/upload
