#!/bin/bash

# Em caso de erro "Exiting due to RSRC_INSUFFICIENT_CORES: Requested cpu count 2 is greater than the available cpus of 1"
# Recrie a máquina podman com uma configuração customizada

#podman machine stop
#podman machine rm

podman machine init --cpus 64 --memory 12288 --disk-size 30
podman machine start
