#!/usr/bin/env bash
if [ "$USER" == "docker" ]; then
  export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
  export HOME="/home/docker"
fi

docker-compose -f docker-compose-release.yml pull \
  && exec docker-compose -f docker-compose-release.yml up --force-recreate
