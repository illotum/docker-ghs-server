#!/bin/sh

set -euo pipefail

SERVER_URL=$(curl -s https://api.github.com/repos/Lurkars/ghs-server/releases/latest | \
	grep browser_download_url | \
	cut -d '"' -f 4)
CLIENT_URL=$(curl -s https://api.github.com/repos/Lurkars/gloomhavensecretary/releases/latest | \
	grep browser_download_url | \
	cut -d '"' -f 4 | \
	grep '\.zip$')

VERSION=$(basename ${SERVER_URL#*-v} .jar)
MINOR_VERSION=$(echo $VERSION | cut -d. -f1-2)

docker build . \
	--build-arg SERVER_ARTIFACT=$SERVER_URL \
	--build-arg CLIENT_ARTIFACT=$CLIENT_URL \
	-t illotum/ghs-server:$VERSION \
	-t illotum/ghs-server:$MINOR_VERSION \
	-t illotum/ghs-server:latest \
