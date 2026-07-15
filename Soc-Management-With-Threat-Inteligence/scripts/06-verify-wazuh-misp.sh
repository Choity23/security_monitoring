#!/usr/bin/env bash
set -euo pipefail

sudo /var/ossec/framework/python/bin/python3 -m py_compile \
  /var/ossec/integrations/custom-misp_file_hashes.py
sudo /var/ossec/bin/wazuh-analysisd -t
sudo systemctl restart wazuh-manager
sudo systemctl status wazuh-manager --no-pager
sudo grep -a -i "integrat" /var/ossec/logs/ossec.log | tail -30 || true

echo
printf '%s\n' "To review the latest integration result:" \
  "sudo tail -n 50 /var/ossec/logs/integrations.log"
