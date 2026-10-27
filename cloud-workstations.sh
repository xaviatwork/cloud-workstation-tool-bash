#!/usr/bin/env bash
name="workstation-xavi"
cluster_config="default-config"
cluster="gcpf-cw-cluster"
region="europe-west3"
local_port=8910
project_id="vwgitc-gcpf-workstation-p-0001"

cw-start() {
  current_gcloud_config=$(gcloud config configurations list --filter="IS_ACTIVE=true" --format="value(name)")
  gcloud config configurations activate "prod"

  gcloud workstations start-tcp-tunnel "$name" "$port" \
    --start-workstation \
    --cluster="$cluster" \
    --config=$cluster_config --region="$region" \
    --local-host-port="$local_port" \
    --project="$project_id"

  gcloud config configurations activate "$current_gcloud_config"
}

cw-stop() {
  current_gcloud_config=$(gcloud config configurations list --filter="IS_ACTIVE=true" --format="value(name)")
  gcloud config configurations activate "prod"
  
  gcloud workstations stop "$name" \
    --cluster="$cluster" \
    --config="$cluster_config" \
    --region="$region" \
    --project="$project_id"
  gcloud config configurations activate "$current_gcloud_config"
}
