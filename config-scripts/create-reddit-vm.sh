#!/bin/bash
yc compute instance create \
  --name reddit-app-1 \
  --hostname reddit-app-1 \
  --memory=4 \
  --create-boot-disk image-id=fd8vboigu68vhsucc0vl \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata-from-file user-data=/Users/koreni/DevOps/OTUS/l004/koreni2000_infra/config-scripts/cloud-init-create-reddit.yml
