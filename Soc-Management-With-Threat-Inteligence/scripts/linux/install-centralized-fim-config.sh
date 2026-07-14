#!/usr/bin/env bash
set -euo pipefail

GROUP_NAME="windows-soc"
SHARED_DIR="/var/ossec/etc/shared/${GROUP_NAME}"
TMP_CONF="${SHARED_DIR}/agent.conf.tmp"
ACTIVE_CONF="${SHARED_DIR}/agent.conf"

if [[ ! -d "${SHARED_DIR}" ]]; then
  echo "[ERROR] ${SHARED_DIR} does not exist."
  echo "Create the '${GROUP_NAME}' agent group first."
  exit 1
fi

sudo tee "${TMP_CONF}" >/dev/null <<'EOF'
<agent_config os="Windows">
  <syscheck>
    <disabled>no</disabled>
    <directories check_all="yes"
                 report_changes="yes"
                 realtime="yes">C:\SOC-Lab\Monitored</directories>
  </syscheck>
</agent_config>
EOF

sudo chown wazuh:wazuh "${TMP_CONF}"
sudo chmod 660 "${TMP_CONF}"

echo "Validating ${TMP_CONF}"
sudo /var/ossec/bin/verify-agent-conf -f "${TMP_CONF}"

echo "Activating the validated configuration"
sudo mv "${TMP_CONF}" "${ACTIVE_CONF}"
sudo chown wazuh:wazuh "${ACTIVE_CONF}"
sudo chmod 660 "${ACTIVE_CONF}"

sudo systemctl restart wazuh-manager

echo "Centralized FIM configuration installed at ${ACTIVE_CONF}."
