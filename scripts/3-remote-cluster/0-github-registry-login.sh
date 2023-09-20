#!/bin/bash
source ./scripts/0-utils/set-env.sh

# https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
echo $GH_CR_PAT | docker login ghcr.io -u $GH_USERNAME --password-stdin