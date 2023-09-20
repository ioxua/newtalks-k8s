#!/bin/bash
set -e

# Set env vars if not set
if [[ -z "${IOXUA_NT_K8S_SET}" ]]; then
  # Get env vars from .env
  # see https://stackoverflow.com/a/32761920/7988516
  set -a
  source .env
  set +a

  #echo $GH_CR_PAT

  export IOXUA_NT_K8S_SET=true
fi