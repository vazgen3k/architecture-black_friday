#!/bin/bash

echo "Initializing MongoDB config server replica set"

docker exec -i configSrv mongosh --port 27017 <<EOF
rs.initiate({
  _id: "config_server",
  configsvr: true,
  members: [
    { _id: 0, host: "configSrv:27017" }
  ]
});
exit();
EOF

echo "Config server replica set initialized."