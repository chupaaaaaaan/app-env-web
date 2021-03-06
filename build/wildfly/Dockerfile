FROM jboss/wildfly:18.0.1.Final


# コンテナのロケール設定
USER root
RUN localedef -v -c -i ja_JP -f UTF-8 ja_JP.UTF-8; echo ""
ENV LANG=ja_JP.UTF-8
RUN rm -f /etc/localtime && ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
USER jboss


# 管理ユーザの追加
RUN /opt/jboss/wildfly/bin/add-user.sh admin P@ssw0rd --silent


# 外部モジュールの追加
COPY modules /tmp/modules/


# カスタムスクリプトの追加
COPY customization /opt/jboss/wildfly/customization


# 管理CLIの実行
RUN /opt/jboss/wildfly/customization/execute.sh


# 外部モジュールの削除（カスタムスクリプトでWildFlyに登録した後は、不要になるため）
USER root
RUN ["rm", "-rf", "/tmp/modules/"]
USER jboss


# wildflyの起動
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
