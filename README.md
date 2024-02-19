
## Harbor

### create secret
```bash
# kubectl create secret docker-registry docker-abacus \
# --dry-run=client \
# --docker-server=docker.abacussw.co.kr \
# --docker-email=seongpil0948@iabacus.co.kr \
# --docker-username=robot\$sa-k8s \
# --docker-password=1hRGeZ2wdj6gvt6a60ECeuPW1edCX6NF \
# -o yaml  > /home/abacus/infra/apps/manifests/sec-docker-abacus.yaml

kubectl apply -f /home/abacus/infra/apps/manifests/sec-docker-abacus.yaml
```
###  namespace 추가시
애버커스 private registry를 사용하기 위해

```bash
NEW_NS=sample

kubectl patch serviceaccount default -p '{"imagePullSecrets": [{"name": "docker-abacus"}]}' -n $NEW_NS
```

## Traefik
dashboard
```bash
kubectl port-forward $(kubectl get pods --selector "app.kubernetes.io/name=traefik" -n dev --output=name) 9000:9000 -n dev
```
access to [http://localhost:9000/dashboard/#/http/routers](http://localhost:9000/dashboard/#/http/routers)

## Reference
- https://gateway-api.sigs.k8s.io/guides/simple-gateway/
- https://istio.io/latest/docs/setup/additional-setup/gateway/
- https://istio.io/latest/docs/setup/additional-setup/getting-started/

