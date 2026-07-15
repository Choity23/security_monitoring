#!/usr/bin/env bash
set -euo pipefail

sudo apt update
sudo apt upgrade -y
sudo apt install -y git curl ca-certificates openssh-server
sudo systemctl enable --now ssh

sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker

cd "$HOME"
if [[ ! -d misp-docker ]]; then
  git clone https://github.com/MISP/misp-docker.git
fi
cd misp-docker

if [[ ! -f .env ]]; then
  cp template.env .env
fi

cat <<'MESSAGE'
MISP Docker files are ready.

Next steps:
1. Edit ~/misp-docker/.env.
2. Set ADMIN_EMAIL, ADMIN_ORG, ADMIN_PASSWORD, BASE_URL, and TZ.
3. Run:
   cd ~/misp-docker
   sudo docker compose pull
   sudo docker compose up -d
   sudo docker compose ps

Do not commit the real .env file.
MESSAGE
