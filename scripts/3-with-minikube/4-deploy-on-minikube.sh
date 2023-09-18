#!/bin/bash
kubectl create deployment k8s-demo-deployment \
    --image=i-k8s-demo-img-mk:latest \
    #-- /agnhost netexec --http-port=8080