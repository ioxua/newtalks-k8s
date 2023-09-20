#!/bin/bash
source ./scripts/0-utils/set-env.sh

IMAGE_VERSION=latest
docker image tag $IMAGE_NAME:$IMAGE_VERSION ghcr.io/$GH_USERNAME/$IMAGE_NAME:$IMAGE_VERSION
docker push ghcr.io/$GH_USERNAME/$IMAGE_NAME:$IMAGE_VERSION

#echo 'Você provavelmente terá de alterar a visibilidade do pacote'
#open https://github.com/users/$GH_USERNAME/packages/container/package/$IMAGE_NAME