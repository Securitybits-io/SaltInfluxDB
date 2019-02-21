#!/usr/bin/env bash
hostname salt

#echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | sudo tee /etc/apt/sources.list.d/saltstack.list
#wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
apt-get update
apt-get install salt-master salt-minion salt-ssh  -y
cp /vagrant/provision-scripts/deploy-file/master /etc/salt/master
cp /vagrant/provision-scripts/deploy-file/roster /etc/salt/roster
cp /vagrant/provision-scripts/deploy-file/id_rsa.salt /root/.ssh/id_rsa.salt
chmod 0700 /root/.ssh/id_rsa.salt
service salt-master restart

cat "/vagrant/provision-scripts/deploy-file/hosts" >> /etc/hosts
