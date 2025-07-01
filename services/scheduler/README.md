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

### Custom image
for purposes of supporting ETL tools like pola.rs, need custom image. for now uploading to docker hub: `bengan/airflow`
### analytics / dag repo syncs
TBD


### Set up / manage connections
TBD, could add an external secrets backend. 

For now will store them encrypted through GUI
#### Minio connection
setup a connection of type `aws`, add access & secret key for SA created in minio

in extra fields json, also make sure to add: `{"endpoint_url": "http://minio.minio.svc.cluster.local"}`

#### Verify minio bucket connection
can shell into worker and run python inline:

```python
from airflow.providers.amazon.aws.hooks.s3 import S3Hook
from io import StringIO
s3_hook = S3Hook(aws_conn_id='data-ingest-bucket')
# Create file content
content = "hello"

# Upload the file using the S3Hook
try:
    s3_hook.load_string(
        string_data=content,
        key="test.txt",
        bucket_name="data-ingest"
    )
    print("File 'test.txt' uploaded successfully to 'data-ingest' bucket!")
except Exception as e:
    print(f"Error uploading file: {e}")
```
## Notes while setting up


### Change password of admin user
How to do it?

### add new user
getting errors, screenshot + log snippet in errors folder