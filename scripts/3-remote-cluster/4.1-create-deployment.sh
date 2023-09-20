#!/bin/bash
source ./scripts/0-utils/set-env.sh

kubectl apply -f ./k8s/deployment.yaml --kubeconfig ./kubeconfig.yaml