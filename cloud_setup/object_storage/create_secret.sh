#!/bin/bash

MINIO_NAMESPACE="minio"
MINIO_ROOT_USER=$(op read op://vandelay/minio/username)
MINIO_ROOT_PASSWORD=$(op read op://vandelay/minio/password)

MINIO_STORAGE_CLASS_STANDARD="EC:2"
MINIO_BROWSER="on"

if [ -z "$MINIO_ROOT_USER" ] || [ -z "$MINIO_ROOT_PASSWORD" ]; then
  echo "Error: Could not retrieve MinIO credentials from 1Password. Ensure 'op' CLI is configured and item exists."
  exit 1
fi

echo "MinIO Root User fetched: ${MINIO_ROOT_USER}"

MINIO_CONFIG_ENV_CONTENT=$(cat <<EOF
export MINIO_ROOT_USER="${MINIO_ROOT_USER}"
export MINIO_ROOT_PASSWORD="${MINIO_ROOT_PASSWORD}"
export MINIO_STORAGE_CLASS_STANDARD="${MINIO_STORAGE_CLASS_STANDARD}"
export MINIO_BROWSER="${MINIO_BROWSER}"
export MINIO_BROWSER_REDIRECT_URL="https://minio.vandelay"
EOF
)

kubectl create secret generic storage-configuration \
  --namespace="${MINIO_NAMESPACE}" \
  --from-literal=config.env="${MINIO_CONFIG_ENV_CONTENT}" \
  --dry-run=client -o yaml | kubectl apply -f -

echo "Kubernetes Secret 'storage-configuration' created/updated in namespace '${MINIO_NAMESPACE}'."

unset MINIO_ROOT_PASSWORD
unset MINIO_CONFIG_ENV_CONTENT