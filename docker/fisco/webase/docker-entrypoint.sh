#!/bin/bash

/data/shell/changepwd.sh && rm -fr /data/shell/changepwd.sh
#For fisco
cd ~/fisco && bash nodes/127.0.0.1/start_all.sh
#For webase
su - mysql -c "/Developer/mysql-5.7.37/bin/mysqld_safe --defaults-file=/etc/my.cnf &"
sleep 3

export JAVA_HOME=/Developer/java/jdk-14
export PATH=$JAVA_HOME/bin:$PATH
cd /data/shell/webase-deploy
python3 deploy.py stopAll
python3 deploy.py startAll

# run the command given as arguments from CMD
exec "$@"
