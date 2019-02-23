#Grafana init.sls
#InfluxDB init
include:
  - packages.grafana

##Server Specific config
### TODO: Change me
# /etc/influxdb/influxdb.conf:
#   file.managed:
#     - source: salt://vms/influxdb/deploy_files/influxdb.conf
#     - user: root
#     - group: root
#     - mode: 644

grafana:
  pkg.installed: []
  service.running:
    - require:
      - pkg: install_grafana
    # - watch:
    #   - file: /etc/influxdb/influxdb.conf
