#Grafana init.sls
include:
  - packages.grafana

##Server Specific config
### TODO: Change me
/etc/grafana/grafana.ini:
  file.managed:
    - source: salt://vms/grafana/deploy_files/grafana.ini
    - user: root
    - group: grafana
    - mode: 640
    - require:
      - pkg: install_grafana

/var/lib/grafana/grafana.db:
  file.managed:
    - source: salt://vms/grafana/deploy_files/grafana.db
    - user: grafana
    - group: grafana
    - mode: 640
    - require:
      - pkg: install_grafana

grafana-server:
  pkg.installed:
    - name: grafana
  service.running:
    - require:
      - pkg: install_grafana
    - watch:
      - file: /etc/grafana/grafana.ini
      - file: /var/lib/grafana/grafana.db
