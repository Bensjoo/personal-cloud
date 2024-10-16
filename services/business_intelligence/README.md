# BI setup
Will be based on [Apache Superset](https://superset.apache.org/docs/installation/running-on-kubernetes).

## ARM problems
the official docker image doesnt seem to have ARM support, so will have to do things the hard way. Superset provides an "install from scratch" guide. Lets see if it will work on an ubuntu docker image.

```yaml
# ubuntu pod
apiVersion: v1
kind: Pod
metadata:
  name: ubuntu-test
spec:
  containers:
  - name: ubuntu-test
    image: ubuntu
    command: ["/bin/bash", "-c", "sleep 7200"]
```
