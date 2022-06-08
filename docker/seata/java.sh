#!/bin/bash

#mkdir -p /Developer/java/
#tar zxf /vagrant/jdk-8u202-linux-x64.tar.gz -C /Developer/java/

tee /etc/profile.d/java.sh <<-'EOF'
export JAVA_HOME=/Developer/java/jdk1.8.0_202
export GRADLE_USER_HOME=/Developer/.gradle
export PATH=$JAVA_HOME/bin:$PATH
EOF

source /etc/profile

echo "alias prettyjson=\"python3 -m json.tool\"
function proxy_off(){
    unset http_proxy
    unset https_proxy
    echo -e \"The proxy has been closed!\"
}
function proxy_on() {
    export no_proxy=\"127.0.0.1,localhost,10.0.0.0/8,172.0.0.0/8,192.168.0.0/16,*.zerofinance.net,*.aliyun.com,*.163.com,*.docker-cn.com,registry.gcalls.cn\"
    export http_proxy=\"http://192.168.102.82:1082\"
    export https_proxy=\$http_proxy
    echo -e \"The proxy has been opened!\"
}" >> ~/.bashrc 

. ~/.bashrc
