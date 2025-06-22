POSTGRES_USER="postgres"
ADMIN_PASSWORD=$(op read op://vandelay/psql/postgres/password)
USER_PASSWORD=$(op read op://vandelay/psql/db_verify/password)
HOST="localhost"
PORT="5432"

# --- Argument Parsing ---
PERFORM_CLEANUP=false
if [[ "$1" == "--cleanup" ]]; then
    PERFORM_CLEANUP=true
    echo "Cleanup mode enabled."
fi

# Create verify db and user 
PGPASSWORD=$ADMIN_PASSWORD psql -h $HOST -p $PORT -U $POSTGRES_USER -d "postgres" -c "CREATE DATABASE db_verify;"
PGPASSWORD=$ADMIN_PASSWORD psql -h $HOST -p $PORT -U $POSTGRES_USER -d "postgres" -c "CREATE USER db_verify_writer WITH PASSWORD '${USER_PASSWORD}';"
PGPASSWORD=$ADMIN_PASSWORD psql -h $HOST -p $PORT -U $POSTGRES_USER -d "postgres" -c "GRANT ALL PRIVILEGES ON DATABASE db_verify TO db_verify_writer;"
PGPASSWORD=$ADMIN_PASSWORD psql -h $HOST -p $PORT -U $POSTGRES_USER -d "db_verify" -c "GRANT CREATE ON SCHEMA public TO db_verify_writer;"
# run verification SQL
PGPASSWORD=$USER_PASSWORD psql  -h $HOST -p $PORT -U "db_verify_writer" -d "db_verify" -f services/database/verification/verification.sql

PGPASSWORD=$USER_PASSWORD psql  -h $HOST -p $PORT -U "db_verify_writer" -d "db_verify" -c "SELECT * FROM kpi_data;"

# cleanup
# --- Cleanup ---
if [ "$PERFORM_CLEANUP" = true ]; then
    echo "Performing cleanup..."
    PGPASSWORD=$ADMIN_PASSWORD psql -h $HOST -p $PORT -U $POSTGRES_USER -d "postgres" -c "DROP DATABASE db_verify;"
    PGPASSWORD=$ADMIN_PASSWORD psql -h $HOST -p $PORT -U $POSTGRES_USER -d "postgres" -c "DROP USER db_verify_writer;"
else
    echo "Skipping cleanup. To perform cleanup, run this script with the --cleanup flag."
fi