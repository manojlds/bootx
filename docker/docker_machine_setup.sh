#!/usr/bin/env bash

echo "Root dir - $1"
docker-machine create --driver virtualbox dev
docker-machine scp $1/docker/bootsync.sh dev:/tmp/bootsync.sh
docker-machine ssh dev "sudo mv /tmp/bootsync.sh /var/lib/boot2docker/bootsync.sh"
docker-machine restart dev
