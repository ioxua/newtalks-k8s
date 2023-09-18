#!/bin/bash
set -e

cd backend

# Gradle: build jar file
./gradlew clean build

# Using podman
#podman build -t i-k8s-demo-img .
docker build -t i-k8s-demo-img .