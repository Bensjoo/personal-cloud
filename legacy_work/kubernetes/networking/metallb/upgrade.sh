# Deploy MetalLB using helm
helm upgrade --install metallb metallb/metallb \
  --namespace metallb-system \
  --create-namespace

# edit template conf
kubectl apply -f kubernetes/networking/metallb/metallb-config.yaml