#!/bin/bash

# Fetch values from 1Password CLI
POSTGRES_DB="noco"
NOCODB_USER="noco_writer"
NOCODB_PASSWORD=$(op read op://vandelay/psql/noco/writer_password)
NAMESPACE="noco"
echo "NocoDB user:" $NOCODB_USER

# Create a Kubernetes Secret
kubectl create secret generic nocodb-secret \
  --namespace=$NAMESPACE \
  --from-literal=NC_DB="pg://postgres.postgres.svc.cluster.local:5432?u=$NOCODB_USER&p=$NOCODB_PASSWORD&d=$POSTGRES_DB" \
  # --from-literal=NC_DB="pg://$NOCODB_USER:$NOCODB_PASSWORD@postgres.postgres.svc.cluster.local:5432/$POSTGRES_DB" \
  --dry-run=client -o yaml | kubectl apply -f -
