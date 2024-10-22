#!/bin/bash

# Fetch values from 1Password CLI
POSTGRES_DB="postgres"
POSTGRES_USER=$(op read op://vandelay/psql/username)
POSTGRES_PASSWORD=$(op read op://vandelay/psql/password)
echo "user:" $POSTGRES_USER

# Create a Kubernetes Secret
kubectl create secret generic postgres-secret \
  --namespace="postgres" \
  --from-literal=POSTGRES_DB="$POSTGRES_DB" \
  --from-literal=POSTGRES_USER="$POSTGRES_USER" \
  --from-literal=POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  --dry-run=client -o yaml | kubectl apply -f -
