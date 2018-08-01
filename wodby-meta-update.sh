#!/bin/bash

set -ex

for filename in Dockerfile-caveman-alpine Dockerfile-alpine; do
    cp "${filename}.template" tmp

    # Change basic image.
    sed -i '/FROM alpine/i\ARG BASE_IMAGE_TAG\n' tmp
    sed -i '/FROM alpine/a\\nARG PYTHON_DEBUG' tmp
    sed -i 's/FROM alpine.*/FROM wodby\/alpine:${BASE_IMAGE_TAG}/' tmp

    # For -debug images.
    sed -i '/\&& make -j/i\        $(test "${PYTHON_DEBUG}" = 1 && echo '"'"'--with-pydebug'"'"') \\' tmp
    # Optional pip debug symbols stripping (with ;).
    sed -i -E '/^\s+find \/usr\/local -depth.+?/i\    if [[ $PYTHON_DEBUG != 1 ]]; then { \\' tmp
    sed -i '/-exec rm -rf '"'"'{}'"'"' +;/a\    } fi; \\' tmp
    # Optional python debug symbols stripping (with &&).
    sed -i -E 's/&& (find \/usr\/local -depth.+?)/\&\& if [[ $PYTHON_DEBUG != 1 ]]; then { \\\n    \1/' tmp
    sed -i '/-exec rm -rf '"'"'{}'"'"' + \\/a\    } fi \\' tmp
    sed -i -E 's/(-exec rm -rf '"'"'\{\}'"'"' \+) \\/\1\; \\/' tmp

    mv tmp "${filename}.wodby.template"
done

cp update.sh tmp

# Use our template for fmp alpine variants.
sed -i 's/Dockerfile-${template}.template/Dockerfile-${template}.wodby.template/' tmp
# Only alpine 3.8
sed -i '/wheezy,jessie,stretch/d' tmp
sed -i '/windows\/nanoserver/d' tmp
sed -i '/windows\/windowsservercore/d' tmp
sed -i 's/alpine{3.6,3.7,3.8}/alpine3.8/' tmp
sed -i 's/\/Dockerfile"/\/Dockerfile.wodby"/' tmp
## Do not modify CI files.
sed -i -E 's/^(echo "\$travis.*)/#\1/' tmp
sed -i -E 's/^(echo "\$appveyor.*)/#\1/' tmp

# Update travis.yml
sed -i '/$fullVersion"$/a\    sed -i -E "s/(PYTHON${version//.})=.*/\\1=$fullVersion/" .travis.yml' tmp
# Update README.
sed -i '/$fullVersion"$/a\    sed -i -E "s/\\`${version}\.[0-9]+\\`/\\`$fullVersion\\`/" README.md' tmp
sed -i '/$fullVersion"$/a\\n    sed -i -E "s/\\`${version}\.[0-9]+-debug\\`/\\`$fullVersion-debug\\`/" README.md' tmp

mv tmp update.wodby.sh

./update.wodby.sh

rm *.wodby.template
rm update.wodby.sh