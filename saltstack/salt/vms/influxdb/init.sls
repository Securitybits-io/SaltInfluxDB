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

influx-db-test:
  influxdb_database.present:
    - name: example
    - host: localhost
    - port: 8086

# influxdb:
#   server:
#     database:
#       mydb1:
#         enabled: true
#         name: mydb1
