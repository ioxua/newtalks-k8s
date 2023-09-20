#!/bin/bash
# Cria um cluster k8s usando minikube
#minikube start --driver=podman # caso use podman
minikube start

# Retorna a URL do dashboard do minikube
minikube dashboard --url
