#!/bin/sh
source ./.env
source ./.secret.env
cmd="DOCKER_API_VERSION=1.22 DOCKER_HOST=${LOCAL_RESIN_DOCKER_URL} docker-compose -f docker-compose.yml -f docker-compose.dev.yml $1"
echo $cmd
eval $cmd
