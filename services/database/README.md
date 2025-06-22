# cluster-based Postgres setup

## Setup / install
Went for bitnami chart which had some sensible defaults. tried doing a simple deployment.yaml but there was some nuances to be considered with pg_hba needing to be writeable and have good md5 defaults, pvcs..
```bash
# 1. namespace
kubectl apply -f services/database/namespace.yaml

# 2. secret
bash services/database/create_secret.sh

# 3. install chart
bash services/database/install-upgrade.sh
```

## Verify / Managing dbs & users
to verify, we will connect using port-forwarding
make sure to have `psql` cli installed to connect

```bash
# 1. port-forward to the psql
kubectl port-forward svc/postgres-postgresql 5432:5432

# 2. run verification script, cleans up the db and the user after
bash services/database/verification/verify.sh --cleanup
```
## TODO:
- Specify requests / limits.. we are at a low default
- match postgres versions with mise