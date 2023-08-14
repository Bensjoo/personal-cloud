# Cluster Monitoring Experiment

The standard way to go for k8s is using nodexporter, prometheus, then using something like Grafana to make dashboards. There are some nice off-the-shelf dashboards for monitoring kubernetes workloads, but not sure I care too much about those type of metrics yet

## Monitoring wishlist
- temperatures! I want to see that my temps are okay. mainly CPU but if i can, disks as well
- cpu, memory, disk utilization


further down the line:
- CPU and memory requests / limits
- claims to disks
- which pods on which nodes
- backup statistics for 


## Lightweight hardware monitor setup
To do monitoring the following is needed:
1. microservice running on each node scraping metrics
2. Push metrics to a database
3. neat metrics dashboard exposed and accessible for me from any place

I want to try out a timeseries database. As of writing, I have not yet sorted out longhorn for persistent storage/replication, and [Influx](https://www.influxdata.com/) offers a free tier.

Project Repository:
https://github.com/Bensjoo/pi-cluster-monitor
