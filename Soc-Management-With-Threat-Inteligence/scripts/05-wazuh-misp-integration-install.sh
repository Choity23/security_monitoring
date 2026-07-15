#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt install -y git

WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT

git clone https://github.com/MISP/wazuh-integration.git "$WORKDIR/wazuh-integration"
cd "$WORKDIR/wazuh-integration"

sudo cp scripts/custom-misp_file_hashes.py /var/ossec/integrations/
sudo cp rules/misp_file_hashes.xml /var/ossec/etc/rules/

sudo chown root:wazuh /var/ossec/integrations/custom-misp_file_hashes.py
sudo chmod 750 /var/ossec/integrations/custom-misp_file_hashes.py
sudo chown root:wazuh /var/ossec/etc/rules/misp_file_hashes.xml
sudo chmod 640 /var/ossec/etc/rules/misp_file_hashes.xml

cat <<'MESSAGE'
Integration files were installed.

Next steps:
1. Back up /var/ossec/etc/ossec.conf.
2. Add the integration block from configs/ossec-misp-integration.xml.example.
3. Replace the placeholder with a restricted MISP API key.
4. Validate and restart Wazuh using scripts/06-verify-wazuh-misp.sh.
MESSAGE
