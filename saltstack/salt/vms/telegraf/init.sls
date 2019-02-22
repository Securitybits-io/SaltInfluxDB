#Telegraf init.sls
include:
  - packages.telegraf
  - packages.ipmitool

##Server Specific config
### TODO: Change me
# /etc/telegraf/telegraf.conf:
#   file.managed:
#     - source: salt://vms/telegraf/deploy_files/telegraf.conf
#     - user: root
#     - group: root
#     - mode: 644
#
# telegraf:
#   pkg.installed: []
#   service.running:
#     - require:
#       - pkg: install_telegraf
#     - watch:
#       - file: /etc/telegraf/telegraf.conf
