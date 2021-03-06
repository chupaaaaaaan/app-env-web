#!/bin/sh

cd $(dirname $0)

echo '====== 秘密鍵の生成 ======'
echo '【秘密鍵のパスワードを入力してください】'
openssl genrsa -aes256 2048  > build/httpd/conf/server.key

echo
echo '====== 証明書発行要求の生成 ======'
echo '【作成した秘密鍵のパスワードを入力してください】'
echo '【それ以外の項目はデフォルト値（Enterキーを押すのみ）でOKです】'
openssl req -new -key build/httpd/conf/server.key > build/httpd/conf/server.csr

echo
echo '====== 自己署名証明書の生成 ======'
echo '【作成した秘密鍵のパスワードを入力してください】'
openssl x509 -days 3650 -in build/httpd/conf/server.csr -req -signkey build/httpd/conf/server.key > build/httpd/conf/server.crt

echo
echo '====== パスワード無し秘密鍵の生成 ======'
echo '【作成した秘密鍵のパスワードを入力してください】'
openssl rsa -in build/httpd/conf/server.key > build/httpd/conf/server-nopass.key
