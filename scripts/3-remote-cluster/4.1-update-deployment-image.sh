#!/bin/bash
source ./scripts/0-utils/set-env.sh

kubectl delete deployment demo-deployment --kubeconfig ./kubeconfig.yaml
#kubectl rollout restart deployment/demo-deployment --kubeconfig ./kubeconfig.yaml
#kubectl get deployment --kubeconfig ./kubeconfig.yaml