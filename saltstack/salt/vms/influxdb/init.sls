#InfluxDB init
include:
  - packages.influxdb

##Server Specific config
### TODO: Change me
/etc/influxdb/influxdb.conf:
  file.managed:
    - source: salt://vms/influxdb/deploy_files/influxdb.conf
    - user: root
    - group: root
    - mode: 644

influxdb:
  service.running:
    - enable: True
    - require:
      - pkg: install_influxdb
    - watch:
      - file: /etc/influxdb/influxdb.conf
