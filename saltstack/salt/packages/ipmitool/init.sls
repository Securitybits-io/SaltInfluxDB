#ipmitool init.sls
install_ipmitool:
  pkg.installed:
    - name: ipmitool
