# helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/
# helm repo update

helm upgrade --install excternal-dns oci://registry-1.docker.io/bitnamicharts/external-dns \
  --namespace pihole \
  --create-namespace \
  --values kubernetes/networking/pihole/externaldns-values.yaml
  # --set adminPassword="$(op read op://vandelay/pihole/password)" \
 #  --set DNS1=""$(op read op://vandelay/pihole/DNS1)""