## Experiments
**To be revisited with US relaunch**


### Apache Airflow workflow scheduler setup
*To be written*
Running [Airflow](https://airflow.apache.org/) using NFS hosted on `art` as persistent storage for DAGs/Logs, and postgres on `bubbleboy` for airflow state management.

### Running BI using Apache Superset
*To be experimented, to be written*

This one is on my wishlist - It seems lately the containers are mostly ARM-compatible so best time ever to take a stab at it!

### Running public web app based on Flask/bootstrap 
*To be written*

Wrote an app to track statistics for a friend playing a game. Hosted on `vandelay-k8s` and publicly accessed through **Cloudflare Zero-trust** without opening any ports on my end.

### Setting up storage on cluster using Longhorn
*To be experimented, to be written*

my main goal is that persistent storage for my workloads on `vandelay-k8s` shou

### Setting up cluster monitoring
*To be concluded, to be written*

adding basic CPU/GPU statistics is nice, but also want to know more hardware related stuff like power usage, temperatures
