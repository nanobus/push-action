#!/bin/bash -l

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

#change directory to the containing directory of bus file
bus_dir=$(dirname "$bus_path")
cd "$bus_dir"

CANDLE_HOSTNAME=$(grep -Eo 'registry: (.*)' "$(basename "$bus_path")" | cut -d ' ' -f2)
export CANDLE_HOSTNAME

nanobus push "$(basename "$bus_path")" | grep -Eo '^Pushing (.*)$' | cut -d ' ' -f2