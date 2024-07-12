#!/usr/bin/env bash

set -eu
set -o pipefail

function log {
  echo "[+] $1"
}

echo '⠿ Installing Anilibrary Monitoring'

if [ ! -f ./.env ]; then
  log 'Creating .env file with values from .env.example'
  cp ./.env.example ./.env
fi

log 'Building images and launching Monitoring (without alerts)'
make up

echo '⠿ Anilibrary Monitoring has been successfully installed!'
