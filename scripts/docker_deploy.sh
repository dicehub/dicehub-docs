#!/bin/bash

set -euo pipefail

cd "$(dirname "$0")/.." || exit 1
echo "=> Running script at path $(pwd) as $(whoami) ..."
echo

AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2
AWS_DEFAULT_REGION=$3
CLOUDFRONT_DISTRIBUTION_ID=$4

docker run --rm -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION dicehub/dicehub-docs:latest bash -c "aws s3 sync --exact-timestamps /app/site/ s3://www-docs-staging-dicehub-com/ && aws cloudfront create-invalidation --distribution-id ${CLOUDFRONT_DISTRIBUTION_ID} --paths '/*'"
