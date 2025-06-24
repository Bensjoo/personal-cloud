NS=scheduler
WEBSERVER_SECRET=$(op read op://vandelay/airflow/webserver)
kubectl create secret generic webserver-key \
    --from-literal="webserver-secret-key=$WEBSERVER_SECRET" \
    --namespace=$NS