#!/bin/bash
# with dry-run
# --install \

DRY_RUN_TARGET=$1
# set default value is client
# else if DRY_RUN_TARGET is whether not client or server then set to client
if [ -z "$DRY_RUN_TARGET" ] || [ "$DRY_RUN_TARGET" != "client" ] && [ "$DRY_RUN_TARGET" != "server" ]; then
  DRY_RUN_TARGET="client"
fi

echo "DRY_RUN_TARGET: $DRY_RUN_TARGET"

helm install \
  --namespace=test  \
  --create-namespace \
  --dry-run=$DRY_RUN_TARGET \
  --debug \
  -f /home/abacus/sample/values-dev.yaml \
  sample \
  /home/abacus/sample 