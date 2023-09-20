#!/bin/bash
source ./scripts/0-utils/set-env.sh

kubectl get hpa demo-deployment --watch --kubeconfig ./kubeconfig.yaml