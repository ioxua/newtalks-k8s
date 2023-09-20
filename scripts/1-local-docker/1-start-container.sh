#!/bin/bash
source ./scripts/0-utils/set-env.sh

# almost the same command as docker run
# -d = detached mode, para que n entremos no container
# -i = abre STDOUT no terminal atual
# -t = adiciona um tty para podermos executar comandos posteriormente
# -p 8080:8080 mapeamento de porta, no formato interno:externo/protocolo
# <image-tag>
docker run -it -p 8080:8080/tcp --platform=linux/amd64 $IMAGE_NAME:latest
#podman run -dt -p 8080:8080/tcp localhost/i-k8s-demo-img:latest