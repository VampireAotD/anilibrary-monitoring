#!/bin/bash

set -eu

alertmanager_folder='alertmanager'
config_template="$alertmanager_folder/alertmanager.template.yml"
config_path="$alertmanager_folder/alertmanager.yml"

set -o allexport
source .env
set +o allexport

envsubst < "$config_template" > "$config_path"