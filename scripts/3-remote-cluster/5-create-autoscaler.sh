#!/bin/bash
source ./scripts/0-utils/set-env.sh

# see https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

kubectl autoscale deployment demo-deployment --cpu-percent=50 --min=1 --max=10 --kubeconfig ./kubeconfig.yaml