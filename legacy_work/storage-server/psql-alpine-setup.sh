# Install PostgreSQL
apk add postgresql

# Initialize database
mkdir -p /var/lib/postgresql/data
chown postgres:postgres /var/lib/postgresql/data

# Switch to postgres user and init DB
su - postgres -c "initdb -D /var/lib/postgresql/data"

# Start PostgreSQL
rc-service postgresql start
rc-update add postgresql default

# Connect to PostgreSQL
psql -U postgres