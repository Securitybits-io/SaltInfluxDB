Vagrant.configure("2") do |config|
  config.vm.define "salt" do |salt|
    salt.vm.box = "ubuntu/cosmic64"
    salt.vm.hostname = "salt"
    salt.vm.network "private_network", ip: "192.168.6.10"
    salt.vm.synced_folder "saltstack/", "/srv"
    salt.vm.provision :shell, path: "provision-scripts/bootstrap-salt.sh"
  end
  config.vm.define "influxdb" do |influxdb|
    influxdb.vm.box = "ubuntu/cosmic64"
    influxdb.vm.hostname = "influxdb"
    influxdb.vm.network "private_network", ip: "192.168.6.11"
    influxdb.vm.provision :shell, path: "provision-scripts/bootstrap-influxdb.sh"
  end
  config.vm.define "telegraf" do |telegraf|
    telegraf.vm.box = "ubuntu/cosmic64"
    telegraf.vm.hostname = "telegraf"
    telegraf.vm.network "private_network", ip: "192.168.6.12"
    telegraf.vm.provision :shell, path: "provision-scripts/bootstrap-telegraf.sh"
  end
  config.vm.define "grafana" do |grafana|
    grafana.vm.box = "ubuntu/cosmic64"
    grafana.vm.hostname = "grafana"
    grafana.vm.network "private_network", ip: "192.168.6.13"
    grafana.vm.provision :shell, path: "provision-scripts/bootstrap-grafana.sh"
  end
end
