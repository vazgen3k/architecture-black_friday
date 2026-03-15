#!/bin/bash

echo "Initializing shard1 replica set..."

docker exec -i shard1 mongosh --port 27018 <<EOF
rs.initiate({
  _id: "shard1",
  members: [
    { _id: 0, host: "shard1:27018" }
  ]
});
exit();
EOF

echo "Shard1 initialized."


echo "Initializing shard2 replica set..."

docker exec -i shard2 mongosh --port 27019 <<EOF
rs.initiate({
  _id: "shard2",
  members: [
    { _id: 1, host: "shard2:27019" }
  ]
});
exit();
EOF

echo "Shard2 initialized."

echo "Shard replica sets initialization complete."