#!/bin/bash
#minikube addons enable registry
docker run --rm -it --network=host alpine ash -c "apk add socat && socat TCP-LISTEN:50929,reuseaddr,fork TCP:$(minikube ip):50929"
