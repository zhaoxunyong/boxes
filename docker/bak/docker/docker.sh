#!/bin/bash

apt-get -y install apt-transport-https ca-certificates software-properties-common
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-compose

mkdir -p /etc/docker/
tee /etc/docker/daemon.json <<-'EOF'
{
  "dns" : [
     "8.8.4.4",
     "8.8.8.8",
     "114.114.114.114"
  ],
  "registry-mirrors": [
    "https://registry.docker-cn.com",
    "https://3laho3y3.mirror.aliyuncs.com",
    "http://hub-mirror.c.163.com"
  ]
}
EOF

#mkdir -p /etc/systemd/system/docker.service.d
#tee /etc/systemd/system/docker.service.d/http-proxy.conf <<-'EOF'
#[Service]
#Environment="HTTP_PROXY=http://192.168.102.82:1082"
#Environment="HTTPS_PROXY=http://192.168.102.82:1082"
#Environment="NO_PROXY=127.0.0.1,localhost,10.0.0.0/8,172.0.0.0/8,192.168.0.0/16,*.zerofinance.net,*.aliyun.com,*.163.com,*.docker-cn.com,kubernetes.docker.internal"
#EOF

#echo "export PATH=/data/fabric/go/bin:\$PATH" > /etc/profile.d/env.sh
#
#. /etc/profile
#
#echo "alias prettyjson=\"python3 -m json.tool\"
#function proxy_off(){
#    unset http_proxy
#    unset https_proxy
#    echo -e \"The proxy has been closed!\"
#}
#function proxy_on() {
#    export no_proxy=\"127.0.0.1,localhost,10.0.0.0/8,172.0.0.0/8,192.168.0.0/16,*.zerofinance.net,*.aliyun.com,*.163.com,*.docker-cn.com,registry.gcalls.cn\"
#    export http_proxy=\"http://192.168.102.82:1082\"
#    export https_proxy=\$http_proxy
#    echo -e \"The proxy has been opened!\"
#}" >> ~/.bashrc 
#
#. ~/.bashrc

#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
#. ~/.bashrc
#nvm install v12.22.6
