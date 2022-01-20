#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")/.." || exit 1
echo "=> Running script at path $(pwd) as $(whoami) ..."
echo

FILES="./guide"

docker run --rm -v $(pwd)/docs:/docs -v $(pwd)/.vale.ini:/.vale.ini -w /docs registry.dicehub.org/dicehub-com/docker-images/dicehub-base-images:markdownlint-0.30.0-vale-2.13.0 vale --config /.vale.ini $FILES
