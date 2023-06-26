#!/bin/bash

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

export http_proxy=http://192.168.102.82:1082
export https_proxy=http://192.168.102.82:1082

cd ~ && mkdir -p fisco && cd fisco
curl -#LO https://github.com/FISCO-BCOS/FISCO-BCOS/releases/download/v3.0.0-rc3/build_chain.sh && chmod u+x build_chain.sh
bash build_chain.sh -l 127.0.0.1:4 -p 30300,20200
bash nodes/127.0.0.1/start_all.sh

#sudo apt install -y default-jdk
cd ~/fisco && curl -LO https://github.com/FISCO-BCOS/console/releases/download/v3.0.0-rc3/download_console.sh && bash download_console.sh
cp -n console/conf/config-example.toml console/conf/config.toml
cp -r nodes/127.0.0.1/sdk/* console/conf
#cd ~/fisco/console && bash start.sh
