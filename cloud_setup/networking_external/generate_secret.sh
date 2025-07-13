#!/bin/bash

# Fetch values from 1Password CLI
TOKEN=$(op read op://vandelay/cloudflare/password)
NAMESPACE="cloudflare"


# Create a Kubernetes Secret
kubectl create secret generic tunnel-secret \
  --namespace=$NAMESPACE \
  --from-literal=CLOUDFLARE_TOKEN="$TOKEN" \
  --dry-run=client -o yaml | kubectl apply -f -
