essential-packages:
  pkg.installed:
    - pkgs:
      - bash
      - build-essential
      - git
      - curl
      - apache2-utils
      - python
      - python-pip
      - nano

christoffer:
  group:
    - present
  user.present:
    - name: christoffer
    - fullname: Christoffer Claesson
    - password: $6$passlame$G4pKZvCoV5AtT.ITjPNCvfHBFht7saSoNyfdoSO1p2EGn2nlq7Pb9c6b2ABUWf5yZ1G/icChljl1GWIDuXnDO0
    - shell: /bin/bash
    - home: /home/christoffer
    - groups:
      - christoffer
      - sudo
    - require:
      - group:
          christoffer
  ssh_auth.present:
    - user: christoffer
    - require:
      - user: christoffer
    - names:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIHtbFSj3BigWMw1QNBtJFZU5rzRsHWrgQgz01npvshQGf2gRhCoFD+LDouknuS8v/0rYHk714aOMocBeuG3k8w56SMAOKdfiAT5y0hThoPBcv4iSGZA6xaACFCbxqnsXy5ZAV7IDmud6uoF642B4ok3v4tP/sseYlxl/rup5TvSsRX4Ne4EtmGIGEjs/gTIkVEP1Q9GSpSuI/fnnHKRrShXmyVQeMW5rv7iw/ghXCBf2LOKn7GoYSbMHvnzhdIy4zKQPqd3VkCoThZ6QzEUBhjM+o5bwIBrpK1EET7e18MMWQdzqjcyGUuhPY1bUjIsnnRxhCAAf5TwOzJZe+Q+gV root@salt
