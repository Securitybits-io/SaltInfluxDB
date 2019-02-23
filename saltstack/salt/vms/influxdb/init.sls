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

influxdb_configuration_telegraf:
  influxdb_database.present:
    - name: telegraf
    - retry:
      - attempts: 3
      - interval: 5

influxdb_retention_policy_telegraf:
   influxdb_retention_policy.present:
    - name: telegraf_rp
    - database: telegraf
    - duration: 1d
    - replication: 1
    - require:
      - influxdb_configuration_telegraf

influxdb_configuration_ipmi:
  influxdb_database.present:
    - name: ipmi
    - retry:
      - attempts: 3
      - interval: 5

influxdb_retention_policy_ipmi:
   influxdb_retention_policy.present:
    - name: ipmi_rp
    - database: ipmi
    - duration: 1d
    - replication: 1
    - require:
      - influxdb_configuration_ipmi
