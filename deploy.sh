#!/bin/bash
# Create instance template
gcloud compute instance-templates create auto-scaling-template-vcc \
  --machine-type=e2-medium \
  --image-family=ubuntu-2004-lts \
  --image-project=ubuntu-os-cloud \
  --tags=http-server

# Create MIG with auto-scaling
gcloud compute instance-groups managed create auto-scaling-group-vcc \
  --template=auto-scaling-template-vcc \
  --size=1 \
  --zone=asia-south2-a \
  --target-cpu-utilization=0.6 \
  --min-num-replicas=1 \
  --max-num-replicas=5