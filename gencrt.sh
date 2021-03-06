#!/bin/sh

cd $(dirname $0)/build/httpd/conf/

echo '====== 秘密鍵の生成 ======'
echo '【秘密鍵のパスワードを入力してください】'
openssl genrsa -aes256 2048  > server.key

echo
echo '====== 証明書発行要求の生成 ======'
echo '【作成した秘密鍵のパスワードを入力してください】'
echo '【それ以外の項目はデフォルト値（Enterキーを押すのみ）でOKです】'
openssl req -new -key server.key > server.csr

echo
echo '====== 自己署名証明書の生成 ======'
echo '【作成した秘密鍵のパスワードを入力してください】'
openssl x509 -days 3650 -in server.csr -req -signkey server.key > server.crt

echo
echo '====== パスワード無し秘密鍵の生成 ======'
echo '【作成した秘密鍵のパスワードを入力してください】'
openssl rsa -in server.key > server-nopass.key

rm -f server.key server.csr
mv server-nopass.key server.key
