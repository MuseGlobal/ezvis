#!/bin/bash

if [ "$MONGO_HOST_PORT" == "" ]; then
  MONGO_HOST_PORT=${EZMASTER_MONGODB_HOST_PORT:-$(jq -r -M .MONGO_HOST_PORT /app/example/data.json | grep -v null)}
fi
if [ "$MONGO_DATABASE" == "" ]; then
  MONGO_DATABASE=${EZMASTER_TECHNICAL_NAME:-ezvis}
fi

echo "Running ezvis connected to mongodb://$MONGO_HOST_PORT/$MONGO_DATABASE"
./cli /app/example/data --connexionURI "mongodb://$MONGO_HOST_PORT/$MONGO_DATABASE" --port 3000
