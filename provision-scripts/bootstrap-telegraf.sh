#!/usr/bin/env bash
hostname telegraf
mkdir /etc/salt
echo 'telegraf' > /etc/salt/minion_id

wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" | sudo tee /etc/apt/sources.list.d/saltstack.list

apt-get update
apt-get install -y salt-minion

cat "/vagrant/provision-scripts/deploy-file/hosts" >> /etc/hosts
systemctl restart salt-minion
