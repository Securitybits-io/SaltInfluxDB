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
    - name: example
    - name: example2

set the influxdb retention policy on example:
   influxdb_retention_policy.present:
       - name: example
       - database: example
       - duration: 93d
       - replication: 1

set the influxdb retention policy on example2:
   influxdb_retention_policy.present:
       - name: example2
       - database: example2
       - duration: 93d
       - replication: 1
