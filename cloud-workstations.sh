#!/usr/bin/env bash
source $HOME/.config/cloud-workstation/cw.prod.bash

cw-start() {
  # Save current gcloud configuration
  current_gcloud_config=$(gcloud config configurations list --filter="IS_ACTIVE=true" --format="value(name)")
  # Activate the "prod" configuration
  gcloud config configurations activate "prod"

  gcloud workstations start-tcp-tunnel "$name" "$port" \
    --start-workstation \
    --cluster="$cluster" \
    --config=$cluster_config --region="$region" \
    --local-host-port="$local_port" \
    --project="$project_id"
  # Restore the previous gcloud configuration
  gcloud config configurations activate "$current_gcloud_config"
}

cw-stop() {
  # Save current gcloud configuration
  current_gcloud_config=$(gcloud config configurations list --filter="IS_ACTIVE=true" --format="value(name)")
  # Activate the "prod" configuration
  gcloud config configurations activate "prod"
  
  gcloud workstations stop "$name" \
    --cluster="$cluster" \
    --config="$cluster_config" \
    --region="$region" \
    --project="$project_id"

  # Restore the previous gcloud configuration
  gcloud config configurations activate "$current_gcloud_config"
}
