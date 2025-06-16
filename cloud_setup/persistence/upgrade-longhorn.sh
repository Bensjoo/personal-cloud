CHART_VERSION=1.9.0

helm upgrade --install longhorn longhorn/longhorn \
    --namespace longhorn-system \
    --create-namespace \
    --version $CHART_VERSION
