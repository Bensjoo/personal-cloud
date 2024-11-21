#!/bin/bash

# Generate a random JWT secret if not already in 1Password
JWT_SECRET=$(op read "op://vandelay/appflowy/gotrue/jwt_secret")
PSQL_DB="gotrue"
PSQL_USER="gotrue_writer"
PSQL_PW=$(op read "op://vandelay/appflowy/gotrue/psql_pw")

# Create Kubernetes secret
kubectl create secret generic gotrue-config \
  --namespace=appflowy \
  --from-literal=jwt-secret="$JWT_SECRET" \
  --from-literal=database-url="postgres://${PSQL_USER}:${PSQL_PW}@postgres.postgres.svc.cluster.local:5432/${PSQL_DB}" \
  --dry-run=client -o yaml | kubectl apply -f -