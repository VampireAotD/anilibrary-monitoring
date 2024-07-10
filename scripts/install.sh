#!/usr/bin/env bash

set -eu
set -o pipefail

function log {
  echo "[+] $1"
}

function set_compose_bin {
  if which docker-compose >/dev/null 2>&1; then
    echo docker-compose
    return 0
  fi

  if which docker compose >/dev/null 2>&1; then
    echo docker compose
    return 0
  fi

  echo "Couldn't find any version of docker compose"
  return 1
}

compose=$(set_compose_bin) || {
  err "$compose"
  exit 1
}

echo '⠿ Installing Anilibrary Monitoring'

if [ ! -f ./.env ]; then
  log 'Creating .env file with values from .env.example'
  cp ./.env.example ./.env
fi

log 'Resolving Alertmanager config'
chmod +x ./scripts/alertmanager/create_config.sh
./scripts/alertmanager/create_config.sh

log 'Building images and launching Monitoring'
$compose up -d --build

echo '⠿ Anilibrary Monitoring has been successfully installed!'
