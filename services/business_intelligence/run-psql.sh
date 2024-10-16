# bitnami charts have sensible values
# 8Gi PVC size, don't need HA, can modify stuff after deploy
helm install --upgrade -n data --create-namespace postgresql oci://registry-1.docker.io/bitnamicharts/postgresql