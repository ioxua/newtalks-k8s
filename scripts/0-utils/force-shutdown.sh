#/bin/bash
set -e

DOMAIN=http://4.228.36.26
# DOMAIN=http://localhost:8080
curl -X POST $DOMAIN/actuator/shutdown