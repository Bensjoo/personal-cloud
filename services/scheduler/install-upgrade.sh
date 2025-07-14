
helm upgrade \
    --install airflow apache-airflow/airflow \
    --namespace scheduler \
    --values services/scheduler/values-v3.yaml \
    --version 1.18.0