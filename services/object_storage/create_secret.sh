#!/bin/bash

# Fetch values from 1Password CLI
MINIO_ROOT_USER=$(op read op://vandelay/minio/username)
MINIO_ROOT_PASSWORD=$(op read op://vandelay/minio/password)
echo "root user:" $MINIO_ROOT_USER

# Create a Kubernetes Secret
kubectl create secret generic minio-creds \
  --namespace="minio" \
  --from-literal=root-user="$MINIO_ROOT_USER" \
  --from-literal=root-password="$MINIO_ROOT_PASSWORD" \
  --dry-run=client -o yaml | kubectl apply -f -