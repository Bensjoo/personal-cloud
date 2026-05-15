CHART_VERSION=1.11.2

helm upgrade --install longhorn longhorn/longhorn \
    --namespace longhorn-system \
    --create-namespace \
    --version $CHART_VERSION
