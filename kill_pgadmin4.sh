#!/bin/bash

source pgadmin4_config

container_id=$(docker ps | grep "$PGADMIN4_CONTAINER_NAME" | awk '{print $1}')

if test -z "$container_id"; then
    echo "$PGADMIN4_CONTAINER_NAME is not running, bye"
    exit 0
fi

# Stop pgadmin4 container
while true
do
    echo "Stopping $PGADMIN4_CONTAINER_NAME container..."
    docker stop "$container_id"
    res=$(docker ps | grep "$PGADMIN4_CONTAINER_NAME")
    if test -z "$res"; then
        break
    fi
    sleep 1
done
echo "$PGADMIN4_CONTAINER_NAME is stopped"

# Remove pgadmin4 container
while true
do
    echo "Removing $PGADMIN4_CONTAINER_NAME container..."
    docker rm "$PGADMIN4_CONTAINER_NAME"
    res=$(docker ps -a | grep "$PGADMIN4_CONTAINER_NAME")
    if test -z "$res"; then
        break
    fi
done
echo "$PGADMIN4_CONTAINER_NAME removed"

echo "Bye"


