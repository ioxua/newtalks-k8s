#!/bin/bash
source ./scripts/0-utils/set-env.sh

# see https://kubernetes.io/docs/concepts/configuration/secret/
kubectl create secret generic demo-secrets --from-literal=my-secret-key='a very secret string' --kubeconfig ./kubeconfig.yaml