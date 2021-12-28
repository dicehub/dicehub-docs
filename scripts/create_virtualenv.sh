#!/bin/bash

set -xeuo pipefail

cd "$(dirname "$0")/.." || exit 1
echo "=> Running script at path $(pwd) as $(whoami) ..."
echo

python3 -m venv .venv
