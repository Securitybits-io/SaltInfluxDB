base:
  '*':
    - packages.bashrc
    - packages.requirements
    
  'influxdb':
    - vms.influxdb
  'telegraf':
    - vms.telegraf
  'grafana':
     - vms.grafana
