NS=scheduler
WEBSERVER_SECRET=$(op read op://vandelay/airflow/webserver)
kubectl create secret generic api-key \
    --from-literal="api-secret-key=$WEBSERVER_SECRET" \
    --namespace=$NS