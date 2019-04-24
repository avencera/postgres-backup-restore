#! /bin/sh

# exit if a command fails
set -e

apk update

# install pg_dump
apk add --no-cache postgresql-client

# install s3 tools
apk add --no-cache python py2-pip
pip install awscli
apk del --no-cache py2-pip

# install go-cron
apk add curl --no-cache --virtual .build-deps
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.6/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron
apk del curl
apk del .build-deps 

# cleanup
rm -rf /var/cache/apk/*
