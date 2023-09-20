#!/bin/bash
source ./scripts/0-utils/set-env.sh

echo $GH_CR_PAT | docker login ghcr.io -u $GH_USERNAME --password-stdin