#!/bin/bash
set -e # Abort if there is an issue with any build.

# Usage:
# ./run-all.sh apply
# ./run-all.sh destroy

runningTerraformApply() {
  echo "Running $1 $2"
  
  ./tf.sh $1 $2 -auto-approve

  echo ""
}

runningTerraformApply $1 01-bare-minimum
runningTerraformApply $1 02-dhcp
runningTerraformApply $1 03-static-ip
runningTerraformApply $1 04-disks
runningTerraformApply $1 05-networks
runningTerraformApply $1 06-other
