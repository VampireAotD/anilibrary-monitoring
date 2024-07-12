#!/usr/bin/env sh

set -eu

# Alertmanager and Prometheus cannot read values from env, so need to replace placeholders in yml with values from .env
env | while IFS='=' read -r key value; do
  escaped_value=$(echo "$value" | sed 's/[\/&]/\\&/g')

  echo "$key"
  echo "$value"

  sed -i "s/\${${key}}/${escaped_value}/g" /etc/alertmanager/alertmanager.yml
done

exec /bin/alertmanager "$@"
