#!/usr/bin/env bash

set -eu
set -o pipefail

function log {
  echo "[+] $1"
}

function info {
  echo "⠿ $1"
}

function err {
  echo "[x] $1" >&2
}

info 'Installing Anilibrary Monitoring'

if [ ! -f ./.env ]; then
  err '.env file not found'
  exit 1
fi

log 'Building images and launching Monitoring (without alerts)'
make up

info 'Anilibrary Monitoring has been successfully installed!'
