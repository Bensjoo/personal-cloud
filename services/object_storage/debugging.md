running a pod to check that things work given a setup:

```bash
kubectl run aws-cli-debug -n minio --rm -it \
  --image=python:3.9-slim \
  --env="AWS_ACCESS_KEY_ID=$(op read op://vandelay/minio/appflowy/access_key)" \
  --env="AWS_SECRET_ACCESS_KEY=$(op read op://vandelay/minio/appflowy/secret_key)" \
  --env="AWS_EC2_METADATA_DISABLED=true" \
  -- bash
```

Once inside:
```bash
pip install awscli
aws s3 ls s3://vandelay-appflowy --endpoint-url http://minio.minio.svc.cluster.local:9000
```