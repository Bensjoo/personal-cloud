SCRIPT_PATH="kubernetes/monitoring/kube-prometheus-stack"
kubectl apply -f ${SCRIPT_PATH}/pi-temp-conf.yaml
helm upgrade \
    --namespace monitoring \
    --create-namespace \
    --install monitoring prometheus-community/kube-prometheus-stack \
    -f ${SCRIPT_PATH}/values.yaml