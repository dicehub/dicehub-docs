#!/bin/bash

#
# Based on: https://gitlab.com/gitlab-org/gitlab-docs/-/blob/main/scripts/compress_images.sh
#

set -euo pipefail


cd "$(dirname "$0")/.." || exit 1
echo "=> Running script at path $(pwd) as $(whoami) ..."
echo

TARGET="$1"
PNGQUANT=$(which pngquant)
PNG="$PNGQUANT -f --skip-if-larger --ext .png --speed 1"

if [ -z "$TARGET" ]; then
  echo "Usage: $0 <target>"
  echo "No target provided. Exiting."
  exit 1
fi

if ! [ -d "$TARGET" ]; then
  echo "Target directory $TARGET does not exist. Exiting."
  exit 1
fi

# Compress images
for image in $(find ${TARGET}/ -name "*.png")
  do $PNG $image
  echo "Compressing $image"
done

