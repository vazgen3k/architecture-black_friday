#!/bin/bash

set -e

sleep 5

docker exec -i mongos_router mongosh --port 27020 --eval '
db = db.getSiblingDB("somedb");
for (let i = 0; i < 1000; i++) {
  db.helloDoc.insertOne({ age: i, name: "ly" + i });
}
print("count=" + db.helloDoc.countDocuments());
'

echo "Seed completed."