#!/bin/bash

#mkdir -p /Developer/java/
#tar zxf /vagrant/jdk-8u202-linux-x64.tar.gz -C /Developer/java/

tee /etc/profile.d/java.sh <<-'EOF'
export JAVA_HOME=/Developer/java/jdk-14
export GRADLE_USER_HOME=/Developer/.gradle
export PATH=$JAVA_HOME/bin:$PATH
EOF

source /etc/profile

