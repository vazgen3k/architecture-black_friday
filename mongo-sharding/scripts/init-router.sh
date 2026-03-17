#!/bin/bash

set -e

echo "Initializing mongos router and enabling sharding..."

docker exec -i mongos_router mongosh --port 27020 <<'EOF'
sh.addShard("shard1/shard1:27018");
sh.addShard("shard2/shard2:27019");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { name: "hashed" });

exit();
EOF

echo "Router initialized and sharding enabled."