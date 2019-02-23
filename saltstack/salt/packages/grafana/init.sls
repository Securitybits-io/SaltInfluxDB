#packages.grafana init.sls

add_grafana_repo:
  pkgrepo.managed:
    - humanname: Grafana Repo
    - name: deb https://packages.grafana.com/oss/deb stable main
    - file: /etc/apt/sources.list.d/grafana.list
    - key_url: https://packages.grafana.com/gpg.key

install_grafana:
  pkg.installed:
    - name: grafana
    - require:
      - pkgrepo: add_grafana_repo
