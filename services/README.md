# Services / OSS software on cluster
**To be revisited with US relaunch**

## Database - postgres
I would much rather have an external NAS to handle more reliable & persistent storage. but seeing as I spent my allowance, I'll run postgres on the k8s cluster for now, leveraging longhorn for a volume

## Exalidraw - mindmapping & notes service
excalidraw is cool for writing diagrams! I want to run this on my cluster

Excalidraw seems to support running on docker locally
https://docs.excalidraw.com/docs/introduction/development#self-hosting

seems like its limited functionality & documentation

## OLD STUFF
### TODO: Apache Airflow workflow scheduler setup
*To be updated 2024*
Running [Airflow](https://airflow.apache.org/) using NFS hosted on `art` as persistent storage for DAGs/Logs, and postgres on `bubbleboy` for airflow state management.

### TODO: Running BI using Apache Superset
This one is on my wishlist - It seems lately the containers are mostly ARM-compatible so best time ever to take a stab at it!

### Running public web app based on Flask/bootstrap 
*TODO: not running on 2024 deployment - also separate self-written from OSS stuff* 

Wrote an app to track statistics for a friend playing a game. Hosted on `vandelay-k8s` and publicly accessed through **Cloudflare Zero-trust** without opening any ports on my end.

### cluster monitoring
*TODO: write about monitor microservice using influx / takes temp cpu memory*

adding basic CPU/GPU statistics is nice, but also want to know more hardware related stuff like power usage, temperatures

### interesting others:
- 