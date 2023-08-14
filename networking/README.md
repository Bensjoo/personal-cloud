# Networking setup

Mostly I will be using cloudflare zero trust to expose anything to public

Internally i would like to have a loadbalancer so that i can reach some components like longhorn gui, airflow,.. ,from within network.

## Metal LB setup

```bash
helm repo add metallb https://metallb.github.io/metallb
helm upgrade --install metallb metallb/metallb --create-namespace \
    --namespace metallb-system --wait
```


metal LB needs some configuation resources as well. 
- lookup DHCP IP range for router and 
- make sure that you set an ip range which is not automatically assigned.


```bash
kubectl apply -f metworking/metallb-cr.yaml
```