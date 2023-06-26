#!/bin/bash


su - mysql -c "/Developer/mysql-5.7.37/bin/mysqld_safe --defaults-file=/etc/my.cnf &"
sleep 3

mysql -uwebase -pAa123#@! -h127.0.0.1 -e " \
drop database if exists webasenodemanager; \
drop database if exists webasesign; \
"

sudo apt-get install -y python3 python3-pip
sudo pip3 install PyMySQL
cd /data/shell/
wget https://osp-1257653870.cos.ap-guangzhou.myqcloud.com/WeBASE/releases/download/lab-rc2/webase-deploy.zip
unzip webase-deploy.zip
cd webase-deploy

sed -i 's;mysql.ip=localhost;mysql.ip=127.0.0.1;g' common.properties
sed -i 's;sign.mysql.ip=localhost;mysql.ip=127.0.0.1;g' common.properties
sed -i 's;dbUsername;webase;g' common.properties
sed -i 's;dbPassword;Aa123#@!;g' common.properties
sed -i 's;if.exist.fisco=.*;if.exist.fisco=yes;g' common.properties
sed -i 's;/data/app/;/root/fisco/;g' common.properties

export JAVA_HOME=/Developer/java/jdk-14
export PATH=$JAVA_HOME/bin:$PATH

cd ~/fisco && bash nodes/127.0.0.1/start_all.sh
cd /data/shell/webase-deploy
python3 deploy.py installAll
#curl http://localhost:5000
