#!/bin/bash
source ./scripts/0-utils/set-env.sh

cd app

# Gradle: build jar file
./gradlew clean build

# If using podman
#podman build -t $IMAGE_NAME .
#docker build -t $IMAGE_NAME .

# Needed since I'm on ARM, while my pods are linux :D
# see https://beebom.com/how-fix-exec-user-process-caused-exec-format-error-linux/
docker buildx build --platform=linux/amd64 --load -t $IMAGE_NAME:latest .