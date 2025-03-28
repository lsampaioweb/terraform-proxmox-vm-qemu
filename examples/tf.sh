#!/bin/bash
set -e

# Usage: ./tf.sh apply 01-bare-minimum -auto-approve

COMMAND=$1
ENV_NAME=$2
EXTRA_FLAGS=$3

if [[ -z "$COMMAND" || -z "$ENV_NAME" ]]; then
  echo "Usage: $0 <plan|apply|destroy> <env-name> [-auto-approve]"
  exit 1
fi

# Desired backend configuration.
BACKEND_CONTENT=$(cat <<EOF
terraform {
  backend "local" {
    path = "$ENV_NAME/terraform.tfstate"
  }
}
EOF
)

# Check and update backend.tf only if needed.
if [[ ! -f backend.tf ]] || [[ "$BACKEND_CONTENT" != "$(cat backend.tf)" ]]; then
  echo "$BACKEND_CONTENT" > backend.tf
  echo "[INFO] Backend configuration changed. Running terraform init..."

  terraform init -reconfigure
fi

# Format project recursively.
terraform fmt -recursive ../.

# Execute Terraform command.
terraform "$COMMAND" $EXTRA_FLAGS -var-file="$ENV_NAME/vars.tfvars"
