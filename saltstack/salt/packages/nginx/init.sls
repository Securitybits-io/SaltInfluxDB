nginx:
  pkg.installed: []
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-available/*
      - file: /etc/nginx/sites-enabled/*
    - require:
      - pkg: nginx
