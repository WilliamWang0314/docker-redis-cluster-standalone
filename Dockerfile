#TEST_OFF
#
FROM centos:7

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY install.sh /
RUN /bin/sh install.sh

COPY add_redis_cluster_passwd.sh /

COPY mem.sh /export/scripts/
RUN  chmod 755 /export/scripts/mem.sh

ADD ruby2.6.2.tar.gz /usr/local/
ADD redis_bin.tar.gz /usr/local/bin/
ADD nosql.tar.gz /data/

EXPOSE 7001 7002 7003 7004 7005 7006  
VOLUME ["/data/nosql"]

CMD ["/export/scripts/mem.sh"]
