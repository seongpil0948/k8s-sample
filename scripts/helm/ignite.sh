#!/bin/bash

# Function to perform helm upgrade
perform_helm_install() {
  local namespace=$1
  local values_file=$2

  # helm uninstall sample-$namespace -n $namespace
  # echo "values_file: $values_file"
  # helm install \
  #   --namespace=$namespace \
  #   --create-namespace \
  #   -f values-traefik.yaml -f values.yaml -f $values_file \
  #   sample-$namespace \
  #   ./
  #   # --set global.postgresql.auth.password=abacus10! \
  #   # --set auth.adminPassword=abacus10! \


  helm upgrade \
    --install \
    --namespace=$namespace \
    --create-namespace \
    -f values-traefik.yaml -f values.yaml -f $values_file \
    sample-$namespace \
    ./
}

# Check the argument and perform helm upgrade accordingly
if [[ $1 == "dev" ]]; then 
  perform_helm_install $1 values-dev.yaml
elif [[ $1 == "stg" ]]; then
  perform_helm_install $1 values-stg.yaml
elif [[ $1 == "prd" ]]; then
  perform_helm_install $1 values-prd.yaml
else
  echo "Invalid argument. Please provide either 'dev', 'stg', or 'prd'."
fi
