#!/bin/bash -l
#$ -S /bin/bash

#PACKAGE_VERSION=$(cat Dockerfile \
#  | grep LABEL \
#  | grep version \
#  | awk -F= '{print $2}' \
#  | sed 's/[",]//g' \
#  | tr -d '[[:space:]]'
# )

PACKAGE_VERSION=$(git describe --tags $(git rev-list --tags --max-count=1))

docker build -t klimby/e-nginx:$PACKAGE_VERSION -t klimby/e-nginx:latest .

docker push klimby/e-nginx:$PACKAGE_VERSION

docker push klimby/e-nginx:latest

# rm *.tar

# docker save klimby/e-nginx:$PACKAGE_VERSION klimby/e-nginx:latest > e-nginx.$PACKAGE_VERSION.tar
# docker save klimby/e-nginx:$PACKAGE_VERSION klimby/e-nginx:latest nginx:1.15-alpine > e-nginx.tar

# git tag -a $PACKAGE_VERSION -m "version $PACKAGE_VERSION"

# ls -sh e-nginx.tar

