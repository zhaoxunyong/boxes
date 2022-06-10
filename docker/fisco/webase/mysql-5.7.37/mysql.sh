#!/bin/bash

sudo apt-get install libaio1 libaio-dev -y
sudo apt-get install libnuma-dev -y
sudo apt-get install libncurses5 -y

cat > /etc/my.cnf << EOF
[mysqld]
bind-address=0.0.0.0
port=3306
socket=/Developer/mysql-5.7.37/data/mysql.sock
pid-file=/Developer/mysql-5.7.37/logs/mysql.pid
basedir=/Developer/mysql-5.7.37
datadir=/Developer/mysql-5.7.37/data
max_connections=20

character-set-server=utf8
collation-server=utf8_general_ci
lower_case_table_names=1
EOF

cat > /usr/lib/systemd/system/mysqld.service << EOF
[Unit]
Description=MySQL Server
After=syslog.target
After=network.target

[Service]
Type=simple
PermissionsStartOnly=true
#ExecStartPre=/bin/mkdir -p /var/run/mysqld
#ExecStartPre=/bin/chown mysql:mysql -R /var/run/mysqld
ExecStart=/Developer/mysql-5.7.37/bin/mysqld_safe --defaults-file=/etc/my.cnf
ExecStop=/Developer/mysql-5.7.37/bin/mysql.server stop
TimeoutSec=300
PrivateTmp=true
User=mysql
Group=mysql
WorkingDirectory=/Developer/mysql-5.7.37

[Install]
WantedBy=multi-user.target
EOF

tar zxf mysql-5.7.37-linux-glibc2.12-x86_64.tar.gz
mkdir -p /Developer/mysql-5.7.37/
cp -a mysql-5.7.37-linux-glibc2.12-x86_64/* /Developer/mysql-5.7.37/
rm -fr mysql-5.7.37-linux-glibc2.12-x86_64

cp -a /Developer/mysql-5.7.37/support-files/mysql.server /Developer/mysql-5.7.37/bin/mysql.server
sed -i "s;^basedir=.*;basedir=/Developer/mysql-5.7.37;g" /Developer/mysql-5.7.37/bin/mysql.server
sed -i "s;^datadir=.*;datadir=/Developer/mysql-5.7.37/data;g" /Developer/mysql-5.7.37/bin/mysql.server

groupadd mysql
useradd -r -g mysql mysql
sudo chown -R mysql:mysql /Developer/mysql-5.7.37
sudo mkdir -p /Developer/mysql-5.7.37/logs/
sudo chown -R mysql.mysql /Developer/mysql-5.7.37/logs/

sudo /Developer/mysql-5.7.37/bin/mysqld --initialize --user=mysql > ./log 2>&1
rootpwd=`cat ./log | grep "temporary password"|sed 's;^.*: ;;g'`
echo "root pwd is: $rootpwd"
#--basedir=/Developer/mysql-5.7.37 --datadir=/Developer/mysql-5.7.37/data

ln -s /Developer/mysql-5.7.37/bin/mysql /usr/bin/mysql

ln -s /Developer/mysql-5.7.37/data/mysql.sock /tmp/mysql.sock
#systemctl daemon-reload
#sudo systemctl enable mysqld

su - mysql -c "/Developer/mysql-5.7.37/bin/mysqld_safe --defaults-file=/etc/my.cnf &"
mkdir -p /var/run/mysqld/
ln -s /Developer/mysql-5.7.37/data/mysql.sock /var/run/mysqld/mysqld.sock
ln -s /Developer/mysql-5.7.37/bin/mysqladmin /usr/bin/mysqladmin
sleep 3

mysql -uroot -h127.0.0.1 -p$rootpwd --connect-expired-password -e "alter user user() identified by '';FLUSH PRIVILEGES;"
echo "The root password has been empty for localhost!"

echo "Starting granting some privileges..."
mysql -uroot -h127.0.0.1 -e " \
grant all privileges on *.* to root@'%' identified by 'Aa123#@!' WITH GRANT OPTION; \
grant all privileges on *.* to webase@'%' identified by 'Aa123#@!' WITH GRANT OPTION; \
FLUSH PRIVILEGES; \
"

mysqladmin  -uroot -S /var/run/mysqld/mysqld.sock shutdown

