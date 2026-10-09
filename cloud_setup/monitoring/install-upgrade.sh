CHART_VERSION=92.2.0

helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
    --namespace monitoring \
    --create-namespace \
    --version $CHART_VERSION \
    --values cloud_setup/monitoring/values.yaml
