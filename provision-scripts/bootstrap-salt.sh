#!/usr/bin/env bash
hostname salt

wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list

apt-get update
apt-get install python salt-master salt-minion salt-ssh  -y

cp /vagrant/provision-scripts/deploy-file/master /etc/salt/master
cp /vagrant/provision-scripts/deploy-file/roster /etc/salt/roster
cp /vagrant/provision-scripts/deploy-file/id_rsa.salt /root/.ssh/id_rsa.salt
chmod 0700 /root/.ssh/id_rsa.salt
service salt-master restart

cat "/vagrant/provision-scripts/deploy-file/hosts" >> /etc/hosts
