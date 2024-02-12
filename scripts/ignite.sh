#!/bin/bash
# with dry-run
helm upgrade \
  --install \
  --namespace=test  \
  --create-namespace \
  -f /home/abacus/sample/values-dev.yaml \
  sample \
  /home/abacus/sample 