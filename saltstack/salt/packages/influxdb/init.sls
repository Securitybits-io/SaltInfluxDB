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

### TODO: Change me
/etc/influxdb/influxdb.conf:
  file.managed:
    - source: salt://packages/influxdb/deploy_files/influxdb.conf
    - user: root
    - group: root
    - mode: 644

influxdb:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: install_influxdb
    - watch:
      - file: /etc/influxdb/influxdb.conf
