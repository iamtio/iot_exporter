#!/bin/bash -e
OWNER=$(git remote get-url origin | sed 's/.*github\.com:\([^/]*\).*/\1/')
REF=$(git symbolic-ref -q --short HEAD || git describe --tags --exact-match)
TAG=$OWNER/iot_exporter:${VERSION:-$REF}
MACHINE=$(uname -m)

docker build -t $TAG .
docker image save -o iot_exporter_${VERSION:-$REF}_$MACHINE.tar $TAG 