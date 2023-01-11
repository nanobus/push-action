#!/bin/sh -l

set -e

bus_path="$1"
registry_username="$2"
registry_password="$3"

export OCI_REGISTRIES='CANDLE'
export CANDLE_USERNAME="$registry_username"
export CANDLE_PASSWORD="$registry_password"

cd /github/workspace

if [ ! -f "$bus_path" ]; then
  echo "Error: bus file not found at $bus_path"
  exit 1
fi

CANDLE_HOSTNAME=$(grep -Eo 'registry: (.*)' "$bus_path" | cut -d ' ' -f2)
export CANDLE_HOSTNAME

/usr/local/bin/nanobus push "$bus_path"