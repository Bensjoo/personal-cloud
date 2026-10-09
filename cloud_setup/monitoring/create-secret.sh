#!/bin/bash

# Grafana admin login, from 1Password
GRAFANA_USER="admin"
GRAFANA_PASSWORD=$(op read op://vandelay/grafana/password)

kubectl create namespace monitoring --dry-run=client -o yaml | kubectl apply -f -

kubectl create secret generic grafana-admin \
  --namespace="monitoring" \
  --from-literal=admin-user="$GRAFANA_USER" \
  --from-literal=admin-password="$GRAFANA_PASSWORD" \
  --dry-run=client -o yaml | kubectl apply -f -
