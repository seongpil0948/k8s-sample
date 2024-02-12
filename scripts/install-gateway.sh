
# Must be installed istio before installing gateway-api
# from https://istio.io/latest/docs/setup/getting-started/
# helm repo add istio https://istio-release.storage.googleapis.com/charts
# helm repo update
# helm install istio-base istio/base  \
#   --namespace istio-system \
#   --set profile=demo \
#   --create-namespace \
#   --set defaultRevision=default
# helm install istiod istio/istiod -n istio-system --wait
# helm status istiod -n istio-system
# kubectl create namespace istio-ingress
# helm install istio-ingress istio/gateway \
#   --create-namespace \
#   --namespace istio-ingress 

kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.0.0/standard-install.yaml
