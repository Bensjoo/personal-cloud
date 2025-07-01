NS=scheduler
GIT_SECRET=$(op read op://vandelay/airflow_analytics_gitsync/private_key)
kubectl create secret generic gitsync \
    --from-literal="gitSshKey=$GIT_SECRET" \
    --namespace=$NS