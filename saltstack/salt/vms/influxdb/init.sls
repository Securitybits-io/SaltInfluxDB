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
  pkg.installed: []
  service.running:
    - require:
      - pkg: install_influxdb
    - watch:
      - file: /etc/influxdb/influxdb.conf

influxdb_configuration:
  influxdb_database.present:
    - name: ipmi
    - retry:
      - attempts: 3
      - interval: 5

influxdb_retention_policy_ipmi:
   influxdb_retention_policy.present:
    - name: ipmi_rp
    - database: ipmi
    - duration: 93d
    - replication: 1
    - require:
      - influxdb_configuration
