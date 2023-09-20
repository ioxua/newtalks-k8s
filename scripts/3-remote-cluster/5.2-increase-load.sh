#!/bin/bash
source ./scripts/0-utils/set-env.sh

# kubectl delete pod load-generator --kubeconfig ./kubeconfig.yaml
kubectl run -i --tty load-generator --rm \
    --image=busybox:1.28 --restart=Never \
    --kubeconfig ./kubeconfig.yaml \
    -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://demo-app-service?name=load; done"

# while sleep 0.01; do wget -q -O- http://4.228.36.26:8080; done
# kubectl get hpa php-apache --watch --kubeconfig ./kubeconfig.yaml