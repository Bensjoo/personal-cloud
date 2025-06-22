helm upgrade \
    --namespace postgres \
    --install postgres oci://registry-1.docker.io/bitnamicharts/postgresql \
    --values services/database/values.yaml