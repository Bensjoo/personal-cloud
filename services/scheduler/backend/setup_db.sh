# Get admin creds for database
POSTGRES_USER="postgres"
ADMIN_PW=$(op read op://vandelay/psql/postgres/password)
SCHEDULER_DB="airflow"
SCHEDULER_USER="scheduler"
SCHEDULER_PW=$(op read op://vandelay/psql/scheduler/password)

HOST="localhost"
PORT="5432"


# Create verify db and user 
PGPASSWORD=$ADMIN_PW psql -h $HOST -p $PORT -U $POSTGRES_USER -d "postgres" -c "CREATE DATABASE ${SCHEDULER_DB};"
PGPASSWORD=$ADMIN_PW psql -h $HOST -p $PORT -U $POSTGRES_USER -d "postgres" -c "CREATE USER ${SCHEDULER_USER} WITH PASSWORD '${SCHEDULER_PW}';"
PGPASSWORD=$ADMIN_PW psql -h $HOST -p $PORT -U $POSTGRES_USER -d "postgres" -c "GRANT ALL PRIVILEGES ON DATABASE ${SCHEDULER_DB} TO ${SCHEDULER_USER};"
PGPASSWORD=$ADMIN_PW psql -h $HOST -p $PORT -U $POSTGRES_USER -d $SCHEDULER_DB -c "GRANT CREATE ON SCHEMA public TO ${SCHEDULER_USER};"
