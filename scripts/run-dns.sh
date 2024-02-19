# NS=dev

# kubectl run alpine --image alpine:latest  -n $NS  --command -- sleep 1d

# kubectl -n dev exec -ti alpine -- nslookup kubernetes.default
# kubectl -n $NS exec -ti alpine -- /bin/bash
# # kubectl -n dev exec -ti busybox -- nslookup svc.cluster.local

kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml 
kubectl -n default exec -i -t dnsutils -- nslookup kubernetes.default  10.96.0.10
kubectl -n default exec -ti dnsutils -- cat /etc/resolv.conf


## Refer
# https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/
# https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/
# https://kubernetes.io/docs/tasks/administer-cluster/dns-custom-nameservers/