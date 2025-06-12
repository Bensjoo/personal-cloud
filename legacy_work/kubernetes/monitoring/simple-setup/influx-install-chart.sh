helm repo add influxdata https://helm.influxdata.com/
helm upgrade --install influx-db -n monitoring -f influx-chart.values.yaml influxdata/influxdb2