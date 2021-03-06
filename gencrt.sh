#!/bin/sh

cd $(dirname $0)

# 秘密鍵の作成
echo '====== Generate private key ======'
openssl genrsa -aes256 2048  > build/httpd/conf/server.key

# 証明書発行要求の作成
echo
echo '====== Generate certificate signing request ======'
openssl req -new -key build/httpd/conf/server.key > build/httpd/conf/server.csr

# 自己署名証明書の作成
echo
echo '====== Generate self-signed certificate ======'
openssl x509 -days 3650 -in build/httpd/conf/server.csr -req -signkey build/httpd/conf/server.key > build/httpd/conf/server.crt

# パスワード無し秘密鍵の作成
echo
echo '====== Generate password-unset private key ======'
openssl rsa -in build/httpd/conf/server.key > build/httpd/conf/server-nopass.key
