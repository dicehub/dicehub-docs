#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")/.." || exit 1
echo "=> Running script at path $(pwd) as $(whoami) ..."
echo

docker run --rm -v $(pwd)/docs:/docs -v $(pwd)/.markdownlint.yaml:/.markdownlint.yaml -w /docs registry.dicehub.org/dicehub-com/docker-images/dicehub-base-images:markdownlint-0.30.0-vale-2.13.0 markdownlint -c /.markdownlint.yaml './**/*.md'
