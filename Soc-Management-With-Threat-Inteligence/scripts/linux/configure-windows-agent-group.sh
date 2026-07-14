#!/usr/bin/env bash
set -euo pipefail

GROUP_NAME="windows-soc"
AGENT_ID="${1:-}"

if [[ -z "${AGENT_ID}" ]]; then
  echo "Usage: $0 <agent-id>"
  echo "Example: $0 001"
  exit 1
fi

if sudo /var/ossec/bin/agent_groups -l | grep -Fq "${GROUP_NAME}"; then
  echo "Group '${GROUP_NAME}' already exists."
else
  echo "Creating group '${GROUP_NAME}'. Confirm the prompt when asked."
  sudo /var/ossec/bin/agent_groups -a -g "${GROUP_NAME}"
fi

echo "Adding agent '${AGENT_ID}' to '${GROUP_NAME}'. Confirm the prompt when asked."
sudo /var/ossec/bin/agent_groups -a -i "${AGENT_ID}" -g "${GROUP_NAME}"

echo "Current group membership:"
sudo /var/ossec/bin/agent_groups -s -i "${AGENT_ID}"
