#!/bin/bash
set -e  # Abort if there is an issue with any command.

# Usage:
# ./run-all.sh apply
# ./run-all.sh destroy

ACTION=$1

if [[ -z "$ACTION" ]]; then
  echo "Usage: $0 <apply|destroy>"
  exit 1
fi

ENVIRONMENTS=(
  01-bare-minimum
  02-dhcp
  03-static-ip
  04-disks
  05-networks
  06-other
)

runTerraform() {
  local action=$1
  local env=$2

  echo "====================================="
  echo " Running: $action on $env"
  echo "====================================="

  ./tf.sh "$action" "$env" -auto-approve

  echo ""
}

for env in "${ENVIRONMENTS[@]}"; do
  runTerraform "$ACTION" "$env"
done
