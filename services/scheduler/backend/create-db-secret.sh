NS=scheduler
SCHEDULER_DB="airflow"
SCHEDULER_USER="scheduler"
SCHEDULER_PW=$(op read op://vandelay/psql/scheduler/password)
PORT=5432
HOST=postgres-postgresql.postgres.svc.cluster.local
kubectl create secret generic metadata-db \
    --from-literal=connection=postgresql://$SCHEDULER_USER:$SCHEDULER_PW@$HOST:$PORT/airflow \
    --namespace $NS