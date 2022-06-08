#Version: 1.0.0

FROM dave/ubuntu:20.04

ENV WORK_SHELL /data/shell
WORKDIR $WORK_SHELL

#ADD ./sources.list /etc/apt/sources.list
#RUN apt update && apt install -y init

COPY mysql-5.7.37/mysql-5.7.37-linux-glibc2.12-x86_64.tar.gz $WORK_SHELL/
ADD mysql-5.7.37/mysql.sh $WORK_SHELL/


RUN mkdir -p /Developer/java/
ADD jdk-8u202-linux-x64.tar.gz /Developer/java/

ADD changepwd.sh $WORK_SHELL/

ADD ./java.sh $WORK_SHELL/

ADD docker-entrypoint.sh /data/startup/

RUN chmod +x $WORK_SHELL/*.sh
RUN chmod +x /data/startup/*.sh

RUN bash $WORK_SHELL/mysql.sh
RUN $WORK_SHELL/java.sh

ENTRYPOINT ["/data/startup/docker-entrypoint.sh"]
#CMD ["bash", "-c" ,"$WORK_SHELL/init.sh"]



