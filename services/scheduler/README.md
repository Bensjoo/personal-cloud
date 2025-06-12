## Attempted apache airflow deployment

### backend
use postgresql in instance

### storing connections & variables
use standard postgresql as well? encrypted values

could potentially use aws or GCP secret manager

### DAGs
sync using gitSync is probable way to go

### 

### tradeoffs to minimize usage:
- kubernetesExecutor only?
- smaller image possible?
  - no aws, gcp, slack, elastic, google, snowflake, azure, hashicorp other bloat providers?
  - slim image should be good with addition of a few providers
  - fewer packages might make smaller image but no change in load. storage isnt really a big deal
- hard requests/limits
