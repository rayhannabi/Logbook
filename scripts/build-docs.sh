#!/bin/bash

set -e

xcodebuild docbuild \
    -scheme Logbook \
    -configuration Release \
    -derivedDataPath build/

DOCARCHIVE_PATH="$(find build -type d -name 'Logbook.doccarchive' | head -n 1)"

echo 'Cleaning up docs'
rm -rf docs/public
mkdir -p docs/public
echo 'Copying contents from archive'
cp -r ${DOCARCHIVE_PATH}/* docs/public
