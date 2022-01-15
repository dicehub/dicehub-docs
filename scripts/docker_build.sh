#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")/.." || exit 1
echo "=> Running script at path $(pwd) as $(whoami) ..."
echo

REGISTRY=${CI_REGISTRY_IMAGE:-dicehub/dicehub-docs}
VERSION=${CI_COMMIT_TAG:-latest}

docker build -t ${REGISTRY}:${VERSION} .
