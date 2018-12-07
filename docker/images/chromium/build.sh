#!/bin/bash

export LASTCHANGE_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2FLAST_CHANGE?alt=media"
REVISION=$(curl -s -S $LASTCHANGE_URL)
docker build --build-arg REVISION=$REVISION --squash -t alpharecon19/chromium:latest .

version="$(docker run -it alpharecon19/chromium:latest --version)"
regex='Chromium.(.*)'
[[ $version =~ $regex ]]
version="${BASH_REMATCH[1]}";
tag="alpharecon19/chromium:${version}"

echo "Run the following commands to push this to the docker hub"
echo ""
echo "docker tag alpharecon19/chromium:latest ${tag}"
echo "docker push ${tag}"
