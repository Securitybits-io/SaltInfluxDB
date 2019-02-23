#Telegraf init.sls
include:
  - packages.telegraf
  - packages.ipmitool

##Server Specific config
### TODO: Change me
/etc/telegraf/telegraf.conf:
  file.managed:
    - source: salt://vms/telegraf/deploy_files/telegraf.conf
    - user: root
    - group: root
    - mode: 644

/etc/telegraf/telegraf.d:
  file.recurse:
    - source: salt://vms/telegraf/deploy_files/telegraf.d
    - user: root
    - group: root
    - file_mode: 644
    - dir_mode: 755
    - include_empty: true

telegraf:
  pkg.installed: []
  service.running:
    - restart: true
    - require:
      - pkg: install_telegraf
    - watch:
      - file: /etc/telegraf/*
      - pkg: telegraf
