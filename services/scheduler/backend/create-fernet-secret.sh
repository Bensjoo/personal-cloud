NS=scheduler
FERNET_KEY=$(op read op://vandelay/airflow/fernet_key)

kubectl create secret generic metadata-fernet-key \
    --from-literal=fernet-key=$FERNET_KEY \
    --namespace $NS