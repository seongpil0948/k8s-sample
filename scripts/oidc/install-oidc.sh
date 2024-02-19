kubectl delete namespace oidc
kubectl create namespace oidc
# helm install keycloak bitnami/keycloak --version=18.2.1  --namespace oidc --values /home/abacus/infra/values-keycloak.yaml
helm upgrade keycloak bitnami/keycloak \
  --install  \
  --version=18.2.1  \
  --namespace oidc  \
  --values /home/admin/k8s-sample/values-dev.yaml
# ** Please be patient while the chart is being deployed **

# Keycloak can be accessed through the following DNS name from within your cluster:

#     keycloak.oidc.svc.cluster.local (port 80)

# To access Keycloak from outside the cluster execute the following commands:

# 1. Get the Keycloak URL by running these commands:

#   NOTE: It may take a few minutes for the LoadBalancer IP to be available.
#         You can watch its status by running 'kubectl get --namespace oidc svc -w keycloak'

#     export HTTP_SERVICE_PORT=$(kubectl get --namespace oidc -o jsonpath="{.spec.ports[?(@.name=='http')].port}" services keycloak)
#     export HTTPS_SERVICE_PORT=$(kubectl get --namespace oidc -o jsonpath="{.spec.ports[?(@.name=='https')].port}" services keycloak)
#     export SERVICE_IP=$(kubectl get svc --namespace oidc keycloak -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

#     echo "http://${SERVICE_IP}:${HTTP_SERVICE_PORT}/"
#     echo "https://${SERVICE_IP}:${HTTPS_SERVICE_PORT}/"

# 2. Access Keycloak using the obtained URL.
# 3. Access the Administration Console using the following credentials:

#   echo Username: admin
#   echo Password: $(kubectl get secret --namespace oidc keycloak -o jsonpath="{.data.admin-password}" | base64 -d)