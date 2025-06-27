# Data scheduling using Apache Airflow

## Setup
following the production guide around the apache airflow helm chart
### setup namespace
```bash
kubectl create ns scheduler
```

### Set up db including secret
we will need a psql database, a dedicated user that can write to said db.

```bash
# Be sure to port-forward your psql if needed
bash services/scheduler/backend/setup_db.sh

# set up secret
bash services/scheduler/backend/create-db-secret.sh

# setup fernet key that encrypts the db
bash services/scheduler/backend/create-fernet-secret.sh
```


#### pgbouncer note
With airflow 3.0, the only microservice in the deployment that talks to db is api-server!

since I wont be running my setup with multiple api-servers ill skip pgbouncer

### analytics / dag repo syncs
TBD

### 

### Set up / manage connections


## Notes while setting up

### stated airflow support on chart docs
1.17 should say supports airflow 3.0+

### Change password of admin user
How to do it?

### add new user
getting errors, screenshot + log snippet in errors folder