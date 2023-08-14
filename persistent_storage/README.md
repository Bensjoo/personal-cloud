# persistent storage using Longhorn
quite easy to set up. there are no special considerations in my case since i have one disk per cluster right now.

use ansible or run on each node to get requirement

```bash
sudo apt update && sudo apt install open-iscsi
```

install longhorn using helm:

```bash
helm repo add longhorn https://charts.longhorn.io
helm repo update
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace
```


add 