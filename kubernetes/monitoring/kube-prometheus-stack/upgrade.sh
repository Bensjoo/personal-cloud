helm upgrade \
    --namespace monitoring \
    --create-namespace \
    --install monitoring prometheus-community/kube-prometheus-stack \
    -f kubernetes/monitoring/kube-prometheus-stack/values.yaml