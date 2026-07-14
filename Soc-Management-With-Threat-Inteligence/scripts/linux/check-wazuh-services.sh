#!/usr/bin/env bash
set -u

services=(wazuh-manager wazuh-indexer wazuh-dashboard)
failed=0

for service in "${services[@]}"; do
  echo "==> Checking ${service}"
  if sudo systemctl is-active --quiet "${service}"; then
    sudo systemctl status "${service}" --no-pager --lines=5
  else
    echo "[ERROR] ${service} is not active."
    sudo systemctl status "${service}" --no-pager --lines=10 || true
    failed=1
  fi
  echo
 done

echo "==> Registered Wazuh agents"
sudo /var/ossec/bin/agent_control -l

exit "${failed}"
