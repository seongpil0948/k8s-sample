
# https://metallb.universe.tf/installation/
NS=metallb-system
kubectl apply --wait -n $NS -f https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml 
kubectl apply -f templates/_metallb-config.yaml -n $NS

# helm uninstall metallb --namespace metallb-system 
# helm repo add bitnami https://charts.bitnami.com/bitnami
# helm install metallb \
#   bitnami/metallb \
#   -n metallb-system \
#   --create-namespace \
#   --values /home/abacus/sample/values-mtb.yaml

# helm install -f $VALUES_PATH metallb bitnami/metallb  --namespace metallb-system 

# https://artifacthub.io/packages/helm/bitnami/metallb
# helm install metallb oci://registry-1.docker.io/bitnamicharts/metallb \
# kubectl delete crd ipaddresspools.metallb.io
# kubectl delete crd addresspools.metallb.io
# kubectl delete crd bfdprofiles.metallb.io
# kubectl delete crd bgpadvertisements.metallb.io
# kubectl delete crd bgppeers.metallb.io
# kubectl delete crd communities.metallb.io
# kubectl delete crd l2advertisements.metallb.io
# kubectl delete ValidatingWebhookConfiguration metallb-webhook-configuration
# kubectl delete IPAddressPool ip-pool -n  metallb-system
# kubectl delete L2Advertisement metallb-l2 -n  metallb-system
# helm install -f $VALUES_PATH metallb bitnami/metallb --version 4.7.15 --namespace metallb-system 

# kubectl apply -f /home/abacus/sample/templates/_metallb-config.yaml -n metallb-system