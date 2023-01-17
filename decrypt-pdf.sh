#!/usr/bin/env bash

set -euox pipefail

# Check if qpdf is installed
if ! command -v qpdf &> /dev/null
then
    echo "qpdf could not be found"
    exit 1
fi

# Check input file
if [ ! -f "$1" ]; then
    echo "File $1 does not exist"
    exit 1
fi

TEMP_FILE="$(uuidgen).pdf"

qpdf --decrypt "$1" "$TEMP_FILE"
mv "$TEMP_FILE" "$1"
