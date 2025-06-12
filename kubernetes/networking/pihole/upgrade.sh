# helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/
# helm repo update

helm upgrade --install pihole mojo2600/pihole \
  --namespace pihole \
  --create-namespace \
  --values kubernetes/networking/pihole/values.yaml \
  --set adminPassword="$(op read op://vandelay/pihole/password)" \
  --set DNS1=""$(op read op://vandelay/pihole/DNS1)""