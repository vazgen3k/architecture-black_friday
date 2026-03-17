#!/bin/bash

set -e

echo "Initializing mongos router and enabling sharding..."

docker exec -i mongos_router mongosh --port 27020 <<'EOF'
sh.addShard("shard1/shard1_1:27018,shard1_2:27021,shard1_3:27022");
sh.addShard("shard2/shard2_1:27019,shard2_2:27023,shard2_3:27024");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { name: "hashed" });

exit();
EOF

echo "Router initialized and sharding enabled."