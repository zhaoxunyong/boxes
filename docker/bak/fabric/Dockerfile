#Version: 1.0.0

FROM dave/ubuntu:20.04

ENV WORK_SHELL /data/shell
WORKDIR $WORK_SHELL

#ADD ./sources.list /etc/apt/sources.list
#RUN apt update && apt install -y init

RUN mkdir -p /Developer/java/
ADD jdk-8u202-linux-x64.tar.gz /Developer/java/

ADD changepwd.sh $WORK_SHELL/

ADD ./docker.sh $WORK_SHELL/
ADD ./nodejs.sh $WORK_SHELL/
ADD ./java.sh $WORK_SHELL/

ADD docker-entrypoint.sh /data/startup/

RUN chmod +x $WORK_SHELL/*.sh

RUN $WORK_SHELL/docker.sh
RUN $WORK_SHELL/nodejs.sh
RUN $WORK_SHELL/java.sh

ENTRYPOINT ["/data/startup/docker-entrypoint.sh"]
#CMD ["bash", "-c" ,"$WORK_SHELL/init.sh"]



