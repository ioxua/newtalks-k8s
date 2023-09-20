#!/bin/bash
source ./scripts/0-utils/set-env.sh

kubectl apply -f ./infra/deployment.yaml --kubeconfig ./kubeconfig.yaml