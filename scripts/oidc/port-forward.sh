#!/bin/bash
NS=dev

kubectl port-forward \
$(kubectl get pods --selector "app=keycloak" -n $NS --output=name) \
8080:8080 \
-n $NS
