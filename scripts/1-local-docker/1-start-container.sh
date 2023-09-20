#!/bin/bash

# almost the same command as docker run
# -d = detached mode, para que n entremos no container
# -t = adiciona um tty para podermos executar comandos posteriormente
# -p 8080:8080 mapeamento de porta, no formato interno:externo/protocolo
# <image-tag>
docker run -dt -p 8080:8080/tcp --name=k8s-demo i-k8s-demo-img:latest
#podman run -dt -p 8080:8080/tcp localhost/i-k8s-demo-img:latest