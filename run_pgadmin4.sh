#!/bin/bash

source bash_commons/network.sh
source pgadmin4_config

website_addr="http://localhost:$PGADMIN4_LOCAL_PORT"

docker run -p $PGADMIN4_LOCAL_PORT:80 -e "PGADMIN_DEFAULT_EMAIL=$PGADMIN4_EMAIL" -e "PGADMIN_DEFAULT_PASSWORD=$PGADMIN4_PASS" --name $PGADMIN4_CONTAINER_NAME  -d dpage/pgadmin4

wait_for_site $website_addr
echo "pgadmin4 is active"
echo "running browser..."
sensible-browser http://localhost:$PGADMIN4_LOCAL_PORT


