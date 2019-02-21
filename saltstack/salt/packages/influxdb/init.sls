#packages.influxdb init.sls
add_influx_repo:
  pkgrepo.managed:
    - humanname: InfluxDB Repo
    - name: deb https://repos.influxdata.com/ubuntu bionic stable
    - dist: bionic
    - file: /etc/apt/sources.list.d/influxdb.list
    - key_url: https://repos.influxdata.com/influxdb.key

install_influxdb:
  pkg.installed:
    - name: influxdb
    - require:
      - pkgrepo: add_influx_repo
