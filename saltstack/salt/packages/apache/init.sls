apache2:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/apache2/ports.conf
      - file: /etc/apache2/apache2.conf
    - require:
      - pkg: apache2
