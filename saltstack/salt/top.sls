base:
  '*':
    - packages.bashrc
    - packages.requirements

   'grafana':
     - vms.grafana
  'influxdb':
    - vms.influxdb
  'telegraf':
    - vms.telegraf
