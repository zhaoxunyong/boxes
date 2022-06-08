#!/bin/bash

for image in `docker images|grep hyperledger|awk '{print $1":"$2}'`
do
  tarname=${image#*/}.tar
  docker save -o /vagrant/images/hyperledger/$tarname $image
done
