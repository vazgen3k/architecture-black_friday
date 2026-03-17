#!/bin/bash

set -e

echo "Initializing shard1 replica set..."

docker exec -i shard1_1 mongosh --port 27018 <<EOF
rs.initiate({
  _id: "shard1",
  members: [
    { _id: 0, host: "shard1_1:27018" },
    { _id: 1, host: "shard1_2:27021" },
    { _id: 2, host: "shard1_3:27022" }
  ]
});
exit();
EOF

echo "Shard1 initialized."

echo "Initializing shard2 replica set..."

docker exec -i shard2_1 mongosh --port 27019 <<EOF
rs.initiate({
  _id: "shard2",
  members: [
    { _id: 0, host: "shard2_1:27019" },
    { _id: 1, host: "shard2_2:27023" },
    { _id: 2, host: "shard2_3:27024" }
  ]
});
exit();
EOF

echo "Shard2 initialized."

echo "Shard replica sets initialization complete."