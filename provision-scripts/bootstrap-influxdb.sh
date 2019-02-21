#!/usr/bin/env bash
hostname influxdb
mkdir /etc/salt
echo 'influxdb' > /etc/salt/minion_id

#echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | sudo tee /etc/apt/sources.list.d/saltstack.list
#wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -
apt-get update
apt-get install -y salt-minion

cat "/vagrant/provision-scripts/deploy-file/hosts" >> /etc/hosts
systemctl enable salt-minion
systemctl restart salt-minion
