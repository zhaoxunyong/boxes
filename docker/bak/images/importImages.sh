#!/bin/bash

for tar in `ls /vagrant/images/hyperledger`
do
  docker load -i /vagrant/images/hyperledger/$tar
done
