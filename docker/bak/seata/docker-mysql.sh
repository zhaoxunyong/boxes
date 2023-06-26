#!/bin/bash

docker run -d -p 3306:3306 --restart=always --name mysql \
-e MYSQL_ROOT_PASSWORD=Aa123#@! \
-e MYSQL_DATABASE=nacos-server \
-e MYSQL_USER=server \
-e MYSQL_PASSWORD=Aa123456 \
mysql:5.7.22
