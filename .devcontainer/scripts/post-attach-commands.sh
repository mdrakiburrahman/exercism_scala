#!/bin/bash -xe

echo "Starting Apache Spark..."

sudo /opt/spark/sbin/start-master.sh
sudo /opt/spark/sbin/start-worker.sh spark://$(hostname):7077

echo "Master UI: http://localhost:8080/"
echo "Workers UI: http://localhost:8081/"

echo "Post-Attach Commands Complete!"
