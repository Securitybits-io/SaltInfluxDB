#packages.telegraf init.sls
add_telegraf_repo:
  pkgrepo.managed:
    - humanname: Telegraf Repo
    - name: deb https://repos.influxdata.com/ubuntu bionic stable
    - dist: bionic
    - file: /etc/apt/sources.list.d/telegraf.list
    - key_url: https://repos.influxdata.com/influxdb.key

install_telegraf:
  pkg.installed:
    - name: telegraf
    - require:
      - pkgrepo: add_telegraf_repo
